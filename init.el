;; -*- lexical-binding: t -*-

(setq
 jupl-fixed-pitch (if (eq system-type 'darwin) "Fira Code" "Fira Mono")
 jupl-path (file-name-directory load-file-name)
 jupl-variable-pitch "Fira Sans"
 use-package-always-defer t
 use-package-always-ensure t)

;; Set up core packages
(require 'package)
(setq
 package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                    ("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "https://orgmode.org/elpa/"))
 package-enable-at-startup nil)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Load modules
(mapc 'load-file (file-expand-wildcards (concat jupl-path "modules/*.el")))
