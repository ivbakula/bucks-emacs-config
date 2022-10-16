;;; package --- Summary
;;; Commentary:
;;; Code:

;; Highlight opening and closing delimeters
(show-paren-mode)

;;; Auto complete parens
(electric-pair-mode)

;;; Jump to subword if camelCase
(subword-mode)

;;; Spell checker (useful for comments)
;;; TODO prog-mode hooks for various programming languages
(flyspell-prog-mode)

(use-package treemacs-evil
  :ensure t
  :init)

(setq treemacs-show-hidden-files nil)

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

(use-package yasnippet-snippets
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  ;; don't bother me with errors until I save 
  (setq flycheck-check-syntax-automatically '(mode-enabled save)))

(use-package lsp-treemacs
  :after (lsp-mode treemacs-evil)
  :ensure t
  :commands lsp-treemacs-errors-list
  :bind (:map lsp-mode-map
			  ("M-9" . lsp-treemacs-errors-list)))

(use-package lsp-ui
:ensure t
:after (lsp-mode)
:bind (:map lsp-ui-mode-map
         ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
         ([remap xref-find-references] . lsp-ui-peek-find-references))
:init (setq lsp-ui-doc-show-with-mouse nil ;; disable documentation on mouse hower. This is pretty annoying, cause I don't really use mouse.
	    lsp-ui-doc-delay 1.5
	    lsp-ui-doc-position 'bottom
	    lsp-ui-doc-max-width 100))

(use-package helm-lsp
:ensure t
:after (lsp-mode)
:commands (helm-lsp-workspace-symbol)
:init (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol))

(use-package lsp-mode
  :ensure t
  :hook ((lsp-mode . lsp-enable-which-key-integration)
	 ;;(add programming language mode hooks here if necessary)
	 (java-mode . #'lsp-deferred)
	 (c-mode . #'lsp-deferred)
	 (c++-mode . #'lsp-deferred))
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l"
	lsp-log-io t
	lsp-enable-file-watchers nil
	gc-cons-threshold (* 1024 1024) ;; garbage collector memory trshold
	read-process-output-max (* 5 1024 1024) ; 5mb
	lsp-idle-delay 100
	company-idle-delay 100000       ;; don't autocomplete unless I tell you. This will make emacs reasonably responsive in big repositories
	company-minimum-prefix-length 2) ;; don't autocomplete unless you have 2 chars to complete. This is really unnecessary because of line above
  (lsp-ui-peek-mode)
  :bind (:map lsp-mode-map ("M-q" . company-capf)) ;; set autocomplete keybinding to M-q
  :config
  (setq lsp-completion-provider :capf)
  (setq lsp-intelephense-multi-root nil)
  (with-eval-after-load 'lsp-intelephense
    (setf (lsp--client-multi-root (gethash 'iph lsp-clients)) nil))
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  (progn
    (lsp-register-client
     (make-lsp-client :new-connection (lsp-tramp-connection "clangd")
		      :major-modes '(c-mode c++-mode)
		      :remote? t
		      :server-id 'clangd-remote))))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools))
  (yas-global-mode)

;; TODO add plantuml

;; Load programming languages specific configurations
(load-file  (concat EMACS_DIR "programming/emacs-java-config.el"))
(load-file (concat EMACS_DIR "programming/emacs-c++-config.el"))

;; LSP hydras
(defhydra hydra-lsp (:exit t :color blue)
  "
  ^Symbol^                     ^Hierarchy^          ^List^     ^Exit^
  --------------------------------------------------------------------
  _D_efinition                  _c_all               _e_rror    _q_uit
  _d_eclaration                 _r_eferences         ^ ^        ^ ^
  _i_mplementation              _t_ype               ^ ^        ^ ^
  _p_eek implementation         _s_ymbols            ^ ^        ^ ^
  _l_ist                        ^ ^                  ^ ^        ^ ^
  _R_ename at point             ^ ^                  ^ ^        ^ ^
  "
  ;; Find symbol
  ("D" lsp-ui-peek-find-definitions)
  ("d" lsp-find-declaration)
  ("p" lsp-ui-peek-find-implementation)
  ("i" lsp-treemacs-implementations)
  ("l" lsp-ui-imenu)
  ("R" lsp-rename)

  ;; Hierarchy
  ("c" lsp-treemacs-call-hierarchy)
  ("r" lsp-treemacs-references)
  ("t" lsp-treemacs-type-hierarchy)
  ("s" lsp-treemacs-symbols)

  ;; List
  ("e" lsp-treemacs-errors-list)
  ("q" hydra-pop))

(defhydra hydra-cscope (:exit t :color blue)
  "
  ^function^
  ----------------------------------------------------------------------- 
  _C_alled
  _c_alling
  "
  ;; ^Function^
  ("C" helm-cscope-find-called-function)
  ("c" (lambda ()
	 (interactive)
	 (helm-cscope-find-calling-this-function-no-prompt))))
(provide 'programming-general-config)
;;; programming-general-config.el ends here
