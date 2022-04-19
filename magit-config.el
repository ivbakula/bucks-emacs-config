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

(defhydra magit-hydra (:exit t :color blue :hint nil)
  "
  _s_tatus  _l_og   _p_ull  _r_emote
  _b_ranch  _S_how  _P_ush  _c_lone
  "
  ("s" (lambda ()
	 (interactive)
	 (magit-status)) :color green)
  ("b" (lambda ()
	 (interactive)
	 (magit-branch)) :color blue)
  ("l" (lambda ()
	 (interactive)
	 (magit-log)) :color blue)
  ("S" (lambda ()
	 (interactive)
	 (magit-show)) :color blue)
  ("p" magit-pull :color blue)
  ("P" magit-push :color blue)
  ("c" magit-clone :color blue)
  ("r" magit-remote :color blue))

;; Todo - add magit mode hydra

(provide 'magit-config)
;;; magit-config.el ends here
