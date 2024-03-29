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
(package-refresh-contents)

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


(defun eshell-clear ()
  "Clear the eshell buffer"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(add-hook 'eshell-mode-hook (lambda ()
			      (define-key eshell-mode-map (kbd "C-l") 'eshell-clear)))

;(define-key eshell-mode-map (kbd "C-l") 'eshell-clear)


(require 'use-package)

;; TODO add smartparens, volatile highlights  mode
;;(load-file (concat EMACS_DIR "evil-config.el"))
(load-file (concat EMACS_DIR "helm-config.el"))
(load-file (concat EMACS_DIR "hydra-config.el"))
(load-file (concat EMACS_DIR "look-and-feel.el"))
(load-file (concat EMACS_DIR "custom-misc-func.el"))
(load-file (concat EMACS_DIR "magit-config.el"))
(load-file (concat EMACS_DIR "org-mode.el"))
;;(load-file (concat EMACS_DIR "programming/programming-general-config.el"))
(electric-pair-mode)
(load-file (concat EMACS_DIR "programming/ctags.el"))
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
 '(c-basic-offset 'set-from-style)
 '(custom-safe-themes
   '("830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(helm-source-names-using-follow '("switch-to-buffer" "Buffers"))
 '(large-file-warning-threshold 1000000000000000000000000000000000000000)
 '(lsp-clangd-binary-path "/usr/bin/clangd-14")
 '(lsp-clients-clangd-args '("--query-driver=\"*g++*\""))
 '(package-selected-packages
   '(company-ctags ctags-update auto-complete-exuberant-ctags lean-mode flycheck-yamllint yaml-mode yasnippet-lean yasnippet-classic-snippets elpy treemacs-perspective treemacs-all-the-icons treemacs-icons-dired evil-nerd-commenter nerd-icons-ivy-rich nerd-icons-ibuffer nerd-icons-completion nerd-icons-dired nerdtab treemacs-nerd-icons doom topsy unicode-fonts hideshow-org sauron verilog-ext htmlize slime-company rainbow-delimiters rainbow-blocks slime flycheck-psalm protobuf-mode god-mode eglot gruber-darker-theme simple-mpc helm-emms emms-player-mpv-jp-radios fontawesome eyebrowse ob-diagrams speed-type speeddating ace-link bitbake bongo cmake-ide cpputils-cmake cmake-project cmake-mode auto-complete-auctex auctex wucuo helm-cscope benchmark-init evil-collection haskell-mode lsp-haskell w3m helm-file-preview json-rpc lsp-java-boot jdee google-c-style vterm clang-format+ flycheck-clang-tidy helm-mode-manager helm-lsp lsp-ui flycheck yasnippet-snippets company magit which-key projectile treemacs-evil doom-modeline smooth-scrolling evil-leader major-mode-hydra vi-tilde-fringe helm-rtags yasnippet lsp-java solarized-theme use-package))
 '(tab-stop-list
   '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
 '(tramp-copy-size-limit 100240)
 '(warning-suppress-types '((lsp-mode) (lsp-mode) (lsp-mode) (lsp-mode) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)
