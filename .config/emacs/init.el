;;; init.el -*- lexical-binding: t; -*-

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")))
  (package-initialize))

(use-package emacs
  :config
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode 1))

(use-package evil
  :ensure t
  :preface
  (defun my-evil-disable-clipboard (orig-fun &rest args)
    (let ((select-enable-clipboard nil))
      (apply orig-fun args)))
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-insert-state-map (kbd "C-u") 'evil-delete-back-to-indentation)
  (define-key evil-insert-state-map (kbd "C-w") 'evil-delete-backward-word)
  (define-key evil-normal-state-map (kbd "s") 'evil-window-map)
  (advice-add 'evil-delete :around #'my-evil-disable-clipboard)
  (advice-add 'evil-change :around #'my-evil-disable-clipboard))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package org
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :config
  (setq org-directory "~/ghq/github.com/nakatuba/org")
  (setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))
  (setq org-default-notes-file (concat org-directory "/notes.org")))

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
