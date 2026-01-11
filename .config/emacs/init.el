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
  (confirm-kill-processes nil)
  (create-lockfiles nil)
  (make-backup-files nil)
  (ring-bell-function 'ignore)
  :config
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (set-face-font 'default "MesloLGS NF")
  (unless (display-graphic-p)
    (set-face-background 'default "unspecified-bg")))

(use-package evil
  :ensure t
  :preface
  (defun my-evil-without-clipboard (orig-fun &rest args)
    (let ((interprogram-cut-function nil)
          (interprogram-paste-function nil))
      (apply orig-fun args)))
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-split-window-below t)
  (setq evil-undo-system 'undo-redo)
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
  (advice-add 'evil-delete :around #'my-evil-without-clipboard)
  (advice-add 'evil-paste-before :around #'my-evil-without-clipboard)
  (advice-add 'evil-paste-after :around #'my-evil-without-clipboard))

(use-package add-node-modules-path
  :ensure t
  :hook (flycheck-mode . add-node-modules-path)
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

(use-package centaur-tabs
  :demand t
  :ensure t
  :bind (:map evil-normal-state-map
         ("C-p" . centaur-tabs-backward)
         ("C-n" . centaur-tabs-forward))
  :custom
  (centaur-tabs-cycle-scope 'tabs)
  (centaur-tabs-excluded-prefixes '("*" " *"))
  (centaur-tabs-set-icons t)
  (centaur-tabs-set-modified-marker t)
  :config
  (centaur-tabs-mode t))

(use-package citar
  :after org
  :ensure t
  :custom
  (citar-bibliography (concat org-directory "/references.bib")))

(use-package citar-org-roam
  :after (citar org-roam)
  :ensure t
  :config
  (citar-org-roam-mode))

(use-package clipetty
  :ensure t
  :hook (after-init . global-clipetty-mode))

(use-package consult
  :ensure t
  :bind (:map evil-normal-state-map
         ("SPC b" . consult-buffer)
         ("SPC g" . consult-ripgrep)
         ("SPC h" . consult-recent-file)))

(use-package djvu
  :ensure t)

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

(use-package evil-embrace
  :ensure t
  :config
  (setq evil-embrace-show-help-p nil)
  (add-hook 'org-mode-hook 'embrace-org-mode-hook)
  (evil-embrace-enable-evil-surround-integration))

(use-package evil-org
  :after org
  :ensure t
  :functions evil-define-minor-mode-key
  :hook (org-mode . evil-org-mode)
  :config
  (evil-define-key 'normal 'evil-org-mode (kbd "M-h") 'windmove-swap-states-left)
  (evil-define-key 'normal 'evil-org-mode (kbd "M-j") 'windmove-swap-states-down)
  (evil-define-key 'normal 'evil-org-mode (kbd "M-k") 'windmove-swap-states-up)
  (evil-define-key 'normal 'evil-org-mode (kbd "M-l") 'windmove-swap-states-right)
  (advice-add 'evil-org-delete-char :around #'my-evil-without-clipboard)
  (advice-add 'evil-org-delete-backward-char :around #'my-evil-without-clipboard))

(use-package evil-org-agenda
  :after org-agenda
  :functions evil-org-agenda-set-keys
  :config
  (evil-org-agenda-set-keys))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

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
         ("] d" . flycheck-next-error))
  :custom
  (flycheck-display-errors-delay 0.1))

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

(use-package helpful
  :ensure t
  :bind (([remap describe-function] . helpful-callable)
         ([remap describe-command]  . helpful-command)
         ([remap describe-variable] . helpful-variable)
         ([remap describe-key]      . helpful-key)))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package nov
  :ensure t
  :mode ("\\.epub\\'" . nov-mode)
  :hook (nov-mode . visual-line-mode)
  :custom
  (nov-text-width t))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package org
  :bind (:map evil-normal-state-map
         ("SPC n a" . org-agenda)
         ("SPC n n" . org-capture))
  :custom
  (org-directory "~/ghq/github.com/nakatuba/org")
  (org-agenda-files (directory-files-recursively org-directory "\\.org$"))
  (org-default-notes-file (concat org-directory "/notes.org")))

(use-package org-appear
  :ensure t
  :hook (org-mode . org-appear-mode)
  :custom
  (org-appear-autolinks t)
  (org-appear-autosubmarkers t)
  (org-appear-autoentities t))

(use-package org-cliplink
  :ensure t)

(use-package org-modern
  :ensure t
  :custom
  (org-hide-emphasis-markers t)
  (org-pretty-entities t))

(use-package org-noter
  :ensure t
  :custom
  (org-noter-notes-search-path (list org-directory)))

(use-package org-roam
  :ensure t
  :bind (:map evil-normal-state-map
         ("SPC n o" . org-roam-node-find))
  :custom
  (org-roam-directory org-directory)
  (org-roam-capture-templates
   '(("l" "Literature Note" plain "%?"
      :target (file+head "literature/%<%Y%m%d%H%M%S>.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("p" "Permanent Note" plain "%?"
      :target (file+head "permanent/%<%Y%m%d%H%M%S>.org" "#+title: ${title}\n")
      :unnarrowed t)))
  (org-roam-node-display-template (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  :config
  (cl-defmethod org-roam-node-type ((node org-roam-node))
    (condition-case nil
        (file-name-nondirectory
         (directory-file-name
          (file-name-directory
           (file-relative-name (org-roam-node-file node) org-roam-directory))))
      (error "")))
  (org-roam-db-autosync-mode))

(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :bind (:map pdf-view-mode-map
         ("s-c" . pdf-view-kill-ring-save))
  :custom
  (pdf-view-display-size 'fit-page)
  (pdf-view-selection-style 'glyph))

(use-package persp-projectile
  :ensure t
  :bind (:map evil-normal-state-map
         ("C-s s" . projectile-persp-switch-project)))

(use-package perspective
  :ensure t
  :functions persp-switch
  :hook (kill-emacs . persp-state-save)
  :custom
  (persp-state-default-file (concat user-emacs-directory "persp-state"))
  (persp-suppress-no-prefix-key-warning t)
  :init
  (persp-mode)
  (when (file-exists-p persp-state-default-file)
    (persp-state-load persp-state-default-file))
  (persp-switch "main"))

(use-package popper
  :ensure t
  :hook (after-init . popper-mode)
  :custom
  (popper-display-control nil)
  (popper-mode-line nil)
  (popper-reference-buffers
   '("\\*Agenda Commands\\*"
     "\\*Org Select\\*"
     "\\*vterm\\*")))

(use-package projectile
  :ensure t
  :bind (:map evil-normal-state-map
         ("SPC f" . projectile-find-file))
  :config
  (projectile-mode 1))

(use-package recentf
  :hook (after-init . recentf-mode))

(use-package shackle
  :ensure t
  :hook (after-init . shackle-mode)
  :custom
  (shackle-rules
   '(("\\*Agenda Commands\\*" :regexp t :align t)
     ("\\*Org Select\\*"      :regexp t :align t)
     ("\\*vterm\\*"           :regexp t :align t :size 0.3))))

(use-package smartparens
  :ensure t
  :hook (after-init . smartparens-global-mode)
  :config
  (require 'smartparens-config))

(use-package treemacs
  :ensure t
  :bind (:map evil-normal-state-map
         ("SPC e" . treemacs)))

(use-package treemacs-nerd-icons
  :after treemacs
  :ensure t
  :config
  (treemacs-nerd-icons-config))

(use-package treemacs-perspective
  :after (treemacs perspective)
  :ensure t
  :functions treemacs-set-scope-type
  :config
  (treemacs-set-scope-type 'Perspectives))

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

(use-package visual-fill-column
  :ensure t
  :hook (visual-line-mode . visual-fill-column-for-vline)
  :custom
  (visual-fill-column-center-text t))

(use-package vterm
  :ensure t
  :functions (evil-insert-state evil-define-key*)
  :hook (vterm-mode . (lambda ()
                        (setq-local evil-insert-state-cursor 'box)
                        (evil-insert-state)))
  :config
  (evil-define-key 'insert vterm-mode-map (kbd "<escape>") 'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-\\ C-n") 'evil-normal-state)
  (evil-define-key 'insert vterm-mode-map (kbd "C-g") 'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-h") 'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-u") 'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-w") 'vterm--self-insert))

(use-package vterm-toggle
  :ensure t
  :bind (("C-SPC" . vterm-toggle)
         :map vterm-mode-map
         ("C-SPC" . vterm-toggle))
  :custom
  (vterm-toggle-scope 'project))

(use-package windmove
  :bind (:map evil-normal-state-map
         ("M-h" . windmove-swap-states-left)
         ("M-j" . windmove-swap-states-down)
         ("M-k" . windmove-swap-states-up)
         ("M-l" . windmove-swap-states-right)))
