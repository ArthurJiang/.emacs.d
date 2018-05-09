;;; init-font.el --- font configuration

;;; Commentary:
;;
;; font configuration
;;

;;; Code:
(when *is-gui*
  (set-face-attribute 'default nil :font "Monaco 12")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
		      charset (font-spec :family "Microsoft Yahei"
					 :size 12))))

(provide 'init-font)
;;; init-font.el ends here
