;;; swift.el --- Swift config
;;;
;;; Commentary:
;;; Configure Swift related packages.
;;;
;;; Code:

(packages/add 'swift-mode)

(defvar flycheck-checkers)

(defun swift/-init ()
  "Set up Swift."
  (with-eval-after-load 'flycheck (add-to-list 'flycheck-checkers 'swift)))

(with-eval-after-load 'swift-mode (swift/-init))

;;; swift.el ends here
