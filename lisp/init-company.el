;;; init-company.el --- Company-mode configuration

;;; Commentary:
;;
;; Company-mode configuration
;;

;;; Code:
(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.2
     company-show-numbers t)

(provide 'init-company)
;;; init-company.el ends here
