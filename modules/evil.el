;; -*- lexical-binding: t -*-

(use-package evil
  :general
  (:states '(normal visual)
   ";" 'evil-ex)
  :init
  (setq
   evil-echo-state nil
   evil-move-cursor-back nil)
  (evil-mode 1)
  :config
  (evil-ex-define-cmd "bd[elete]" 'kill-this-buffer))

(use-package evil-nerd-commenter
  :after (evil)
  :general
  (:prefix "SPC"
   :states '(normal visual)
   ";" 'evilnc-comment-or-uncomment-lines))
