;; -*- lexical-binding: t -*-

(use-package treemacs
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "ft" 'treemacs-toggle
   "fT" 'treemacs))

(use-package treemacs-evil
  :after (evil treemacs))

(use-package treemacs-projectile
  :after (projectile treemacs)
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "pt" 'treemacs-projectile))
