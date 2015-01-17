;;; autopair.el --- Autopair config
;;;
;;; Commentary:
;;; Configure autopair-mode.
;;;
;;; Code:

(packages/add 'autopair)

(defun autopair/-run-hook ()
  "Start autopair."
  (autopair-global-mode))

(defun autopair/-diminish ()
  "Hide autopair in modeline."
  (with-eval-after-load 'autopair (diminish 'autopair-mode)))

(add-hook 'inits/hook 'autopair/-run-hook)
(with-eval-after-load 'diminish (autopair/-diminish))

;;; autopair.el ends here
