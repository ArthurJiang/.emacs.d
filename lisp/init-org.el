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

(provide 'init-org)
;;; init-org.el ends here
