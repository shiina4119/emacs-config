;;; .emacs --- Initialization file for Emacs  -*- lexical-binding: t; -*-
;;; Commentary:
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

;; Package install
(setq package-list '(markdown-mode lsp-mode lsp-ui lsp-ivy flycheck company vertico zenburn-theme nerd-icons-dired nerd-icons-ibuffer))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("melpa" . "https://melpa.org/packages/")))
			 
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Configure automatic backups
(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacsbackups/")) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;; Misc.
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq-default frame-title-format '("%f [" mode-name "]"))
(setq confirm-kill-emacs #'yes-or-no-p)
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(electric-pair-mode t)
(load-theme 'zenburn t)
(vertico-mode t)

;; auto load lsp in major modes
(add-hook 'rust-mode-hook #'lsp) ;; LSP and `rust-mode'

(provide '.emacs)
;;; .emacs ends here
