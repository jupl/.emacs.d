;;; autocomplete.el --- Autocomplete config
;;;
;;; Commentary:
;;; Configure autocomplete using Company.
;;;
;;; Code:

(packages/add 'company)

(defvar company-active-map)

(defun autocomplete/-hook ()
  "Start company globally."
  (global-company-mode t))

(defun autocomplete/-diminish ()
  "Hide autocomplete related packages in modeline."
  (with-eval-after-load 'company (diminish 'company-mode)))

(defun autocomplete/-init ()
  "Set up autocomplete related packages with evil."
  (setq-default company-begin-commands '(self-insert-command))
  (setq-default company-idle-delay 0)
  (setq-default company-minimum-prefix-length 2)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-<return>") 'company-select-next)
  (define-key company-active-map (kbd "C-S-<return>")
    'company-select-previous))

(add-hook 'inits/hook 'autocomplete/-hook)
(with-eval-after-load 'company (autocomplete/-init))
(with-eval-after-load 'diminish (autocomplete/-diminish))

;;; autocomplete.el ends here
