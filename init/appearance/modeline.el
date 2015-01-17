;;; modeline.el --- Mode line config
;;;
;;; Commentary:
;;; Configure/customize appearance of mode line.
;;;
;;; Code:

(packages/add 'diminish)
(packages/add 'powerline)
(packages/add 'powerline-evil)

(defun modeline/-hook ()
  "Apply modeline tweaks."
  (powerline-evil-center-color-theme))

(defun modeline/-diminish ()
  "Hide modeline tweaking related packages in modeline."
  (diminish 'undo-tree-mode)
  (diminish 'visual-line-mode)
  (with-eval-after-load 'hi-lock (diminish 'hi-lock-mode)))

(defun modeline/-init()
  "Set up powerline."
  (setq-default powerline-default-separator nil))

(add-hook 'inits/hook 'modeline/-hook)
(with-eval-after-load 'diminish (modeline/-diminish))
(with-eval-after-load 'powerline (modeline/-init))

;;; modeline.el ends here
