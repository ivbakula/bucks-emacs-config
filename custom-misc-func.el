(defun my-git-follow-file ()
  (interactive)
  (let ((filename buffer-file-name)
		(command
		 (concat
		  (concat "git log --reverse --follow -- " buffer-file-name)
		  " | head -1")))
	(let ((commit-id
		   (split-string (shell-command-to-string command))))
	  (let ((command (concat "git show --pretty="" --name-only " (nth 1 commit-id))))
		(setq buffer-read-only 1)
		(setq output-buffer (generate-new-buffer "*git-follow*"))
		(let ((history (split-string (shell-command-to-string command))))
		  (dired (cons "Commited Files: " history)))))))

