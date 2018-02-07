;; -*- lexical-binding: t -*-

(use-package treemacs
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "ft" #'treemacs-toggle
   "fT" #'treemacs)
  :config
  (when (member jupl-variable-pitch (font-family-list))
    (set-face-attribute 'treemacs-directory-face nil :family jupl-variable-pitch)
    (set-face-attribute 'treemacs-file-face nil :family jupl-variable-pitch)
    (set-face-attribute 'treemacs-header-face nil :family jupl-variable-pitch)))

(use-package treemacs-evil
  :after (evil treemacs))

(use-package treemacs-projectile
  :after (projectile treemacs)
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "pt" #'treemacs-projectile))
