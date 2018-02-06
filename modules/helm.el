;; -*- lexical-binding: t -*-

(use-package helm
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "SPC" 'helm-M-x
   "bb" 'helm-mini
   "hi" 'helm-info-at-point)
  :init
  (setq helm-mode-handle-completion-in-region nil)
  (helm-mode 1)
  :config
  (helm-locate-set-command)
  (setq helm-locate-fuzzy-match (string-match "locate" helm-locate-command)))
