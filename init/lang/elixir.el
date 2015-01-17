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

(defun elixir/-mode ()
  "Add additional configuration to Elixir mode."
  (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
    "\\(?:^\\|\\s-+\\)\\(?:do\\)")
  (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
  (ruby-end-mode t))

(defun elixir/-diminish ()
  "Hide Elixir related packages in modeline."
  (with-eval-after-load 'alchemist (diminish 'alchemist-mode))
  (with-eval-after-load 'ruby-end (diminish 'ruby-end-mode)))

(defun elixir/-init ()
  "Set up Elixir mode."
  (add-to-list 'elixir-mode-hook 'elixir/-mode)
  (with-eval-after-load 'web-mode
    (add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))))

(with-eval-after-load 'diminish (elixir/-diminish))
(with-eval-after-load 'elixir-mode (elixir/-init))

;;; elixir.el ends here
