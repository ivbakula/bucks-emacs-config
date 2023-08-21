(setq path-to-ctags "/usr/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name))))

(use-package company-ctags
  :ensure t
  :init
  (add-hook 'c-mode-hook 'company-mode)
  (define-key c-mode-mapi (kbd "M-q" 'company-ctags)))

(use-package ctags-update
  :ensure t
  :init
  (add-hook 'c-mode-hook 'ctags-auto-update-mode))
