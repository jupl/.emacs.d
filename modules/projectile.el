;; -*- lexical-binding: t -*-

(use-package projectile
  :init
  (projectile-global-mode 1)
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "pi" #'projectile-invalidate-cache)
  :config
  (setq
   frame-title-format
   '((:eval
      (cond
       ((and buffer-file-truename (projectile-project-p))
        (concat "[" (projectile-project-name) "] " (file-relative-name
                                                    buffer-file-truename
                                                    (projectile-project-root))))
       ((projectile-project-p) (concat "[" (projectile-project-name) "]"))
       (buffer-file-truename buffer-file-truename)
       (t "Emacs"))))))

(use-package helm-projectile
  :after (helm projectile)
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "pf" #'helm-projectile-find-file
   "pp" #'helm-projectile-switch-project))
