;;; init-spelling.el --- spelling configuration

;;; Commentary:
;;
;; Spelling configuration
;;

;;; Code:
(require 'ispell)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(provide 'init-spelling)
;;; init-spelling.el ends here
