;;; init-editing.el --- editing configuration

;;; Commentary:
;;
;; editing configuration
;;

;;; Code:
(electric-pair-mode t)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C--") 'advertised-undo)

;; Column limitation
(require 'whitespace)
(setq whitespace-line-column 100)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

(provide 'init-editing)
;;; init-editing.el ends here
