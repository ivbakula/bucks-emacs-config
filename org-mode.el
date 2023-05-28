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

(require 'ox-publish)

(setq org-publish-project-alist
      `(("pages"
         :base-directory "~/Documents/web/ivbakula.xyz/org/"
         :base-extension "org"
         :recursive t
         :publishing-directory "~/Documents/web/ivbakula.xyz/html/"
         :publishing-function org-html-publish-to-html)
	("blog"
	 :base-directory "~/Documents/web/ivbakula.xyz/org/org/blog/"
	 :base-extension "org"
	 :publishing-directory "~/Documents/web/ivbakula.xyz/org/html/blog/"
	 :publishing-function org-html-publish-to-html
	 :auto-sitemap t
	 :sitemap-title "Blog Posts"
	 :sitemap-filename "index.org"
	 :sitemap-sort-files anti-chronologically)

        ("static"
         :base-directory "~/Documents/web/ivbakula.xyz/org/"
         :base-extension "css\\|txt\\|jpg\\|gif\\|png"
         :recursive t
         :publishing-directory  "~/Documents/web/ivbakula.xyz/html/"
         :publishing-function org-publish-attachment)

	
        ("ivbakula.xyz" :components ("pages" "static" "blog"))))

;;; org-mode.el ends here
