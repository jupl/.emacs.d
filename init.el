;; -*- lexical-binding: t -*-

(setq
 gc-cons-threshold 64000000
 jupl-fixed-pitch (if (eq system-type 'darwin) "Fira Code" "Fira Mono")
 jupl-variable-pitch "Fira Sans"
 package--init-file-ensured t
 package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                    ("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "https://orgmode.org/elpa/"))
 package-enable-at-startup nil
 use-package-always-defer t
 use-package-verbose (eval-and-compile
                       (not (bound-and-true-p byte-compile-current-file))))

(add-hook
 'after-init-hook
 #'(lambda () (setq gc-cons-threshold 800000)))

;; https://github.com/nilcons/emacs-use-package-fast
(mapc
 #'(lambda (add) (add-to-list 'load-path add))
 (eval-when-compile
   (setq use-package-always-ensure t)
   (package-initialize)
   (unless (package-installed-p 'use-package)
     (package-refresh-contents)
     (package-install 'use-package))
   (let ((package-user-dir-real (file-truename package-user-dir)))
     (nreverse (apply
                #'nconc
                (mapcar
                 #'(lambda (path)
                     (if (string-prefix-p package-user-dir-real path)
                         (list path)
                       nil))
                 load-path))))))

;; TODO make byte compile friendly
;; Load modules
(mapc
 #'load-file
 (file-expand-wildcards (concat user-emacs-directory "modules/*.el")))
