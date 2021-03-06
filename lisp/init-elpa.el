;;; init-elpa.el --- elpa configuration

;;; Commentary:
;;
;; elpa configuration
;;

;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("org-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/"))
(add-to-list 'package-archives '("gnu-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
(package-initialize)

;;;
;;; On-demand installation of packages
;;;
(defun require-package (package &optional min-version)
  "Install given PACKAGE, optionally requiring MIN-VERSION."
  (if (package-installed-p package min-version)
    (message "Package %s has been installed!" package)
    (if (assoc package package-archive-contents)
	(progn (message "Install package %s without refresh now..." package)
	       (package-install package))
      (progn (message "Install package %s with refresh now..." package)
	     (package-refresh-contents)
	     (package-install package)))))

(provide 'init-elpa)
;;; init-elpa.el ends here

