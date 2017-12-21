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
(load-theme 'solarized-dark t)

;;default font
;;(when (member "hack" (font-family-list))
;;  (set-face-attribute 'default nil :font "hack"))
;;powerline
(require 'airline-themes)
(load-theme 'airline-solarized-alternate-gui t)

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
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "2b8dff32b9018d88e24044eb60d8f3829bd6bbeab754e70799b78593af1c3aba" "b181ea0cc32303da7f9227361bb051bbb6c3105bb4f386ca22a06db319b08882" default)))
 '(delete-selection-mode nil)
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (powerline fixme-mode use-package parinfer magit evil-surround evil-numbers evil-mc auto-complete)))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#ff7f00")
     (60 . "#ffbf00")
     (80 . "#b58900")
     (100 . "#ffff00")
     (120 . "#ffff00")
     (140 . "#ffff00")
     (160 . "#ffff00")
     (180 . "#859900")
     (200 . "#aaff55")
     (220 . "#7fff7f")
     (240 . "#55ffaa")
     (260 . "#2affd4")
     (280 . "#2aa198")
     (300 . "#00ffff")
     (320 . "#00ffff")
     (340 . "#00ffff")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
