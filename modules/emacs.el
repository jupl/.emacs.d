;; -*- lexical-binding: t -*-

(setq
 make-backup-files nil
 create-lockfiles nil
 custom-file (concat jupl-path "custom.el")
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
