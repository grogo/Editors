;; Time-stamp: <2017-09-18 19:09:52 grogo .emacs>
(setq inhibit-startup-message t)

(set-cursor-color "red")
;;to manage the geometric size of initial window.
(setq initial-frame-alist '((width . 86) (height . 52)))

(setq time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S %u %f")
(setq time-stamp-active t)
(add-hook 'write-file-hooks 'time-stamp)
(global-font-lock-mode t) ;; always do syntax hiliting 
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(fset 'yes-or-no-p 'y-or-n-p)   ; enable one letter y/n answers to yes/no
(setq x-select-enable-clipboard t) ; copy-paste should work
(transient-mark-mode t)          ; make the current 'selection' visible
(iswitchb-mode 1)          ; smart buffer switching

;; A function to insert the time stamp at point.
(defun stamp ()
  "Insert at point the dummy time stamp string to activate the time stamp facility."
  (interactive "*")
  (insert "Time-stamp: <>")             ;insert the bare bones
  (time-stamp)                          ;call the function to fill it in
                                        ;where we put it.
  )

; Insert the date, the time, and the date and time at point. Insert the
; date 31 days hence at point (eventually...). Useful for keeping
; records. These are based on Glickstein.

(defvar insert-time-format "%T"
  "*Format for \\[insert-time] (c.f. 'format-time-string' for how to format).")

(defvar insert-date-format "%Y/%m/%d"
  "*Format for \\[insert-date] (c.f. 'format-time-string' for how to format).")

(defun insert-time ()
  "Insert the current time according to the variable \"insert-time-format\"."
  (interactive "*")
  (insert (format-time-string insert-time-format
                     (current-time))))

(defun insert-date ()
  "Insert the current date according to the variable \"insert-date-format\"."
  (interactive "*")
  (insert (format-time-string insert-date-format
                     (current-time))))

(defun insert-time-and-date ()
  "Insert the current date according to the variable \"insert-date-format\", then a space, then the current time according to the variable \"insert-time-format\"."
  (interactive "*")
  (progn
    (insert-date)
    (insert " ")
    (insert-time)))


(global-set-key [f5] 'insert-time-and-date)
(global-set-key "\M-s" 'save-buffer)
(global-set-key "\C-x/" 'point-to-register)
(global-set-key "\C-xj" 'jump-to-register)
(global-set-key "\M-g"  'goto-line)    ; M-g means 'goto-line
;;(global-set-key "\C-z"  'undo)
(global-set-key "\M-;"  'comment-or-uncomment-region)     ; toggle comments
;; autosave Tramp files to local dir
(setq tramp-auto-save-directory "~/.emacs-backup/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; backups  (emacs will write backups and number them)
(setq make-backup-files t ; do make backups
      backup-by-copying t ; and copy them ...
      backup-directory-alist '(("." . "~/.emacs-backup")) ; ... here
      version-control t
      kept-new-versions 2
      kept-old-versions 3
      delete-old-versions t)


;; Furthermore, you must activate font-lock-mode in Org buffers, because significant functionality depends on font-locking being active. You can do this with either one of the following two lines (XEmacs user must use the second option):

(global-font-lock-mode 1)                     ; for all buffers(
;(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(cua-normal-cursor-color "red")
;;  '(grep-command "grep -niH -e ")
;;  '(latex-run-command "/usr/texbin/pdflatex")
;;  '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
;; ;; '(org-agenda-files (quote ("~/Dropbox/org/work.txt" "~/Dropbox/org/schedule.txt" "~/Dropbox/org/personal.txt" "~/Dropbox/org/journal.txt" "~/Dropbox/org/development.txt")))
;;  '(paren-match-face (quote paren-face-match-light))
;;  '(paren-sexp-mode t)
;;  '(save-place t nil (saveplace))
;;  '(show-paren-mode t)
;;  '(tool-bar-mode nil)
;;  '(py-pychecker-command "~/bin/pycheck.sh")
;;  '(py-pychecker-command-args (quote ("")))
;;  '(python-check-command "~/bin/pycheck.sh")
;; )
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;; ;;----------------------------------------------------------------------
;; ;; ORG mode
;; ;;----------------------------------------------------------------------
;; ;; The following lines are always needed.  Choose your own keys.
;; ;(require 'org-install)
;; ;; ORG mode
;; ;; The following lines are always needed.  Choose your own keys.
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; ;(global-set-key "\C-cl" 'org-store-link)
;; ;(global-set-key "\C-ca" 'org-agenda)
;; ;(global-set-key "\C-cb" 'org-iswitchb)
;; ;(global-set-key "\C-t" 'org-todo)
;; ;(global-set-key "\C-cg" 'org-search-view)
;; (setq org-agenda-ndays 10)
;; ;; (setq org-stuck-projects
;; ;;       '("+PROJECT/-MAYBE-DONE" ("NEXT" "TODO" "DELEGATED" "WAITING") ("@SHOP")
;; ;;      "\\<IGNORE\\>"))
;; (setq org-indent-mode t)
;; ;; Furthermore, you must activate font-lock-mode in Org buffers, because significant functionality depends on font-locking being active. You can do this with either one of the following two lines (XEmacs user must use the second option):

;; (global-font-lock-mode 1)                     ; for all buffers(
;; ;(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only

;; (setq org-todo-keywords '("TODO"
;;                  "HOLD"
;;                  "DONE"
;;                  )
;;       org-todo-interpretation 'sequence)

;; ; tags
;; (setq org-tag-alist '(("PROJECT" . ?p)
;;                 ("WORK" . ?w)
;;                 ("HOME" . ?h)
;;                 ("IT" . ?i)
;;                 ("SCHEDULE" . ?s)
;;                 ("SHOPPING" . ?g)
;;                 ("DAYOFF" . ?o)
;;                 ("BUSINESS" . ?b)
;;                 ("NEWSCHED" . ?d)
;;                 ("BOARD" . ?m)
;;                 ("NUCS" . ?n)
;;                 ("PET" . ?e)
;;                 ))

;; (setq org-agenda-custom-commands
;;       '(("w" todo "WAITING" nil)
;; 	("n" todo "NEXT" nil)
;; 	("d" "Agenda + Next Actions" ((agenda) (todo "NEXT"))))
;;       )

;; Remember.el mode
;(org-remember-insinuate)
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/work.txt"))
(define-key global-map "\C-cr" 'org-remember)

(setq org-remember-templates
      '(("Work Todo" ?t "* TODO " "~/Dropbox/org/work.txt" "Tasks")
        ("Schedule" ?s "* " "~/Dropbox/org/schedule.txt" "UPCOMING SCHEDULE BLOCK")
        ("Idea" ?i "* " "~/Dropbox/org/personal.txt" "New Ideas")
        ("Personal" ?p "* TODO " "~/Dropbox/org/personal.txt" "Tasks")
	("Journal" ?j "* %T" "~/Dropbox/org/journal.txt" "Journal Entries")
	("Shopping" ?g "* " "~/Dropbox/org/personal.txt" "Shopping")
	("Bugs" ?b "* TODO" "~/Dropbox/org/development.txt" "BUGS")
	))

;;;----------------------------------------------------------------------
;;; MacOS X specific stuff
;;; ----------------------------------------------------------------------
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'meta)

(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper x)] 'kill-region)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(meta s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper o)] 'find-file)
(global-set-key [(hyper f)] 'isearch-forward)
(global-set-key [(hyper g)] 'isearch-repeat-forward)
(global-set-key [(hyper w)]
                (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key [(hyper .)] 'keyboard-quit)

;; I disabled this since I want to avoid hitting Cmd-q accidentally.
;(global-set-key [(hyper q)] 'save-buffers-kill-emacs)

;(require 'redo)
(global-set-key [(meta z)] 'undo)
(global-set-key [(hyper shift z)] 'redo)
(global-set-key "\C-xx" 'copy-to-register)
(global-set-key "\C-xg" 'insert-register)

;; Python stuff - GREG
(setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" 
                 (getenv "PATH")))

;;; IMPORTANT
;;; THe following sets Emacs' 'exec-path', which is what it
;;; uses to launch other programs from Emacs, such as python
;;; setenv PATH just changes the path for the shell, but is not
;;; used to figure out what programs to launch!!!
(setq exec-path (cons "/usr/texbin"
		      (cons "/usr/local/bin"
			    exec-path)))

;; (setenv "PYTHONPATH" (concat "/home/grogo/www/schedule:"
;; 			     (getenv "PYTHONPATH")
;; 			     )
;; 	)

;(setenv "DYLD_LIBRARY_PATH" "/usr/local/mysql/lib")
;(setenv "MYSQL_UNIX_PORT" "/Applications/MAMP/tmp/mysql/mysql.sock")


(setq tex-command "/usr/texbin/pdflatex")
(setq tex-start-commands "")

;;; php mode
(add-to-list 'load-path "/home/grogo/emacs/php-mode")
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(autoload 'php-mode "php-mode" "PHP mode." t)

;;; grep
(setq grep-command "grep -nHi -e ")

;;; Git-emacs
;;; git clone git://github.com/tsgates/git-emacs.git
(add-to-list 'load-path "/home/grogo/emacs/git-emacs")
(require 'git-emacs)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 120 :width normal)))))
