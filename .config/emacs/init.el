(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package evil
  :ensure t
  :init
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  (setq evil-want-C-h-delete t)
  (setq evil-want-C-u-delete t)
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "s") 'evil-window-map))
