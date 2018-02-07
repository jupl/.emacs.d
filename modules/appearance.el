;; -*- lexical-binding: t -*-

(setq
 display-time-default-load-average nil
 display-time-format "%a %m-%d %I:%M"
 line-spacing 0
 whitespace-line-column 79)

;; Customize fonts
(when (member jupl-fixed-pitch (font-family-list))
  (set-face-attribute 'default nil :family jupl-fixed-pitch))
(when (member jupl-variable-pitch (font-family-list))
  (set-face-attribute 'variable-pitch nil :family jupl-variable-pitch))
(when (fboundp 'mac-auto-operator-composition-mode)
  (mac-auto-operator-composition-mode t))

(use-package menu-bar
  :config
  (menu-bar-mode -1))

(use-package scroll-bar
  :config
  (toggle-scroll-bar -1))

(use-package tool-bar
  :config
  (tool-bar-mode -1))

(use-package doom-themes
  :init
  (load-theme 'doom-one t))

(use-package highlight-parentheses
  :hook
  (prog-mode . highlight-parentheses-mode)
  :init
  (setq
   hl-paren-delay 0.2
   hl-paren-colors '("SpringGreen3"
                     "IndianRed1"
                     "IndianRed3"
                     "IndianRed4")))

(use-package mixed-pitch
  :hook
  (text-mode . mixed-pitch-mode))

(use-package smartparens
  :init
  (show-smartparens-global-mode 1))
