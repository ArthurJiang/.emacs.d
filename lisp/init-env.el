;;; init-env.el --- env configuration

;;; Commentary:
;;
;; env configuration
;;

;;; Code:
(require-package 'exec-path-from-shell)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-env)
;;; init-env.el ends here
