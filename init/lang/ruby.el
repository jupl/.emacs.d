;;; ruby.el --- Ruby config
;;;
;;; Commentary:
;;; Configure ruby-mode. The following Gems should be installed: rubocop.
;;;
;;; Code:

(packages/add 'inf-ruby)
(packages/add 'ruby-end)

(defun ruby/-run-hook ()
  "Set up for Ruby."
  (setq-default ruby-indent-level 2))

(defun ruby/-diminish ()
  "Hide Ruby related packages in modeline."
  (with-eval-after-load 'ruby-end (diminish 'ruby-end-mode)))

(defun ruby/-init-web ()
  "Set up web mode for Ruby templates."
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))

(add-hook 'inits/hook 'ruby/-run-hook)
(with-eval-after-load 'diminish (ruby/-diminish))
(with-eval-after-load 'web-mode (ruby/-init-web))

;;; ruby.el ends here
