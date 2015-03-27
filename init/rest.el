;;; rest.el --- REST client config.
;;;
;;; Commentary:
;;; Configure REST client.
;;;
;;; Code:

(packages/add 'restclient)

(defun rest/-init ()
  "Set up autocomplete related packages with evil."
  (add-to-list 'auto-mode-alist '("\\.http" . restclient-mode)))

(with-eval-after-load 'restclient (rest/-init))

;;; rest.el ends here
