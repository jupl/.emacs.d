;;; init.el --- Configurations bootstrapper
;;;
;;; Commentary:
;;; Load configuration files. If unique configurations are required consider
;;; leveraging local.el.
;;;
;;; Code:

(require 'package)

(defvar inits/hook)
(defvar packages/-list '())
(defvar inits/-list-loaded '())
(defvar inits/-list '( ;; List of inits to load
                       autocomplete
                       editorconfig
                       emacs
                       git
                       rest
                       vim
                       appearance/cursor
                       appearance/dirtree
                       appearance/modeline
                       appearance/semantic
                       appearance/tabbar
                       appearance/theme
                       file/project
                       file/saveplace
                       lang/clojure
                       lang/css
                       lang/dotnet
                       lang/elisp
                       lang/elixir
                       lang/extra
                       lang/html
                       lang/js
                       lang/lisp
                       lang/org
                       lang/php
                       lang/ruby
                       lang/swift
                       syntax/autopair
                       syntax/check
                       syntax/comment
                       syntax/snippet
                       ))

(defun packages/add (package)
  "Add a PACKAGE to be installed later."
  (unless (member package packages/-list)
    (setq packages/-list (push package packages/-list))))

(defun inits/-run-hook ()
  "Load inits, install required packages, then kick off init hook."
  (inits/-load)
  (packages/-install)
  (run-hooks 'inits/hook))

(defun inits/-load ()
  "Load all inits defined in inits list."
  (mapcar 'inits/-load-init inits/-list))

(defun inits/-load-local ()
  "Load local.el if it exists for machine- and user- specific configurations."
  (let ((local-init (concat user-emacs-directory "local.el")))
    (when (file-exists-p local-init)
      (load local-init))))

(defun inits/-load-init (init)
  "Load INIT if it has not been loaded already."
  (unless (member init inits/-list-loaded)
    (setq inits/-list-loaded (push init inits/-list-loaded))
    (load (concat user-emacs-directory "init/" (symbol-name init) ".el"))))

(defun packages/-init ()
  "Initialize package system before loading inits."
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))
  (add-hook 'after-init-hook 'inits/-run-hook))

(defun packages/-install ()
  "Install all packages defined in packages list."
  (mapcar 'packages/-install-package packages/-list))

(defun packages/-install-package (package)
  "Require a PACKAGE.  Install the package if it is not installed already."
  (unless (require package nil t)
    (package-install package)
    (require package)))

(inits/-load-local)
(with-eval-after-load 'package (packages/-init))

;;; init.el ends here
