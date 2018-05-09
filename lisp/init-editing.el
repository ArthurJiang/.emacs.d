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

;; Smex
(require-package 'smex)
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay  when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Session
(desktop-save-mode 1)
(require-package 'session)
(add-hook 'after-init-hook 'session-initialize)

;; Word count
(global-set-key (kbd "C-c w") 'count-words)

(provide 'init-editing)
;;; init-editing.el ends here
