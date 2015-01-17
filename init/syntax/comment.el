;;; comment.el --- Comment config
;;;
;;; Commentary:
;;; Configure comment-related packages.
;;;
;;; Code:

(packages/add 'evil-nerd-commenter)
(packages/add 'hl-todo)

(defvar evil-visual-state-map)

(defun comment/-init-evil ()
  "Set up comment related packages with evil."
  (define-key evil-visual-state-map (kbd "/")
    'evilnc-comment-or-uncomment-lines))

(defun comment/-init-todo ()
  "Set up todo comment highlighting."
  (add-hook 'prog-mode-hook 'hl-todo-mode))

(with-eval-after-load 'evil (comment/-init-evil))
(with-eval-after-load 'hl-todo (comment/-init-todo))

;;; comment.el ends here
