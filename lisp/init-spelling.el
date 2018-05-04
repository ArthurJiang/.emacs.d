;;; init-spelling.el --- spelling configuration

;;; Commentary:
;;
;; Spelling configuration
;;

;;; Code:

;; Fix ispell can not find in OS X: brew install aspell --with-lang-en
;; https://stackoverflow.com/questions/19022015/emacs-on-mac-os-x-how-to-get-spell-check-to-work/21749058
(when (and *is-a-mac* *is-gui*)
  (add-to-list 'exec-path "/usr/local/bin/")
  (setq ispell-program-name "aspell"))

(require 'ispell)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(provide 'init-spelling)
;;; init-spelling.el ends here
