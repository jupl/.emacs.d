;;; snippet.el --- Snippet config
;;;
;;; Commentary:
;;; Configure snippets using Yasnippet.
;;;
;;; Code:

(packages/add 'yasnippet)

(defun snippet/-hook ()
  "Start snippet related packages."
  (yas-global-mode t))

(defun snippet/-diminish ()
  "Hide snippet related packages in modeline."
  (with-eval-after-load 'yasnippet (diminish 'yas-minor-mode)))

(add-hook 'inits/hook 'snippet/-hook)
(with-eval-after-load 'diminish (snippet/-diminish))

;;; snippet.el ends here
