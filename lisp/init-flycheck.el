(require 'package)

;;; Code:
(add-to-list 'package-archives
	     '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(package-install 'flycheck)

(global-flycheck-mode)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
