;;; package --- Summary
;;; Commentary:
;;; Code:

;; check this out: https://github.com/abo-abo/hydra/blob/master/hydra-examples.el
;; nesting hydras info: https://github.com/abo-abo/hydra/wiki/Nesting-Hydras
;; https://github.com/jkitchin/scimax/blob/master/scimax-hydra.el

(defvar hydra-stack nil)

(defun hydra-push (expr)
  (push `(lambda () ,expr) hydra-stack))

(defun hydra-pop ()
  (interactive)
  (let ((x (pop hydra-stack)))
    (when x)
    (funcall x)))

(use-package major-mode-hydra
  :ensure t)

(use-package pretty-hydra
  :ensure t)

(major-mode-hydra-define emacs-lisp-mode nil
  ("Eval"
   (("b" eval-buffer "buffer")
    ("e" eval-defun "defun")
    ("r" eval-region "region"))
   "REPL"
   (("I" ielm "ielm"))
   "Test"
   (("t" ert "prompt")
    ("T" (ert t) "all")
    ("F" (ert :failed) "failed"))
   "Doc"
   (("d" describe-foo-at-point "thing-at-pt")
    ("f" describe-function "function")
    ("v" describe-variable "variable")
    ("i" info-lookup-symbol "info lookup"))
   "Exit"
   (("q" hydra-pop "exit")
    ("ESC" hydra-pop "exit"))
   ))

;; TODO Add some interesting lsp language agnostic features to Programming submenu
(defhydra hydra-main-menu (:exit t :color blue :hint nil)
  "
   ^Window^                ^Frame^                ^Buffer^                ^Find^                  ^Project^                       ^Programming^                  ^Toggle^            ^EXIT^
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   ^hjkl^: move            _u_: winner undo       _p_: previous           _._ find file           _T_ treemacs                    _M_ mode specific              _t_                  ^ ^ 
   _s_:    split below     _r_: winner redo       _n_: next               _/_ locate file         _g_ git grep                    _L_ LSP                        ^ ^                  <SPC>
   _v_:    split right     _w_: revert all        _b_: switch             _D_ dired               _f_ find file proj              ^ ^                            ^ ^                  ^ ^
   _q_:    delete this     _N_: new frame         _K_: kill current       ^ ^                     _F_ find file other proj        ^ ^                            ^ ^                  ^ ^
   ^ ^                     ^ ^                    _x_: kill buffer        ^ ^                     _G_ magit                       ^ ^                            ^ ^                  ^ ^
   ^ ^                     ^ ^                    _Q_: kill multiple      ^ ^                     _X_ Kill project                ^ ^                            ^ ^                  ^ ^
  "

  ;; ^Window^
  ("h" windmove-left :color blue)
  ("j" windmove-down :color blue)
  ("k" windmove-up :color blue)
  ("l" windmove-right :color blue)
  ("s" split-window-below :color blue)
  ("v" split-window-right :color blue)
  ("q" delete-window :color blue)

  ;; ^Frame^
  ("u" winner-undo :color pink)
  ("r" winner-redo :color pink)
  ("w" revert-all-buffers :color pink)
  ("N" make-frame :color green)

  ;; ^Buffer^
  ("p" previous-buffer :color blue)
  ("n" next-buffer :color blue)
  ("b" helm-buffers-list :color blue)
  ("K" kill-this-buffer :color red)
  ("x" kill-buffer :color red)
  ("Q" ibuffer :color red)

  ;; ^Find^
  ("." helm-find-files :exit t)
  ("D" dired :exit t)
  ("/" helm-locate :exit t)


  ;; ^Project^
  ("T" treemacs :exit t)
  ("g" helm-grep-do-git-grep :exit t)
  ("f" helm-projectile-find-file :exit t)
  ("F" helm-projectile-switch-project :exit t)
  ("G" magit :exit t)
  ("X" projectile-kill-buffers :color red)

  ;; Todo programming - run another hydra for specific programming language. Depends on the major mode, for now add elisp, c/c++, java, bash hydras. Also add run vterm 
  ("M" (progn
	 (major-mode-hydra)
	 (hydra-push '(hydra-main-menu/body))))

  ("L" (progn
	 (hydra-lsp/body)
	 (hydra-push '(hydra-main-menu/body))))

  ;; Todo toggle - turn stuff on/off
  ;; case insensitive search, fuzzy-find, trailing whitespace, tabs, line-numbers...
  ("t" nil)

  ;; Escape
  ("SPC" nil :exit t))

(define-key evil-normal-state-map (kbd "SPC") 'hydra-main-menu/body)
(provide 'hydra-config)
;;; hydra-config.el ends here
