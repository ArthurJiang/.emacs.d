;;; init-themes.el --- theme configuration

;;; Commentary:
;;
;; Theme configuration
;;

;;; Code:
(setq-default custom-enabled-themes '(manoj-dark))

(defun reapply-themes ()
  "Apply themes after loading."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

(provide 'init-themes)
;;; init-themes.el ends here
