;;; init.el --- This is the root configuration, more user specific configuration, see ./lisp

;;; Commentary:
;;
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; 

;;; Code:
(package-initialize)
;; -*- lexical-binding: t -*-
(setq debug-on-error t)

;; Version check
(let ((min-ver "26"))
  (if (version< emacs-version min-ver)
      (error "Your Emacs v%s is too old, requires v%s or higher!" emacs-version min-ver) (message "Your Emacs v%s is ok!" emacs-version)))

;; Graphic check
(if (display-graphic-p)
    (progn
      (message "---Run Emacs in graphic mode!---")
      (defconst *is-gui* t))
  (message "---Run Emacs in terminal mode!---")
  (defconst *is-gui* nil))

;; Global configuration
(defconst *spell-check-support-enabled* t) ;; Enable with t if you prefer
(defconst *normal-gc-cons-threshold* (* 128 1024 1024))
(defconst *init-gc-cons-threshold* (* 256 1024 1024))
(defconst *is-a-mac* (eq system-type 'darwin))

;; Load user specific configuration
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Set garbage collection thresholds
(setq gc-cons-threshold *init-gc-cons-threshold*)
(add-hook 'after-init-hook
	  (lambda () (setq gc-cons-threshold *normal-gc-cons-threshold*)))

;; Load user specific configuration
(require 'init-elpa)
(require 'init-themes)
(require 'init-font)
(require 'init-git)
(require 'init-editing)
(require 'init-env)

(when *spell-check-support-enabled*
  (require 'init-spelling))

(require 'init-flycheck)
(require 'init-company)

(require 'init-markdown)
(require 'init-latex)
(require 'init-org)

;; Programming
;; (require 'init-python)
(require 'init-lua)

;; Allow access from Emacs client
(require 'server)
(unless (server-running-p)
  (server-start))

;; Disable emacs GUI menu/tool bar
(when *is-gui*
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (fringe-mode '(8 . 0))
  (setq inhibit-splash-screen t)
  (setq inhibit-startup-message t)
  (toggle-frame-fullscreen))

(provide 'init)
;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(linum-format (quote dynamic))
 '(package-selected-packages (quote (word-count word-count-mode session smex flycheck)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-hl-change ((t (:backgroung "#ef921e"))))
 '(diff-hl-delete ((t (:background "#f59cb1"))))
 '(diff-hl-insert ((t (:background "#82d2d7"))))
 '(hl-line ((t (:background "gray30")))))
