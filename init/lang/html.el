;;; html.el --- HTML config
;;;
;;; Commentary:
;;; Configure HTML and HTML-related derivatives.
;;;
;;; Code:

(packages/add 'emmet-mode)
(packages/add 'rainbow-mode)
(packages/add 'web-mode)
(packages/add 'tagedit)

(defun html/-diminish ()
  "Hide HTML related packages in modeline."
  (with-eval-after-load 'emmet-mode (diminish 'emmet-mode))
  (with-eval-after-load 'rainbow-mode (diminish 'rainbow-mode))
  (with-eval-after-load 'tagedit (diminish 'tagedit-mode)))

(defun html/-init-web ()
  "Set up web mode in HTML family."
  (setq-default web-mode-markup-indent-offset 2)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'rainbow-mode)
  (add-hook 'web-mode-hook 'tagedit-mode)
  (add-hook 'html-mode-hook 'web-mode))

(with-eval-after-load 'diminish (html/-diminish))
(with-eval-after-load 'web-mode (html/-init-web))

;;; html.el ends here
