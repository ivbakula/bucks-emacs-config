;;; package --- Summary
;;; Commentary:
;;; Code:

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

;;; This function is taken form: https://www.emacswiki.org/emacs/FlySpell

(global-set-key (kbd "C-c s") 'flyspell-learn-word-at-point)

(defun flyspell-learn-word-at-point ()
  "Takes the highlighted word at point --
nominally a misspelling --
and inserts it into the personal/private dictionary,
such taht it is known and recognized as a valid word in the future."
  (interactive)
  (let ((current-location (point))
	(word (flyspell-get-word)))
    (when (consp word)
      (flyspell-do-correct
       'save nil
       (car word)
       current-location
       (cadr word)
       (caddr word)
       current-location))))

;;; custom-misc-func.el ends here
