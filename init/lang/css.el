;;; css.el --- CSS config
;;;
;;; Commentary:
;;; Configure CSS and related languages. The following NPM pacakges
;;; should be installed: less. The following Gems should be installed: sass.
;;;
;;; Code:

(packages/add 'emmet-mode)
(packages/add 'less-css-mode)
(packages/add 'rainbow-mode)
(packages/add 'scss-mode)

(defun css/-run-hook ()
  "Link plugins for css related modules."
  (setq-default css-indent-offset 2)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'less-css-mode-hook 'emmet-mode)
  (add-hook 'less-css-mode-hook 'rainbow-mode)
  (add-hook 'scss-mode-hook 'emmet-mode)
  (add-hook 'scss-mode-hook 'rainbow-mode))

(defun css/-diminish ()
  "Hide css related packages in modeline."
  (with-eval-after-load 'emmet-mode (diminish 'emmet-mode))
  (with-eval-after-load 'rainbow-mode (diminish 'rainbow-mode)))

(defun css/-init-scss ()
  "Set up scss mode."
  (setq-default scss-compile-at-save nil))

(add-hook 'inits/hook 'css/-run-hook)
(with-eval-after-load 'diminish (css/-diminish))
(with-eval-after-load 'scss-mode (css/-init-scss))

;;; css.el ends here
