;; -*- lexical-binding: t -*-

(setq
 display-time-default-load-average nil
 display-time-format "%a %m-%d %I:%M"
 line-spacing 0
 whitespace-line-column 79)

(use-package doom-themes
  :init
  (load-theme 'doom-one t))
