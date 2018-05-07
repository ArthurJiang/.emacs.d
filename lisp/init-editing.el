;;; init-editing.el --- editing configuration

;;; Commentary:
;;
;; editing configuration
;;

;;; Code:
(electric-pair-mode t)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C--") 'advertised-undo)
(provide 'init-editing)
;;; init-editing.el ends here
