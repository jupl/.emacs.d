;;; js.el --- JavaScript/JSON config
;;;
;;; Commentary:
;;; Configure JavaScript and JSON related packages. The following NPM pacakges
;;; should be installed: jshint, jsonlint, tern.
;;;
;;; Code:

(packages/add 'js2-mode)
(packages/add 'js-doc)
(packages/add 'json-mode)
(packages/add 'nodejs-repl)
(packages/add 'tern)
(packages/add 'company-tern)

(defvar company-backends)

(defun js/-mode ()
  "Additional setup to JS mode."
  (setq-default comment-start "// ")
  (setq-default comment-end "")
  (push '("..." . ?…) prettify-symbols-alist)
  (push '("=>" . ?→) prettify-symbols-alist)
  (push '(">=" . ?≥) prettify-symbols-alist)
  (push '("<=" . ?≤) prettify-symbols-alist)
  (push '("export" . ?◄) prettify-symbols-alist)
  (push '("from" . ?←) prettify-symbols-alist)
  (push '("function" . ?ƒ) prettify-symbols-alist)
  (push '("import" . ?►) prettify-symbols-alist)
  (push '("require" . ?Я) prettify-symbols-alist)
  (push '("return" . ?●) prettify-symbols-alist)
  (push '("yield" . ?γ) prettify-symbols-alist)
  (tern-mode t))

(defun js/-diminish ()
  "Hide JS related packages in modeline."
  (with-eval-after-load 'tern (diminish 'tern-mode)))

(defun js/-init ()
  "Set up JS mode."
  (setq-default js2-basic-offset 2)
  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-hook 'js2-mode-hook 'js/-mode))

(defun js/-init-company ()
  "Add JS specific packages to company mode."
  (with-eval-after-load 'company-tern
    (add-to-list 'company-backends 'company-tern)))

(defun js/-init-json ()
  "Set up JSON mode."
  (add-to-list 'auto-mode-alist '("\\.babelrc" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.bowerrc" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.eslintrc" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.jshintrc" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.tern-project" . json-mode)))

(defun js/-init-web ()
  "Set up web mode for JS related templates."
  (add-to-list 'auto-mode-alist '("\\.swig\\'" . web-mode)))

(with-eval-after-load 'company (js/-init-company))
(with-eval-after-load 'diminish (js/-diminish))
(with-eval-after-load 'js2-mode (js/-init))
(with-eval-after-load 'json-mode (js/-init-json))
(with-eval-after-load 'web-mode (js/-init-web))

;;; js.el ends here
