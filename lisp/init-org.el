;;; init-org.el --- org mode configuration

;;; Commentary:
;;
;; org mode configuration
;;

;;; Code:
(require-package 'cdlatex)
(require-package 'auctex)
(require-package 'org-pomodoro)

;; Auctex auto complete environment: C-c {, more: https://blog.csdn.net/argansos/article/details/6804870

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-l C-p") 'org-preview-latex-fragment)))
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-o") 'org-open-at-point)))
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-c ls") 'org-store-link)))
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-c li") 'org-insert-link)))
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-c a") 'org-agenda)))
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-c i") 'org-clock-in)))
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-c o") 'org-clock-out)))
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-c s") 'org-schedule)))

(load-file "~/.emacs.d/lisp/macro.el")

(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-l C-f") 'latex-formula)))
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-c q") 'insert-quote-in-org)))
(setq org-log-done 'note)
;; Making emacs find latex in os X, GUI Emacx (so that C-l C-p(default is C-c C-x C-l) works on orgmode)
(when (and *is-a-mac* *is-gui*)
  (setenv "PATH" (concat ":/Library/TeX/texbin/" (getenv "PATH")))
  (add-to-list 'exec-path "/Library/TeX/texbin/"))

;; Remove it for conflict in latex fragment.
;; (setq org-hide-emphasis-markers t)

;; Enable code block execute: http://wenshanren.org/?p=334
(defun org-insert-src-block (src-code-type)
  "Insert `SRC-CODE-TYPE' souce code block in org-mode"
  (interactive
   (let ((src-code-types
	  `("awk" "C" "clojure" "emacs-lisp" "js" "latex" "lisp" "lua" "matlab" "ocaml" "org" "python" "R" "shell")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    ;; https://orgmode.org/manual/Results-of-evaluation.html
    (insert (format "#+BEGIN_SRC %s :results output\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(add-hook 'org-mode-hook
	  (lambda ()
	    ;; turn on flyspell-mode by default
	    (flyspell-mode 1)
	    ;; C-TAB for expanding
	    (local-set-key (kbd "C-<tab>") 'yas/expand-from-trigger-key)
	    ;; kbd for editing source code blocks
	    (local-set-key (kbd "C-c c e") 'org-edit-src-code)
	    ;; kbd for inserting source code blocks
	    (local-set-key (kbd "C-c c i") 'org-insert-src-block)
	    ;; kbd for running source code blocks
	    (local-set-key (kbd "C-c c r") 'org-babel-execute-src-block)
	    ))

;; syntax highlight
(setq org-src-fontify-natively t)

;; Language list: https://orgmode.org/manual/Languages.html#Languages
;; Need install/build new version emacs 26+, GNU: https://emacsformacosx.com/builds or Terminal: brew install emacs --devel
(if (version< "26" emacs-version)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((awk . t)
       (C . t)
       (clojure . t)
       (emacs-lisp . t)
       (js . t)
       (latex . t)
       (lisp . t)
       ;; ob-lua: https://github.com/emacsmirror/org/blob/master/lisp/ob-lua.el
       ;; Open issues: https://github.com/syl20bnr/spacemacs/issues/7641
       (lua . t)
       (matlab . t)
       (ocaml . t)
       (org . t)
       (python . t)
       (R . t)
       (shell . t))))


(provide 'init-org)
;;; init-org.el ends here
