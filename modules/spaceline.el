;; -*- lexical-binding: t -*-

(use-package spaceline-config
  :demand t
  :ensure spaceline
  :config
  (spaceline-spacemacs-theme))

(use-package spaceline
  :after (helm)
  :config
  (spaceline-helm-mode 1))

(use-package spaceline
  :after (evil)
  :config
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state))

(use-package spaceline-all-the-icons
  :if (member "all-the-icons" (font-family-list))
  :after (spaceline)
  :init
  (setq spaceline-all-the-icons-separator-type 'none)
  (spaceline-all-the-icons-theme))
