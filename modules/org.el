;; -*- lexical-binding: t -*-

(use-package mixed-pitch
  :after (org)
  :config
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-formula))

(use-package org
  :ensure org-plus-contrib
  :general
  (:keymaps 'org-mode-map
   :prefix ","
   :states '(normal visual)
   "x" 'org-export-dispatch)
  :init
  (setq
   org-export-allow-bind-keywords t
   org-export-with-author nil
   org-export-with-section-numbers nil
   org-export-with-toc nil
   org-src-preserve-indentation t
   org-startup-folded 'showall
   org-startup-indented t
   org-startup-with-inline-images nil))

(use-package ox-beamer
  :ensure org-plus-contrib
  :after (org))

(use-package ox-html
  :ensure org-plus-contrib
  :after (org)
  :init
  (setq
   org-html-head-include-scripts nil
   org-html-postamble nil
   org-html-style-include-default nil)
  (when (executable-find "pygmentize")
    (defun org-html-src-block (src-block _contents info)
      (if (org-export-read-attribute :attr_html src-block :textarea)
          (org-html--textarea-block src-block)
        (let ((lang (org-element-property :language src-block))
              (code (org-element-property :value src-block)))
          (with-temp-buffer
            (insert code)
            (shell-command-on-region
             (point-min) (point-max)
             (format "pygmentize -f html -g -l %s" (or lang "text"))
             (buffer-name) t)
            (buffer-string)))))
    (setq org-html-htmlize-output-type nil)))

(use-package ox-latex
  :ensure org-plus-contrib
  :after (org)
  :init
  (let ((prefix "%latex")
        (postfix " -interaction nonstopmode -output-directory %o %f")
        (escape (if (executable-find "pygmentize") " -shell-escape" "")))
    (setq
     org-latex-compiler "xelatex"
     org-latex-pdf-process `(,(concat prefix escape postfix))))
  (when (executable-find "pygmentize")
    (setq-default org-latex-listings 'minted)
    (add-to-list 'org-latex-packages-alist '("" "minted")))
  :config
  (add-to-list 'org-latex-logfiles-extensions "tex")
  (when (executable-find "pygmentize")
    (add-to-list 'org-latex-logfiles-extensions "pyg")))
