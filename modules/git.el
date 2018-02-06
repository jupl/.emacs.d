;; -*- lexical-binding: t -*-

(use-package evil-magit
  :demand t
  :after (evil magit))

(use-package gitconfig-mode)

(use-package gitignore-mode)

(use-package helm-gitignore
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "gI" 'helm-gitignore))

(use-package magit
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "gs" 'magit-status)
  :init
  (setq
   magit-commit-show-diff nil
   magit-visit-ref-behavior '(create-branch checkout-branch))
  :config
  (magit-add-section-hook 'magit-status-sections-hook
                          'magit-insert-unpushed-to-upstream
                          'magit-insert-unpushed-to-upstream-or-recent
                          'replace))
