;;; init-flycheck.el --- Flycheck mode configuration

;;; Commentary:
;;
;; Flycheck configuration
;;

(require 'package)

;;; Code:
(package-install 'flycheck)

(global-flycheck-mode)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
