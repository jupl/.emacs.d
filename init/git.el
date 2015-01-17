;;; git.el --- Git config
;;;
;;; Commentary:
;;; Configure Git related packages.
;;;
;;; Code:

(packages/add 'magit)
(packages/add 'gitconfig-mode)
(packages/add 'gitignore-mode)
(packages/add (if (display-graphic-p)
                'git-gutter-fringe
                'git-gutter))

(defun git/-run-hook ()
  "Start git related packages."
  (global-git-gutter-mode t))

(defun git/-diminish ()
  "Hide git related packages in modeline."
  (with-eval-after-load 'git-gutter (diminish 'git-gutter-mode))
  (with-eval-after-load 'magit (diminish 'magit-auto-revert-mode)))

(defun git/-init-evil ()
  "Set up git related packages with evil."
  (evil-set-initial-state 'magit-log-edit-mode 'insert)
  (evil-set-initial-state 'git-commit-mode 'insert))

(add-hook 'inits/hook 'git/-run-hook)
(with-eval-after-load 'diminish (git/-diminish))
(with-eval-after-load 'evil (git/-init-evil))

;;; git.el ends here
