;;; ruby.el --- Ruby config
;;;
;;; Commentary:
;;; Configure ruby-mode. The following Gems should be installed: rubocop.
;;;
;;; Code:

(packages/add 'inf-ruby)
(packages/add 'ruby-end)

(defun ruby/-diminish ()
  "Hide Ruby related packages in modeline."
  (with-eval-after-load 'ruby-end (diminish 'ruby-end-mode)))

(setq-default ruby-indent-level 2)
(with-eval-after-load 'diminish (ruby/-diminish))
(with-eval-after-load 'web-mode
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))

;;; ruby.el ends here
