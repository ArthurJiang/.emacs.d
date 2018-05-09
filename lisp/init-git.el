;;; init-git.el --- git configuration

;;; Commentary:
;;
;; git configuration
;;

;;; Code:
(require-package 'diff-hl)
(when *is-gui*
  (global-diff-hl-mode)
  ;; Enable it only in 'prog-mode buffers, with vc-dir integration:
  ;; (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
  ;; (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
  )
(provide 'init-git)
;;; init-git.el ends here
