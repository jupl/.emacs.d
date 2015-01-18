;;; tabbar.el --- Tabbar config
;;;
;;; Commentary:
;;; Configure tabbar using Tabbar Ruler.
;;;
;;; Code:

(eval-when-compile (require 'cl))
(packages/add 'tabbar-ruler)

(defvar evil-normal-state-map)

(defun tabbar/-init ()
  "Set up tabbar."
  (global-set-key (kbd "C-<tab>") 'tabbar-mode)
  (with-eval-after-load 'projectile (tabbar/-init-projectile)))

(defun tabbar/-init-evil ()
  "Set up tabbar with evil."
  (define-key evil-normal-state-map (kbd "C-j") 'tabbar-ruler-backward)
  (define-key evil-normal-state-map (kbd "C-k") 'tabbar-ruler-forward)
  (define-key evil-normal-state-map (kbd "C-l")
    'tabbar-ruler-tabbar-forward-group)
  (define-key evil-normal-state-map (kbd "C-S-l")
    'tabbar-ruler-tabbar-backward-group))

(defun tabbar/-init-projectile ()
  "Set up projectile integration with tabbar."
  (tabbar-ruler-group-by-projectile-project))

(with-eval-after-load 'evil (tabbar/-init-evil))
(with-eval-after-load 'tabbar-ruler (tabbar/-init))

;;; tabbar.el ends here
