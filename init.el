;; -*- lexical-binding: t -*-
(setq debug-on-error t)

;; This is the root configuration, more user specific configuration, see ./lisp

;; Version check
(let ((min-ver "25"))
  (if (version< emacs-version min-ver)
      (error "Your Emacs v%s is too old, requires v%s or higher!" emacs-version min-ver) (message "Your Emacs v%s is ok!" emacs-version)))


;; Load user specific configuration
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Get/set global env info
(defconst *spell-check-support-enabled* t)
(defconst *is-a-mac* (eq system-type 'darwin))

;; Set garbage collection thresholds
(let ((normal-gc-cons-threshold (* 128 1024 1024))
      (init-gc-cons-threshold (* 256 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
	    (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;; Load user specific configuration
(require 'init-themes)
(require 'init-spelling)

(provide 'init)

