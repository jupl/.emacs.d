;;; dirtree.el --- Dirtree config
;;;
;;; Commentary:
;;; Configure directory tree view using Neotree.
;;;
;;; Code:

(packages/add 'neotree)

(defvar evil-normal-state-map)
(defvar-local dirtree/font-size (face-attribute 'default :height))

(defun dirtree/detect-project ()
  "Toggle Neotree with autoswitching to Projectile project if available."
  (interactive)
  (if (and (ignore-errors (projectile-project-root))
        (not (neo-global--window-exists-p)))
    (neotree-projectile-action)
    (neotree-toggle)))

(defun dirtree/-init()
  "Set up dirtree with neotree."
  (setq-default neo-auto-indent-point t)
  (setq-default neo-banner-message nil)
  (setq-default neo-dont-be-alone t)
  (setq-default neo-hidden-files-regexp "\\(^[.#]\\)\\|\\(~$\\)")
  (setq-default neo-mode-line-type 'none)
  (setq-default neo-show-updir-line nil)
  (setq-default neo-theme 'ascii)
  (set-face-attribute 'neo-banner-face nil :height dirtree/font-size)
  (set-face-attribute 'neo-button-face nil :height dirtree/font-size)
  (set-face-attribute 'neo-dir-link-face nil :height dirtree/font-size)
  (set-face-attribute 'neo-expand-btn-face nil :height dirtree/font-size)
  (set-face-attribute 'neo-file-link-face nil :height dirtree/font-size)
  (set-face-attribute 'neo-header-face nil :height dirtree/font-size)
  (set-face-attribute 'neo-root-dir-face nil :height dirtree/font-size))

(defun dirtree/-init-evil ()
  "Set up dirtree with evil."
  (define-key evil-normal-state-map (kbd "C-h") 'dirtree/detect-project))

(with-eval-after-load 'neotree (dirtree/-init))
(with-eval-after-load 'evil (dirtree/-init-evil))

;;; dirtree.el ends here
