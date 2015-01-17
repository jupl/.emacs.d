;;; init.el --- Configurations bootstrapper
;;;
;;; Commentary:
;;; Load configuration files
;;;
;;; Code:

(require 'package)

(defvar inits/hook)
(defvar packages/-list '())
(defvar inits/-list '( autocomplete
                       editorconfig
                       emacs
                       git
                       vim
                       appearance/cursor
                       appearance/dirtree
                       appearance/modeline
                       appearance/semantic
                       appearance/tabbar
                       appearance/theme
                       file/project
                       file/saveplace
                       lang/css
                       lang/dotnet
                       lang/elisp
                       lang/elixir
                       lang/extra
                       lang/html
                       lang/js
                       lang/lisp
                       lang/ruby
                       syntax/autopair
                       syntax/check
                       syntax/comment
                       syntax/snippet))

(defun packages/add (package)
  "Add a PACKAGE to be installed later."
  (unless (member package packages/-list)
    (setq packages/-list (push package packages/-list))))

(defun inits/-bootstrap ()
  "Load inits, install required packages, then kick off init hook."
  (inits/-load)
  (packages/-install)
  (run-hooks 'inits/hook))

(defun inits/-load ()
  "Load all inits defined in inits list."
  (mapcar 'inits/-load-init inits/-list))

(defun inits/-load-init (init)
  "Load INIT if it has not been loaded already."
  (load (concat user-emacs-directory "init/" (symbol-name init))))

(defun packages/-install ()
  "Install all packages defined in packages list."
  (mapcar 'packages/-install-package packages/-list))

(defun packages/-install-package (package)
  "Require a PACKAGE.  Install the package if it is not installed already."
  (unless (require package nil t)
    (package-install package)
    (require package)))

(add-hook 'after-init-hook 'inits/-bootstrap)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;;; init.el ends here
