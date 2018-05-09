;;; init-editing.el --- editing configuration

;;; Commentary:
;;
;; editing configuration
;;

;;; Code:
(electric-pair-mode t)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C--") 'advertised-undo)
(global-hl-line-mode t)
(global-set-key "\C-cs" 'eshell)
;; Column limitation
(require 'whitespace)
(setq whitespace-line-column 100)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; Line num
(when *is-gui*
  (custom-set-variables '(linum-format 'dynamic))
  (global-linum-mode 1))

(provide 'init-editing)
;;; init-editing.el ends here
