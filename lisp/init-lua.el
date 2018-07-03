;;; init-lua.el --- lua mode configuration

;;; Commentary:
;;
;; lua mode configuration
;;

;;; Code:
(require-package 'lua-mode)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq indent-tabs-mode nil)
(setq lua-indent-level 2)
(setq lua-indent-string-contents t)

(provide 'init-lua)
;;; init-lua.el ends here
