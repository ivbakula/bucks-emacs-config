;;; package --- Summary
;;; Commentary:
;;; Code:
;; clang-tidy and clang-format

(use-package flycheck-clang-tidy
  :ensure t
  :after flycheck
  :hook (flycheck-mode . flycheck-clang-tidy-setup))

(use-package clang-format+
  :ensure t
  :hook (c-mode-common-hook . clang-format+-mode))

(require 'rtags)
(load-file (concat EMACS_DIR "rtags/src/rtags.el"))
(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

(use-package google-c-style
  :ensure t)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(setq c-basic-offset 4)            ;; set 4 spaces indentation level (java, c, c++)

(use-package rtags
  :ensure t
  :hook (c++-mode . rtags-start-process-unless-running)
  :config (setq rtags-completions-enabled t
		rtags-path (concat EMACS_DIR "rtags/src/rtags.el")
		rtags-rc-binary-name (concat EMACS_DIR "rtags/bin/rc")
		rtags-use-helm t
		rtags-rdm-binary-name (concat EMACS_DIR "rtags/bin/rdm"))
  :bind (("C-c /" . rtags-find-symbol)
  	 ("C-c #" . rtags-find-symbol-at-point)
  	 ("C-c r" . rtags-find-references)
  	 ("C-c R" . rtags-find-references-at-point)
  	 ("C-c f" . rtags-find-file)
  	 ("C-c v" . rtags-find-virtuals-at-point)
  	 ("C-c F" . rtags-fixit)
  	 ("C-c s" . rtags-location-stack-forward)
  	 ("C-c S" . rtags-location-stack-back)
  	 ("C-c n" . rtags-next-match)
  	 ("C-c p" . rtags-previous-match)
  	 ("C-c P" . rtags-preprocess-file)
  	 ("C-c R" . rtags-rename-symbol)
  	 ("C-c x" . rtags-show-rtags-buffer)
  	 ("C-c T" . rtags-print-symbol-info)
  	 ("C-c t" . rtags-symbol-type)
  	 ("C-c I" . rtags-include-file)
  	 ("C-c i" . rtags-get-include-file-for-symbol)
	 ("C-c m" . rtags-imenu)))

(setq rtags-display-result-backend 'helm)

(major-mode-hydra-define c++-mode nil
  ("Rtags find"
   (("/" rtags-find-symbol              "symbol             ")
    ("#" rtags-find-symbol-at-point     "symbol at point    ")
    (":" rtags-find-references          "references         ")
    ("." rtags-find-references-at-point "references at point")
    ("f" rtags-find-file                "file               ")
    ("v" rtags-find-virtuals-at-point   "virtuals at point  "))
  "Rtags refactor"
  (("F" rtags-fixit                    "fixit")
   ("R" rtags-rename-symbol            "rename symbol")
   ("I" rtags-include-file             "include file"))
  "Rtags stack"
  (("s" rtags-location-stack-forward "forward")
   ("S" rtags-location-stack-back    "back")
   )))
(provide 'emacs-c++-config.el)
;;; emacs-c++-config.el ends here
