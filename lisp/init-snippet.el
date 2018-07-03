;;; init-snippet.el --- snippet mode configuration

;;; Commentary:
;;
;; snippet mode configuration
;;

;;; Code:
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(advice-remove 'yas--auto-fill-wrapper #'ignore)
(provide 'init-snippet)
;;; init-snippet.el ends here
