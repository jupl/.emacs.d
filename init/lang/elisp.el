;;; elisp.el --- Emacs Lisp config
;;;
;;; Commentary:
;;; Configure Emacs Lisp related packages.
;;;
;;; Code:

(packages/add 'rainbow-mode)

(defun elisp/-diminish ()
  "Hide Emacs Lisp related packages in modeline."
  (with-eval-after-load 'rainbow-mode (diminish 'rainbow-mode)))

(defun elisp/-init ()
  "Additional setup for Emacs Lisp mode."
  (lisp/init 'emacs-lisp-mode))

(add-hook 'lisp/hook 'elisp/-init)
(with-eval-after-load 'diminish (elisp/-diminish))
(with-eval-after-load 'rainbow-mode
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode))

;;; elisp.el ends here
