;; -*- lexical-binding: t -*-

(use-package projectile
  :init
  (projectile-global-mode 1)
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "pi" 'projectile-invalidate-cache))

(use-package helm-projectile
  :after (helm projectile)
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "pf" 'helm-projectile-find-file
   "pp" 'helm-projectile-switch-project))
