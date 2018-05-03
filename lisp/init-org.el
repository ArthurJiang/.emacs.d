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

(provide 'init-org)
;;; init-org.el ends here
