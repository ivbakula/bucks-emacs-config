;;; package --- Summary
;;; Commentary:
;;; Code:

;; I mindlessly press ESC, so stop me from wreacking havoc
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil-leader
  :ensure t)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-set-leader 'normal (kbd "SPC"))

(use-package evil
  :ensure t
  :config
  (progn
	(evil-mode 1)
	(setq evil-defult-cursor t)))

(setq evil-want-fine-undo t)

(provide 'evil-config)
;;; evil-config.el ends here
