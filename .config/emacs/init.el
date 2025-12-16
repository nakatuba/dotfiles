(setq org-directory "~/ghq/github.com/nakatuba/org")
(setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))
(setq org-default-notes-file (concat org-directory "/notes.org"))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

(use-package evil
  :ensure t
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-insert-state-map (kbd "C-u") 'evil-delete-back-to-indentation)
  (define-key evil-insert-state-map (kbd "C-w") 'evil-delete-backward-word)
  (define-key evil-normal-state-map (kbd "s") 'evil-window-map))
