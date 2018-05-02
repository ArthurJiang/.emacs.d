;;; init-company.el --- Company-mode configuration

;;; Commentary:
;;
;; Company-mode configuration
;;

(require 'package)

;;; Code:
(package-install 'company)

(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company)
;;; init-company.el ends here
