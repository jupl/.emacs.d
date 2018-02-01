;; -*- lexical-binding: t -*-

(setq
 make-backup-files nil
 create-lockfiles nil
 custom-file (concat jupl-path "custom.el")
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
