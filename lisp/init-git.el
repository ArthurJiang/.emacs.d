;;; init-git.el --- git configuration

;;; Commentary:
;;
;; git configuration
;;

;;; Code:
(require-package 'diff-hl)
(when *is-gui*
  ;; Enable it only in 'prog-mode buffers, with vc-dir integration:
  ;; (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
  ;; (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
  (custom-set-faces
   '(diff-hl-change ((t (:backgroung "#ef921e"))))
   '(diff-hl-insert ((t (:background "#82d2d7"))))
   '(diff-hl-delete ((t (:background "#f59cb1"))))
   )
  (global-diff-hl-mode 1)
  )
(provide 'init-git)
;;; init-git.el ends here
