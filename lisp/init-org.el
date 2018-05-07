;;; init-org.el --- org mode configuration

;;; Commentary:
;;
;; org mode configuration
;;

;;; Code:
(require-package 'cdlatex)
(require-package 'auctex)
(require-package 'org-pomodoro)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-l C-p") 'org-preview-latex-fragment)))
(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-o") 'org-open-at-point)))

;; Making emacs find latex in os X, GUI Emacx (so that C-l C-p(default is C-c C-x C-l) works on orgmode)
(when (and *is-a-mac* *is-gui*)
  (setenv "PATH" (concat ":/Library/TeX/texbin/" (getenv "PATH")))
  (add-to-list 'exec-path "/Library/TeX/texbin/"))


(provide 'init-org)
;;; init-org.el ends here
