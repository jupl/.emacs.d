;;; theme.el --- Theme config
;;;
;;; Commentary:
;;; Configure theme.
;;;
;;; Code:

(packages/add 'monokai-theme)

(defun theme/-run-hook ()
  "Apply theme."
  (load-theme 'monokai t))

(defun theme/-init-powerline-evil ()
  "Apply colors to powerline-evil to match theme."
  (set-face-attribute 'powerline-evil-normal-face nil :background "#6B6B6B")
  (set-face-attribute 'powerline-evil-insert-face nil :background "#21889B")
  (set-face-attribute 'powerline-evil-visual-face nil :background "#A41F99")
  (set-face-attribute 'powerline-evil-operator-face nil :background "#67930F")
  (set-face-attribute 'powerline-evil-replace-face nil :background "#562AA6")
  (set-face-attribute 'powerline-evil-motion-face nil :background "#A20C41")
  (set-face-attribute 'powerline-evil-emacs-face nil :background "#A45E0A"))

(add-hook 'inits/hook 'theme/-run-hook)
(with-eval-after-load 'powerline-evil (theme/-init-powerline-evil))

;;; theme.el ends here
