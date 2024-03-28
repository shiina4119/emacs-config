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


(add-to-list 'default-frame-alist '(fullscreen . maximized)) 
(setq-default frame-title-format '("deezmacs - [" mode-name "]"))
(setq confirm-kill-emacs #'yes-or-no-p)
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode)
(global-display-line-numbers-mode t)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(electric-pair-mode t)
(pixel-scroll-precision-mode)


(use-package vertico
  :init
  (vertico-mode))

(use-package which-key
  :config
  (which-key-mode))

(use-package zenburn-theme
  :config
  (load-theme 'zenburn))

(use-package spacemacs-theme)

(use-package monokai-theme)

(use-package subatomic-theme)

(use-package catppuccin-theme)
  ;; :init
  ;; (setq catppuccin-flavor 'macchiato)
  ;; :config
  ;; (load-theme 'catppuccin t))


;; major modes
(use-package markdown-mode
  :mode
  ("README\\.md\\'" . gfm-mode))

(use-package rust-mode)

(use-package js2-mode)


;; nerd-icons
(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-ibuffer
  :hook
  (ibuffer-mode . nerd-icons-ibuffer-mode))


;; LSP
(use-package lsp-mode
  :bind
  ("C-c l" . lsp)
  ("C-c f" . lsp-format-buffer)
  ("C-c r" . lsp-format-region)
  :hook
  (rust-mode . lsp)
  (c-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  :config
  (lsp-treemacs-sync-mode 1)
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode
  :hook
  (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs
  :bind
  ([f8] . treemacs)
  :commands lsp-treemacs-errors-list)

(use-package flycheck
  :hook
  (lsp-mode . flycheck-mode))

(use-package company
  :hook
  (prog-mode . company-mode))

(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode))


;; Configure automatic backups
(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacsbackups/")) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)


(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default indent-tabs-mode nil)


(provide '.emacs)
;;; .emacs ends here
