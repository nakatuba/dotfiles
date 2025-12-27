;;; init.el -*- lexical-binding: t; -*-

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  (setq evil-want-keybinding nil))

(use-package emacs
  :custom
  (auto-save-default nil)
  (create-lockfiles nil)
  (make-backup-files nil)
  :config
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (unless (display-graphic-p)
    (set-face-background 'default "unspecified-bg")))

(use-package evil
  :ensure t
  :preface
  (defun my-evil-disable-clipboard (orig-fun &rest args)
    (let ((interprogram-cut-function nil))
      (apply orig-fun args)))
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-insert-state-map (kbd "C-u") 'evil-delete-back-to-indentation)
  (define-key evil-insert-state-map (kbd "C-w") 'evil-delete-backward-word)
  (define-key evil-normal-state-map (kbd "q") nil)
  (define-key evil-normal-state-map (kbd "s") 'evil-window-map)
  (advice-add 'evil-delete :around #'my-evil-disable-clipboard)
  (advice-add 'evil-change :around #'my-evil-disable-clipboard))

(use-package add-node-modules-path
  :ensure t
  :hook (org-mode . add-node-modules-path)
  :custom
  (add-node-modules-path-command '("echo \"$(npm root)/.bin\"")))

(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode 1)
  (setf (alist-get 'textlint apheleia-formatters)
        '("textlint" "--fix" inplace))
  (setf (alist-get 'org-mode apheleia-mode-alist)
        '(textlint)))

(use-package autorevert
  :config
  (global-auto-revert-mode 1))

(use-package avy
  :ensure t
  :bind (:map evil-normal-state-map
         ("SPC w" . avy-goto-word-0)))

(use-package clipetty
  :ensure t
  :hook (after-init . global-clipetty-mode))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode 1))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

(use-package evil-collection
  :after evil
  :ensure t
  :custom
  (evil-collection-key-blacklist '("SPC" "s"))
  :config
  (evil-collection-init))

(use-package evil-org
  :after org
  :ensure t
  :hook (org-mode . evil-org-mode)
  :config
  (advice-add 'evil-org-delete-char :around #'my-evil-disable-clipboard)
  (advice-add 'evil-org-delete-backward-char :around #'my-evil-disable-clipboard))

(use-package evil-org-agenda
  :after org-agenda
  :functions evil-org-agenda-set-keys
  :config
  (evil-org-agenda-set-keys))

(use-package evil-terminal-cursor-changer
  :unless (display-graphic-p)
  :ensure t
  :config
  (evil-terminal-cursor-changer-activate))

(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode)
  :bind (:map evil-normal-state-map
         ("[ d" . flycheck-previous-error)
         ("] d" . flycheck-next-error)))

(use-package flycheck-popup-tip
  :after flycheck
  :ensure t
  :hook (flycheck-mode . flycheck-popup-tip-mode))

(use-package good-scroll
  :ensure t
  :functions (good-scroll--window-usable-height good-scroll-move)
  :preface
  (defun good-scroll--convert-line-to-step (line)
    (cond ((integerp line) (* line (line-pixel-height)))
          ((or (null line) (memq '- line))
           (- (good-scroll--window-usable-height)
              (* next-screen-context-lines (line-pixel-height))))
          ((line-pixel-height))))
  (defun my-good-scroll-up (fn &optional arg)
    (if good-scroll-mode
        (good-scroll-move (good-scroll--convert-line-to-step arg))
      (funcall fn arg)))
  (defun my-good-scroll-down (fn &optional arg)
    (if good-scroll-mode
        (good-scroll-move (- (good-scroll--convert-line-to-step arg)))
      (funcall fn arg)))
  :config
  (good-scroll-mode 1)
  (advice-add 'scroll-up :around #'my-good-scroll-up)
  (advice-add 'scroll-down :around #'my-good-scroll-down))

(use-package nov
  :ensure t
  :mode ("\\.epub\\'" . nov-mode))

(use-package org
  :bind (:map evil-normal-state-map
         ("SPC n a" . org-agenda)
         ("SPC n n" . org-capture))
  :config
  (setq org-directory "~/ghq/github.com/nakatuba/org")
  (setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))
  (setq org-default-notes-file (concat org-directory "/notes.org")))

(use-package org-appear
  :ensure t
  :hook (org-mode . org-appear-mode)
  :custom
  (org-appear-autolinks t))

(use-package org-cliplink
  :ensure t)

(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :bind (:map pdf-view-mode-map
         ("s-c" . pdf-view-kill-ring-save))
  :custom
  (pdf-view-display-size 'fit-page)
  (pdf-view-selection-style 'glyph))

(use-package ultra-scroll
  :ensure t
  :custom
  (scroll-conservatively 101)
  :config
  (ultra-scroll-mode 1))

(use-package vertico
  :ensure t
  :functions (vertico--metadata-get evil-delete-backward-word)
  :preface
  (defun my-vertico-delete-backward-word ()
    (interactive)
    (if (eq 'file (vertico--metadata-get 'category))
        (vertico-directory-up)
      (evil-delete-backward-word)))
  :bind (:map vertico-map
         ("C-h" . delete-backward-char)
         ("C-u" . evil-delete-back-to-indentation)
         ("C-w" . my-vertico-delete-backward-word))
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))
