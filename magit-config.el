;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package magit
  :ensure t
  :init
  (setq magit-auto-revert-mode nil)

  :config)

(setq magit-pre-display-buffer-hook 'magit-save-window-configuration             ;; save current window config
      magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1    ;; show magit buffer on whole frame
      magit-bury-buffer-function 'magit-restore-window-configuration)            ;; bury live magit buffer and rener windows stored with pre-display-buffer-hook

;; Todo - add main-menu magit hydra (status, clone, pull, push, remote)

;; Todo - add magit mode hydra

(provide 'magit-config)
;;; magit-config.el ends here
