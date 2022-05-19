;;; package --- Summary
;;; Commentary:
;;; Code:

;; LaTeX
(setq org-plantuml-jar-path (expand-file-name "/usr/share/java/plantuml/plantuml.jar"))
;; enable unix shell code execution
(org-babel-do-load-languages 'org-babel-load-languages
    '(
        (shell . t)
	(latex . t)
	(plantuml . t)
	(dot . t)
    )
)
;;; org-mode.el ends here
