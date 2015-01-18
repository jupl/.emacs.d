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

(defun clojure/-init ()
  "Set up Clojure."
  (with-eval-after-load 'evil-leader (clojure/-init-evil-leader)))

(defun clojure/-init-evil-leader ()
  "Set up evil leader keys for Clojure."
  (with-eval-after-load 'cider
    (evil-leader/set-key-for-mode 'clojure-mode
      "cs" 'cider-jack-in
      "cq" 'cider-quit
      "cr" 'cider-load-buffer)))

(add-hook 'lisp/hook 'clojure/-run-hook)
(with-eval-after-load 'diminish (clojure/-diminish))
(with-eval-after-load 'clojure-mode (clojure/-init))

;;; clojure.el ends here
