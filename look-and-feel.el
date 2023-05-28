;;; package --- Summary
;;; Commentary:
;;; Code:

;; Load color scheme
(load-theme 'solarized-gruvbox-dark t)

;; Disable Beep
(setq ring-bell-function 'ignore)

;; Disable scrollbar and toolbar
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Show column number at the bottom of the buffer
(setq column-number-mode t)

(subword-mode)

;; show tabs
(whitespace-mode)
(setq whitespace-style '(trailing tabs tab-mark))

;; Show linenumber at the beginning of the line
(global-display-line-numbers-mode)

(use-package smooth-scrolling
  :ensure t
  :init
  (smooth-scrolling-mode 1))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))

(use-package nerd-icons
  :ensure t
  :init)

(use-package fontawesome
  :ensure t
  :init)

;; (defun my-god-mode-update-cursor-type ()
;;   (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))

(add-hook 'post-command-hook #'my-god-mode-update-cursor-type)

;; (setq god-mode-enable-function-key-translation nil)
;; (require 'god-mode)
;; (global-set-key (kbd "<escape>") #'god-local-mode)
;; (global-set-key (kbd "M-g C-g") #'god-local-mode)
;; (define-key god-local-mode-map [(i)] #'god-local-mode)

(use-package undo-tree
  :ensure t
  :init
  (undo-tree-mode))

(provide 'look-and-feel)
;;; look-and-feel.el ends here
