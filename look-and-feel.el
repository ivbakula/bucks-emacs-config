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

(defun my-god-mode-update-cursor-type ()
  (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))

(add-hook 'post-command-hook #'my-god-mode-update-cursor-type)

(setq god-mode-enable-function-key-translation nil)
(require 'god-mode)
(god-local-mode)
(global-set-key (kbd "<escape>") #'god-local-mode)
(define-key god-local-mode-map [(i)] #'god-local-mode)

(use-package undo-tree
  :ensure t
  :init
  (undo-tree-mode))

(provide 'look-and-feel)
;;; look-and-feel.el ends here
