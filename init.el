;; -*- lexical-binding: t -*-

(setq
 jupl-path (file-name-directory load-file-name)
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
(mapc 'load (file-expand-wildcards (concat jupl-path "modules/*.el")))
