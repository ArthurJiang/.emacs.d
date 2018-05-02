;;; init --- This is the root configuration, more user specific configuration, see ./lisp
;;; Commentary:

;; -*- lexical-binding: t -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)

(setq debug-on-error t)



;; Version check
(let ((min-ver "25"))
  (if (version< emacs-version min-ver)
      (error "Your Emacs v%s is too old, requires v%s or higher!" emacs-version min-ver) (message "Your Emacs v%s is ok!" emacs-version)))

;; Global configuration
(defconst *spell-check-support-enabled* t) ;; Enable with t if you prefer
(defconst *normal-gc-cons-threshold* (* 128 1024 1024))
(defconst *init-gc-cons-threshold* (* 256 1024 1024))

;; Load user specific configuration
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Set garbage collection thresholds
(setq gc-cons-threshold *init-gc-cons-threshold*)
(add-hook 'after-init-hook
	  (lambda () (setq gc-cons-threshold *normal-gc-cons-threshold*)))

;; Load user specific configuration
(require 'init-themes)

(when *spell-check-support-enabled*
  (require 'init-spelling))

;;(require 'init-flycheck)

;; Allow access from Emacs client
(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)
;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
