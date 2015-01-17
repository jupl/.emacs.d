;;; saveplace.el --- Saveplace config
;;;
;;; Commentary:
;;; Configure saveplace.
;;;
;;; Code:

(packages/add 'saveplace)

(defun saveplace/-init ()
  "Set up saveplace."
  (setq-default save-place t)
  (setq-default save-place-file (concat user-emacs-directory "saveplace")))

(with-eval-after-load 'saveplace (saveplace/-init))

;;; saveplace.el ends here
