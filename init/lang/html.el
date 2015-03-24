;;; html.el --- HTML config
;;;
;;; Commentary:
;;; Configure HTML and HTML-related derivatives.
;;;
;;; Code:

(packages/add 'emmet-mode)
(packages/add 'rainbow-mode)
(packages/add 'tagedit)
(packages/add 'web-mode)

(defun html/-mode ()
  "Additional setup to Web mode."
  (with-eval-after-load 'autopair (autopair-mode -1)))

(defun html/-diminish ()
  "Hide HTML related packages in modeline."
  (with-eval-after-load 'emmet-mode (diminish 'emmet-mode))
  (with-eval-after-load 'rainbow-mode (diminish 'rainbow-mode))
  (with-eval-after-load 'tagedit (diminish 'tagedit-mode)))

(defun html/-init-web ()
  "Set up web mode in HTML family."
  (setq-default web-mode-markup-indent-offset 2)
  (with-eval-after-load 'emmet-mode (add-hook 'web-mode-hook 'emmet-mode))
  (with-eval-after-load 'rainbow-mode (add-hook 'web-mode-hook 'rainbow-mode))
  (with-eval-after-load 'tagedit (add-hook 'web-mode-hook 'tagedit-mode))
  (add-hook 'html-mode-hook 'web-mode)
  (add-hook 'web-mode-hook 'html/-mode))

(with-eval-after-load 'diminish (html/-diminish))
(with-eval-after-load 'web-mode (html/-init-web))

;;; html.el ends here
