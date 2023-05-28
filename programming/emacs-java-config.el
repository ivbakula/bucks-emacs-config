;;; package --- Summary
;;; Commentary:
;;; Code:

;; Check: https://github.com/emacs-lsp/lsp-java 
;;        https://gitlab.com/skybert/my-little-friends/-/blob/master/emacs/.emacs.d/tkj-java.el
(use-package lsp-java
  :ensure t
  :config
  (add-hook 'java-mode-hook 'lsp))


;(add-hook 'lsp-mode-hook #'lsp-lens-mode)
;(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

(setq lsp-java-vmargs (list
		       "-noverify"
		       "-Xmx2G"
		       "-XX:+UseG1GC"
		       "-XX:+UseStringDeduplication"
		       ;; Use lombok maybe https://projectlombok.org/
		       )

      lsp-java-java-path "/usr/lib/jvm/java-20-openjdk/bin/java"
      lsp-java-server-install-dir (concat EMACS_DIR "java-stuff/")
      lsp-java-workspace-dir (concat EMACS_DIR "java-stuff/workspace/")
      lsp-java-workspace-cache-dir (concat EMACS_DIR "java-stuff/.cache/")
      lsp-java-format-enabled t
      ;set path to maven's settings.xml
      ;lsp-java-configuration-maven-user-settings ""
      lsp-java-completion-enabled t)

(setenv "JAVA_HOME" "/usr/lib/jvm/java-20-openjdk")

(major-mode-hydra-define java-mode nil
  ("Imports"
   (("o" lsp-java-organize-imports  "Organize")
    ("i" lsp-java-add-import        "Add missing"))
   "Workspace"
   (("A" lsp-workspace-folders-add    "Add directory   ")
    ("R" lsp-workspace-folders-remove "Remove directory")
    ("S" lsp-workspace-folders-switch "Switch directory"))
   "Dependencies"
   (("l" lsp-treemacs-java-deps-list    "List   ")
    ("r" lsp-treemacs-java-deps-refresh "Refresh"))
   ))
(provide 'emacs-java-config)
;;; emacs-java-config.el ends here
