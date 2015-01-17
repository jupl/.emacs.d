;;; org.el --- Org config
;;;
;;; Commentary:
;;; Configure org-mode.  Installing evil-org is currently a hack to wait
;;; for evil-leader to be installed first.
;;;
;;; Code:

(packages/add 'org)
(packages/add 'org-present)

(defvar-local mode-line-format-content nil)

(defun org/-enable-present ()
  "Additional configurations for org present."
  (setq mode-line-format-content mode-line-format)
  (setq mode-line-format nil)
  (org-present-big)
  (org-display-inline-images)
  (org-present-hide-cursor)
  (org-present-read-only)
  (tabbar-mode 0)
  (global-hl-line-mode 0))

(defun org/-disable-present ()
  "Undo additional configurations for org present."
  (when mode-line-format-content
    (setq mode-line-format mode-line-format-content)
    (setq mode-line-format-content nil))
  (org-present-small)
  (org-remove-inline-images)
  (org-present-show-cursor)
  (org-present-read-write)
  (tabbar-mode t)
  (global-hl-line-mode t))

(defun org/-diminish ()
  "Hide org related packages in modeline."
  (with-eval-after-load 'evil-org (diminish 'evil-org-mode)))

(defun org/-init-evil ()
  "Set up org related packages with evil."
  (evil-set-initial-state 'org-agenda-mode 'normal))

(defun org/-init-evil-leader ()
  "Set up evil leader keys for org mode."
  (packages/-install-package 'evil-org)
  (evil-leader/set-key-for-mode 'org-mode
    "p" 'org-present
    "q" 'org-present-quit
    "b" 'org-present-big
    "s" 'org-present-small))

(defun org/-init-present ()
  "Set up presenting in org."
  (defvar org-present-mode-keymap nil)
  (add-hook 'org-present-mode-hook 'org/-enable-present)
  (add-hook 'org-present-mode-quit-hook 'org/-disable-present)
  (define-key org-present-mode-keymap [left] 'org-present-prev)
  (define-key org-present-mode-keymap [right] 'org-present-next)
  (define-key org-present-mode-keymap (kbd "<prior>") 'org-present-prev)
  (define-key org-present-mode-keymap (kbd "<next>") 'org-present-next))

(setq-default org-src-fontify-natively t)
(with-eval-after-load 'diminish (org/-diminish))
(with-eval-after-load 'evil (org/-init-evil))
(with-eval-after-load 'evil-leader (org/-init-evil-leader))
(with-eval-after-load 'org-present (org/-init-present))

;;; org.el ends here
