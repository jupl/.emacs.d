;;; lisp.el --- Lisp config
;;;
;;; Commentary:
;;; Configure Lisp family related packages.
;;;
;;; Code:

(packages/add 'paredit)
(packages/add 'evil-paredit)

(defvar lisp/hook)

(defun lisp/init (lisp-mode)
  "Set up additional configuration for a LISP-MODE."
  (with-eval-after-load 'paredit (add-hook lisp-mode 'paredit-mode))
  (with-eval-after-load 'evil-leader
    (evil-leader/set-key-for-mode lisp-mode
      "j" 'paredit-forward-barf-sexp
      "k" 'paredit-forward-slurp-sexp
      "d" 'paredit-kill)))

(defun lisp/-diminish ()
  "Hide Lisp related packages in modeline."
  (with-eval-after-load 'paredit (diminish 'paredit-mode)))

(defun lisp/-init-paredit ()
  "Set up paredit mode."
  (add-hook 'paredit-mode-hook 'evil-paredit-mode))

(defun lisp/-run-hook ()
  "Run hook for Lisp variants."
  (run-hooks 'lisp/hook))

(add-hook 'inits/hook 'lisp/-run-hook)
(with-eval-after-load 'diminish (lisp/-diminish))
(with-eval-after-load 'paredit (lisp/-init-paredit))

;;; lisp.el ends here
