;;; check.el --- Syntax checking config
;;;
;;; Commentary:
;;; Configure syntax checking using Flycheck.
;;;
;;; Code:

(packages/add 'flycheck)
(packages/add 'flycheck-pos-tip)
(packages/add 'flycheck-color-mode-line)

(defun syntax-check/-run-hook ()
  "Start global syntax checking."
  (global-flycheck-mode t))

(defun syntax-check/-diminish ()
  "Hide syntax check related packages in modeline."
  (with-eval-after-load 'flycheck (diminish 'flycheck-mode)))

(defun syntax-check/-init ()
  "Set up syntax checking with flycheck."
  (setq-default flycheck-display-errors-function
    'flycheck-pos-tip-error-messages)
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(add-hook 'inits/hook 'syntax-check/-run-hook)
(with-eval-after-load 'diminish (syntax-check/-diminish))
(with-eval-after-load 'flycheck (syntax-check/-init))

;;; check.el ends here
