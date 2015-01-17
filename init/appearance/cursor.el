;;; cursor.el --- Cursor config
;;;
;;; Commentary:
;;; Configure cursor and line numbers.
;;;
;;; Code:

(packages/add 'linum-relative)
(when (display-graphic-p)
  (setq-default blink-cursor-blinks 0)
  (packages/add 'centered-cursor-mode))

(defun cursor/-run-hook ()
  "Apply cursor tweaks."
  (add-hook 'prog-mode-hook 'linum-mode t)
  (global-hl-line-mode t)
  (with-eval-after-load 'centered-cursor-mode (global-centered-cursor-mode t)))

(defun cursor/-diminish ()
  "Hide cursor tweaking related packages in modeline."
  (with-eval-after-load 'centered-cursor-mode (diminish 'centered-cursor-mode)))

(defun cursor/-init-linum-relative ()
  "Set up relative line numbers."
  (setq-default linum-relative-current-symbol ""))

(add-hook 'inits/hook 'cursor/-run-hook)
(with-eval-after-load 'diminish (cursor/-diminish))
(with-eval-after-load 'linum-relative (cursor/-init-linum-relative))

;;; cursor.el ends here
