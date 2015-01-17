;;; clojure.el --- Clojure config
;;;
;;; Commentary:
;;; Configure Clojure related packages.
;;;
;;; Code:

(packages/add 'cider)
(packages/add 'clojure-mode)
(packages/add 'clojure-mode-extra-font-locking)

(defun clojure/-run-hook ()
  "Additional setup for Clojure mode."
  (lisp/init 'clojure-mode))

(defun clojure/-diminish ()
  "Hide Clojure related packages in modeline."
  (with-eval-after-load 'cider (diminish 'cider-mode)))

(add-hook 'lisp/hook 'clojure/-run-hook)
(with-eval-after-load 'diminish (clojure/-diminish))

;;; clojure.el ends here
