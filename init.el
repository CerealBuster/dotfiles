(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;;here we have the packages

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(defun load-config ()
 "Load the actual config."
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

(load-config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9b1c580339183a8661a84f5864a6c363260c80136bd20ac9f00d7e1d662e936a" default)))
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (paredit use-package slime rainbow-delimiters parinfer org-bullets magit flycheck fixme-mode evil dashboard color-theme-solarized auto-complete ample-theme airline-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
