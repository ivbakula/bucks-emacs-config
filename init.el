;;; package --- Summary
;;; Commentary:
;;; Code:

;; You should check this stuff out:
;; https://github.com/caiohcs/my-emacs
;; https://gitlab.com/olymk2/em

;; http://coldnew.github.io/coldnew-emacs

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
			 ("org". "https://orgmode.org/elpa/")))
(package-initialize)
;(package-refresh-contents)

;; disable startup screen
(setq inhibit-startup-message t)

(defvar EMACS_DIR (if load-file-name
                    ;; file is being loaded.
                    (file-name-directory load-file-name)
                    ;; file is being evaluated using `eval-buffer'
                    (default-directory)))

(setq EMACS_DIR (expand-file-name EMACS_DIR))

(setq package-list '(use-package solarized-theme lsp-java yasnippet helm-rtags))
(dolist (package package-list)
  (unless (package-installed-p package) (package-install package)))

;; Maintain a list of recent files opened
(recentf-mode 1)
(setq recentf-max-saved-items 50)

;; Store all emacs specific files to ~/.cache
(setq user-cache-directory "~/.cache")
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-cache-directory)))
      url-history-file (expand-file-name "url/history" user-cache-directory)
      auto-save-list-file-prefix (expand-file-name "auto-save-list/.saves-" user-cache-directory)
      projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-directory))


(require 'use-package)
(load-file (concat EMACS_DIR "evil-config.el"))
(load-file (concat EMACS_DIR "helm-config.el"))
(load-file (concat EMACS_DIR "hydra-config.el"))
(load-file (concat EMACS_DIR "look-and-feel.el"))
(load-file (concat EMACS_DIR "custom-misc-func.el"))
(load-file (concat EMACS_DIR "magit-config.el"))
(load-file (concat EMACS_DIR "programming/programming-general-config.el"))

(run-hooks 'after-init-hook 'delayed-warnings-hook)
(run-hooks 'emacs-startup-hook 'term-setup-hook)
(run-hooks 'window-setup-hook)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-source-names-using-follow '("Buffers"))
 '(package-selected-packages
   '(helm-file-preview json-rpc lsp-java-boot jdee google-c-style vterm clang-format+ flycheck-clang-tidy helm-mode-manager helm-lsp lsp-ui flycheck yasnippet-snippets company magit which-key projectile treemacs-evil doom-modeline smooth-scrolling evil-leader major-mode-hydra vi-tilde-fringe helm-rtags yasnippet lsp-java solarized-theme use-package))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
