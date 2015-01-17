;;; editorconfig.el --- Editorconfig config
;;;
;;; Commentary:
;;; Configure editorconfig-mode. Make sure Editorconfig is installed.
;;;
;;; Code:

(packages/add 'editorconfig)

(defun editorconfig/-run-hook ()
  "Set up for Editorconfig."
  (add-to-list 'auto-mode-alist '("\\.editorconfig" . conf-unix-mode)))

(defun editorconfig/-init-shell ()
  "Set up shell to ensure editorconfig works."
  (exec-path-from-shell-setenv "SHELL" "/bin/bash")
  (exec-path-from-shell-initialize))

(add-hook 'after-init-hook 'editorconfig/-run-hook)
(when (and (display-graphic-p) (eq system-type 'darwin))
  (packages/add 'exec-path-from-shell)
  (with-eval-after-load 'exec-path-from-shell (editorconfig/-init-shell)))

;;; editorconfig.el ends here
