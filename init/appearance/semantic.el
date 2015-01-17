;;; semantic.el --- Semantic config
;;;
;;; Commentary:
;;; Configure packages related to semantic highlighting.
;;;
;;; Code:

(packages/add 'color-identifiers-mode)
(packages/add 'rainbow-delimiters)

(defvar evil-normal-state-map)

(defun semantic/-init-evil ()
  "Set up semantic related packages with evil."
  (define-key evil-normal-state-map (kbd "C-i") 'color-identifiers-mode)
  (define-key evil-normal-state-map (kbd "C-o") 'rainbow-delimiters-mode))

(with-eval-after-load 'evil (semantic/-init-evil))

;;; semantic.el ends here
