;; -*- lexical-binding: t -*-

(use-package hl-line
  :init
  (global-hl-line-mode 1))

(use-package linum
  :hook
  (prog-mode . linum-mode))

(use-package linum-relative
  :after (linum)
  :init
  (setq linum-relative-current-symbol "")
  (linum-relative-mode))
