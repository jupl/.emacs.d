;;; dotnet.el --- .NET config
;;;
;;; Commentary:
;;; Configure .NET related packages. OmniSharp server is required. The
;;; repository should be placed in ~/.omnisharp.
;;;
;;; Code:

(packages/add 'csharp-mode)
(packages/add 'diminish)
(packages/add 'omnisharp)

(defvar company-backends)

(defun dotnet/-mode ()
  "Add additional configuration to OmniSharp mode."
  (omnisharp-mode t)
  (run-with-idle-timer 1 nil 'flycheck-mode))

(defun dotnet/-diminish ()
  "Hide .NET related packages in modeline."
  (diminish 'abbrev-mode)
  (with-eval-after-load 'omnisharp (diminish 'omnisharp-mode)))

(defun dotnet/-init ()
  "Set up Omnisharp."
  (setq-default omnisharp-auto-complete-want-documentation nil)
  (setq-default omnisharp-server-executable-path
                (expand-file-name
                  "~/.omnisharp/server/OmniSharp/bin/Debug/OmniSharp.exe"))
  (add-hook 'csharp-mode-hook 'dotnet/-mode))

(defun dotnet/-init-company ()
  "Add .NET specific packages to company mode."
  (with-eval-after-load 'omnisharp
    (add-to-list 'company-backends 'company-omnisharp)))

(with-eval-after-load 'company (dotnet/-init-company))
(with-eval-after-load 'diminish (dotnet/-diminish))
(with-eval-after-load 'omnisharp (dotnet/-init))

;;; dotnet.el ends here
