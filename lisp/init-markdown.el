;;; init-markdown.el --- markdown mode configuration

;;; Commentary:
;;
;; Markdown mode configuration
;;

;;; Code:
(require-package 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'init-markdown)
;;; init-markdown.el ends here
