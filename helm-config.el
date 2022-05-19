
(defun my-popup-window (buffer &optional resume)
  (let ((popup-window (split-window (frame-root-window) nil nil)))
		(select-window popup-window)
		(fit-window-to-buffer popup-window 15 10 nil nil)
		(pop-to-buffer buffer)))

(use-package hide-mode-line
  :ensure t)

(use-package hide-mode-line
  :ensure t)

(use-package helm-rg
  :ensure t)

(use-package helm-c-yasnippet
  :ensure t)

(use-package helm-company
  :ensure t)

(use-package swiper-helm
  :ensure t)
(use-package helm-descbinds
  :ensure t)

(use-package helm-projectile
  :ensure t
  :commands (helm-projectile-find-file
			 helm-projectile-recentf
			 helm-projectile-switch-project
			 helm-projectile-switch-to-buffer))
(use-package helm
  :ensure t
  :preface
  (setq helm-candidate-number-limit 50
		;; remove extraineous helm UI elements
		helm-display-header-line nil
		helm-mode-line-string nil
		helm-ff-auto-update-initial-value nil
		helm-find-files-doc-header nil
		;; Default helm window sizes
		helm-display-buffer-default-width nil
		helm-display-buffer-default-height 0.25
		helm-imenu-execute-action-at-once-if-one nil
		helm-ff-lynx-style-map nil)
  :init
  (helm-mode 1)
  (setq helm-apropos-fuzzy-match t
		helm-buffers-fuzzy-matching t
		helm-ff-fuzzy-matching t
		helm-imenu-fuzzy-match t
		helm-lisp-fuzzy-completion t
		helm-locate-fuzzy-match t
		helm-projectile-fuzzy-match t
		helm-semantic-fuzzy-match t)
  :bind (([remap apropos] . helm-apropos)
			  ([remap find-library] . helm-locate-library)
                          ([remap bookmark-jump] . helm-bookmarks)
                          ([remap locate] . helm-locate)
                          ([remap imenu] . helm-semantic-or-imenu)
                          ([remap noop-show-kill-ring] . helm-show-kill-ring)
                          ([remap persp-switch-to-buffer] . helm-buffer-list)
                          ([remap yank-pop] . helm-show-kill-ring)
;			  ([remap kill-buffer] . helm-buffer-)
			  ([remap execute-extended-command] . helm-M-x)
			  ([remap find-file] . helm-find-files)
			  ([remap imenu] . helm-semantic-or-imenu)
			  ([remap projectile-find-file] . helm-projectile-find-file)
			  ([remap isearch-forward] . swiper-isearch))
  :config
  ;; helm is too heavy for `find-file-at-point'
;  (add-to-list 'helm-completing-read-handlers-alist (cons #'find-file-at-point nil))
  (setq helm-display-function 'my-popup-window))
  (setq helm-follow-mode-persistent t)
