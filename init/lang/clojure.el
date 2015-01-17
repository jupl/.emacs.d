;;; clojure.el --- Clojure config
;;;
;;; Commentary:
;;; Configure Clojure related packages.
;;;
;;; Code:

(packages/add 'cider)
(packages/add 'clojure-mode)
(packages/add 'clojure-mode-extra-font-locking)

(defun clojure/-diminish ()
  "Hide Clojure related packages in modeline."
  (with-eval-after-load 'cider (diminish 'cider-mode)))

(defun clojure/-init ()
  "Additional setup for Clojure mode."
  (lisp/init 'clojure-mode))

(add-hook 'lisp/hook 'clojure/-init)
(with-eval-after-load 'diminish (clojure/-diminish))

;;; clojure.el ends here
