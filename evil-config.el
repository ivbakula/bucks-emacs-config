;;; package --- Summary
;;; Commentary:
;;; Code:

;; I mindlessly press ESC, so stop me from wreacking havoc
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)

  :config
  (progn
    (setq evil-default-cursor t)
    (setq evil-want-fine-undo t)
    (evil-mode 1)))

(use-package evil-collection
  :ensure t
  :config
  (progn
    (evil-collection-init '(calendar dired calc ediff magit compilation-mode help))))

(setq compilation-mode-map evil-normal-state-map
      magit-mode-map evil-normal-state-map)


(use-package evil-leader
  :ensure t)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-set-leader 'normal (kbd "SPC"))

(provide 'evil-config)
;;; evil-config.el ends here
