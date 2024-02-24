;;; .emacs --- Initialization file for Emacs  -*- lexical-binding: t; -*-
;;; Commentary:
;;; vertico, which-key, lsp features (eglot, flymake, sideline, company, yasnippet), nerd-icons, themes (zenburn, spacemacs, monokai)
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)


;; Configure automatic backups
(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacsbackups/")) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq-default frame-title-format '("coommacs - [" mode-name "]"))
(setq confirm-kill-emacs #'yes-or-no-p)
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
;; (set-fringe-mode 10)
(column-number-mode)
(global-display-line-numbers-mode t)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(electric-pair-mode t)      ; auto-pair functionality
(pixel-scroll-precision-mode)


(use-package vertico
  :init
  (vertico-mode))

(use-package which-key
  :config
  (which-key-mode))

(use-package zenburn-theme)
  
(use-package spacemacs-theme
  :config
  (load-theme 'spacemacs-dark t))

(use-package monokai-theme)

(use-package subatomic-theme)


;; major modes
(use-package markdown-mode
  :mode
  ("README\\.md\\'" . gfm-mode))


;; nerd-icons
(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-ibuffer
  :hook
  (ibuffer-mode . nerd-icons-ibuffer-mode))


;; LSP
(use-package eglot
  :bind
  ("C-c l" . eglot)
  :config
  (use-package breadcrumb
    :config
    (breadcrumb-mode)))
    
(use-package flymake)

(use-package sideline-flymake
  :config
  (use-package sideline
    :hook (flymake-mode  . sideline-mode)
    :init
    (setq sideline-flymake-display-mode 'line)
    (setq sideline-backends-right '(sideline-flymake))))

(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode))

(use-package company
  :hook
  (prog-mode . company-mode))


(provide '.emacs)
;;; .emacs ends here
