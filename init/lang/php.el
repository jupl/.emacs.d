;;; php.el --- PHP config
;;;
;;; Commentary:
;;; Configure PHP related packages.
;;;
;;; Code:

(defun php/-init-web ()
  "Set up web mode for PHP templates."
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode)))

(with-eval-after-load 'web-mode (php/-init-web))

;;; php.el ends here
