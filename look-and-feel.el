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


(provide 'look-and-feel)
;;; look-and-feel.el ends here
