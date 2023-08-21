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

;; Highlight opening and closing delimeters
(show-paren-mode)

;;; Auto complete parens
(electric-pair-mode)



;;; Spell checker (useful for comments)
;;; TODO prog-mode hooks for various programming languages
(flyspell-prog-mode)

;; TODO customize this more. Take a look at: https://github.com/justbur/emacs-which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  (add-hook 'java-mode-hook 'lsp)
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp))

(use-package company
  :ensure t
  :init
  (global-company-mode))

(use-package yasnippet
  :config
  (yas-global-mode))
(define-key yas-minor-mode-map (kbd "C-TAB") yas-maybe-expand)

(use-package yasnippet-snippets
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  ;; don't bother me with errors until I save 
  (setq flycheck-check-syntax-automatically '(mode-enabled save)))

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

;; (add-hook 'post-command-hook #'my-god-mode-update-cursor-type)

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
