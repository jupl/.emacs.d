;;; elisp.el --- Emacs Lisp config
;;;
;;; Commentary:
;;; Configure Emacs Lisp related packages.
;;;
;;; Code:

(packages/add 'rainbow-mode)

(defun elisp/-run-hook ()
  "Additional setup for Emacs Lisp mode."
  (lisp/init 'emacs-lisp-mode))

(defun elisp/-diminish ()
  "Hide Emacs Lisp related packages in modeline."
  (with-eval-after-load 'rainbow-mode (diminish 'rainbow-mode)))

(defun elisp/-init-rainbow ()
  "Set up rainbow mode for Emacs Lisp."
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode))

(add-hook 'lisp/hook 'elisp/-run-hook)
(with-eval-after-load 'diminish (elisp/-diminish))
(with-eval-after-load 'rainbow-mode (elisp/-init-rainbow))

;;; elisp.el ends here
