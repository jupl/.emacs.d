;;; elixir.el --- Elixir config
;;;
;;; Commentary:
;;; Configure Elixir and related packages.
;;;
;;; Code:

(packages/add 'alchemist)
(packages/add 'elixir-mode)
(packages/add 'ruby-end)

(defvar elixir-mode-hook)
(defvar ruby-end-expand-keywords-before-re)
(defvar ruby-end-check-statement-modifiers)

(defun elixir/-mode ()
  "Add additional configuration to Elixir mode."
  (set (make-local-variable 'ruby-end-expand-keywords-before-re)
    "\\(?:^\\|\\s-+\\)\\(?:do\\)")
  (set (make-local-variable 'ruby-end-check-statement-modifiers) nil)
  (ruby-end-mode t))

(defun elixir/-diminish ()
  "Hide Elixir related packages in modeline."
  (with-eval-after-load 'alchemist (diminish 'alchemist-mode))
  (with-eval-after-load 'ruby-end (diminish 'ruby-end-mode)))

(defun elixir/-init ()
  "Set up Elixir mode."
  (add-to-list 'elixir-mode-hook 'elixir/-mode))

(defun elixir/-init-web ()
  "Set up web mode for Elixir templates."
  (add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode)))

(with-eval-after-load 'diminish (elixir/-diminish))
(with-eval-after-load 'elixir-mode (elixir/-init))
(with-eval-after-load 'web-mode (elixir/-init-web))

;;; elixir.el ends here
