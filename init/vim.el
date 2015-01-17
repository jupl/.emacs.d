;;; vim.el --- Vim config
;;;
;;; Commentary:
;;; Configure vim features using Evil.
;;;
;;; Code:

(packages/add 'evil)
(packages/add 'evil-leader)

(defvar evil-normal-state-map)
(defvar evil-visual-state-map)
(defvar evil-motion-state-map)

(defun vim/-run-hook ()
  "Start vim using evil mode."
  (global-evil-leader-mode t)
  (evil-mode t))

(defun vim/-diminish ()
  "Hide vim related packages in modeline."
  (diminish 'overwrite-mode))

(defun vim/-init ()
  "Set up evil mode."
  (setq-default evil-move-cursor-back nil)
  (setq-default evil-shift-width 2)
  (evil-ex-define-cmd "bd[elete]" 'kill-this-buffer)
  (evil-ex-define-cmd "bw[indow]" 'kill-buffer-and-window)
  (define-key evil-normal-state-map (kbd "C-f") 'maximize-window)
  (define-key evil-normal-state-map (kbd "C-g") 'winner-undo)
  (define-key evil-normal-state-map (kbd "C-;") 'other-frame)
  (define-key evil-normal-state-map (kbd "C-S-j") 'evil-window-prev)
  (define-key evil-normal-state-map (kbd "C-S-k") 'evil-window-next)
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  (define-key evil-visual-state-map (kbd ";") 'evil-ex)
  (define-key evil-motion-state-map (kbd ";") 'evil-ex)
  (define-key evil-normal-state-map (kbd "<up>") 'enlarge-window)
  (define-key evil-normal-state-map (kbd "<down>") 'shrink-window)
  (define-key evil-normal-state-map [left] 'shrink-window-horizontally)
  (define-key evil-normal-state-map [right] 'enlarge-window-horizontally)
  (define-key evil-normal-state-map (kbd "<escape>") 'keyboard-quit)
  (define-key evil-visual-state-map (kbd "<escape>") 'keyboard-quit)
  (define-key evil-motion-state-map (kbd "<escape>") 'keyboard-quit)
  (evil-set-initial-state 'completion-list-mode 'normal)
  (evil-set-initial-state 'help-mode 'normal)
  (global-set-key [escape] 'evil-exit-emacs-state))

(defun vim/-init-leader ()
  "Set up evil leader mode."
  (evil-leader/set-leader "<SPC>"))

(add-hook 'inits/hook 'vim/-run-hook)
(with-eval-after-load 'diminish (vim/-diminish))
(with-eval-after-load 'evil (vim/-init))
(with-eval-after-load 'evil-leader (vim/-init-leader))

;;; vim.el ends here
