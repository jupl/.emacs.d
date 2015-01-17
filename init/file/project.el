;;; project.el --- Project config
;;;
;;; Commentary:
;;; Configure Projectile for project-related items.
;;;
;;; Code:

(packages/add 'grizzl)
(packages/add 'projectile)

(defvar evil-normal-state-map)

(defun project/-run-hook ()
  "Start project related packages."
  (projectile-global-mode t))

(defun project/-diminish ()
  "Hide project related packages in modeline."
  (with-eval-after-load 'projectile (diminish 'projectile-mode)))

(defun project/-init ()
  "Set up projectile."
  (setq-default projectile-completion-system 'grizzl))

(defun project/-init-evil ()
  "Set up project related packages with evil."
  (define-key evil-normal-state-map (kbd "C-u") 'projectile-find-file))

(add-hook 'inits/hook 'project/-run-hook)
(with-eval-after-load 'diminish (project/-diminish))
(with-eval-after-load 'evil (project/-init-evil))
(with-eval-after-load 'projectile (project/-init))

;;; project.el ends here
