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
(use-package evil :ensure t )
(use-package auto-complete :ensure t)
(use-package evil-mc :ensure t)
(use-package evil-numbers :ensure t)
(use-package parinfer :ensure t)
(use-package evil-surround :ensure t)
(use-package magit :ensure t)
(use-package fixme-mode :ensure t)
(use-package darktooth-theme :ensure t)
(use-package color-theme :ensure t)
(use-package color-theme-solarized :ensure t)
(use-package solarized-theme :ensure t)
(use-package powerline :ensure t)
(use-package airline-themes :ensure t)
(use-package dashboard :ensure t)


;;Default settings----------------------------------------------

;;Garbage Collection allow mor than 20MB
(setq gc-cons-threshold 20000000)

;;No backup files
(setq make-backup-files nil)

;; Auto-Save in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;Always follow symlinks
(setq vc-follow-symlinks t)

;;Sentences have one space after a period

(setq sentence-end-double-space nil)

;; Confirm before closing Emacs

(setq confirm-kill-emacs 'y-or-n-p)

;; Ask y/n instead of yes/no

(fset 'yes-or-no-p 'y-or-n-p)

;;Autorevert files on change

(global-auto-revert-mode t)

;;Shortcut for changing font size
(define-key global-map (kbd "C-1") 'text-scale-increase)
(define-key global-map (kbd "C-0") 'text-scale-decrease)

;;Disable startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; no guit tooolbar

(tool-bar-mode 0)

;;Automatic line Breaks

(add-hook 'text-mode-hook 'auto-fill-mode)

;;Enable Narrow to region
(put 'narrow-to-region 'disabled nil)

;; We dont need scrollbars

(scroll-bar-mode -1)

;;Remeber cursor position when reopening files

(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)


;; no bell
(setq visible-bell t)

;;auto completion
(ac-config-default)
;;-----------------------------------------------

;;themening--------------------------------------
;;(require 'color-theme-solarized)
;;(setq solarized-termcolors 256)
;;(set-frame-parameter nil 'background-mode 'dark)
;;(setq solarized-broken-srgb t)
;;(load-theme 'solarized t)
(load-theme 'solarized-dark t)
;;default font
;;(when (member "hack" (font-family-list))
;;  (set-face-attribute 'default nil :font "hack"))
;;powerline
(require 'airline-themes)

(load-theme 'airline-solarized-gui t)

;;dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
;;-----------------------------------------------

;;evil mode
(require 'evil)
(evil-mode t)
;; Enable "M-x" in eveil mode
(global-set-key (kbd "M-x")'execute-extended-command)

;; programming -------------------------------

;;Tabs
(setq-default tab-width 2)

;;two spaces instead of tabs
(setq-default tab-width 2 indent-tabs-mode nil)

;;indentation cannot insert tabs

(setq-default indent-tabs-mode nil)

;;two spaces for programming languages
(setq python-indent 2)
(setq js-indent-level 2)

;; highlight fixme todo and bug statement
(fixme-mode t)

;; auto indent with return key

(define-key global-map (kbd "RET") 'newline-and-indent)
;;show matching paren

(show-paren-mode t)

;;No trailing white spaces except in makrdowns
(add-hook 'before-save-hook '(lambda()
                              (when (not (derived-mode-p 'markdown-mode))
                                (delete-trailing-whitespace))))

;;Lisp we use the parinfer-mode
(setq parinfer-extensions '(company pretty-parens evil))
(eval-after-load "parinfer"
  '(progn
     (define-key parinfer-mode-map (kbd "C-,") 'parinfer-toggle-mode)
     (define-key parinfer-region-mode-map (kbd ">") 'parinfer-shift-right)
     (define-key parinfer-region-mode-map (kbd "<") 'parinfer-shift-left)))

;; magit for git
(global-set-key (kbd "C-x g") 'magit-status)

;;Orgmode
(require 'org)
;;Plain lists
(setq org-list-allow-alphabetical t)
(setq org-agenda-files '("~/Dokumente/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (solarized-theme use-package parinfer magit fixme-mode evil-surround evil-numbers evil-mc dashboard darktooth-theme color-theme-solarized auto-complete airline-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
