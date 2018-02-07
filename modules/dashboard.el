;; -*- lexical-binding: t -*-

(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "bh" #'projectile-invalidate-cache)
  :config
  (setq
   dashboard-banner-logo-title nil
   dashboard-items '((recents . 5)
                     (projects . 5))
   dashboard-page-separator "\n\n\f\n\n"))
