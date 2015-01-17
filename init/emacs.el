;;; emacs.el --- Emacs config
;;;
;;; Commentary:
;;; Configure core Emacs.
;;;
;;; Code:

(defun highlight-columns (column)
  "Highlight lines that has characters going at or beyond COLUMN."
  (interactive "nEnter column to start highlighting: ")
  (highlight-lines-matching-regexp (format ".\\{%d\\}" column) 'hi-red-b))

(defun minibuffer-keyboard-quit ()
  "Abort recursive edit."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq-default deactivate-mark t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

;; Editor options
(defalias 'yes-or-no-p 'y-or-n-p)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default truncate-lines t)
(setq-default vc-follow-symlinks t)
(setq-default org-log-done t)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; Backup options
(setq-default backup-by-copying t)
(setq-default create-lockfiles nil)
(setq-default delete-old-versions t)
(setq-default kept-new-versions 6)
(setq-default kept-old-versions 2)
(setq-default make-backup-files nil)
(setq-default version-control t)
(setq-default backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq-default auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

;; Display options
(setq-default initial-scratch-message "")
(setq-default inhibit-splash-screen t)
(setq-default ring-bell-function 'ignore)
(when (display-graphic-p)
  (set-face-attribute 'default nil :family "Courier New")
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (if (eq system-type 'windows-nt)
    (set-face-attribute 'default nil :height 100)
    (set-face-attribute 'default nil :height 130))
  (setq-default default-directory "~/")
  (cd "~/"))
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (menu-bar-mode -1))
(when (fboundp 'winner-mode)
  (winner-mode t))

;;; emacs.el ends here
