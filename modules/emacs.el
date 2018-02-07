;; -*- lexical-binding: t -*-

(setq
 make-backup-files nil
 create-lockfiles nil
 custom-file (concat user-emacs-directory "custom.el")
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
