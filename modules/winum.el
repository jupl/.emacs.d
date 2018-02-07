;; -*- lexical-binding: t -*-

(use-package winum
  :general
  (:prefix "SPC"
   :states '(normal visual)
   "0" #'winum-select-window-0-or-10
   "1" #'winum-select-window-1
   "2" #'winum-select-window-2
   "3" #'winum-select-window-3
   "4" #'winum-select-window-4
   "5" #'winum-select-window-5
   "6" #'winum-select-window-6
   "7" #'winum-select-window-7
   "8" #'winum-select-window-8
   "9" #'winum-select-window-9)
  :init
  (setq winum-auto-setup-mode-line nil)
  (winum-mode 1))
