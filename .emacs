;;; .emacs --- Initialization file for Emacs  -*- lexical-binding: t; -*-
;;; Commentary:

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
(setq package-list '(markdown-mode lsp-mode lsp-ui projectile treemacs lsp-ivy flycheck company vertico vterm magit zenburn-theme all-the-icons))

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
(auto-save-visited-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode t)
(load-theme 'zenburn t)
(vertico-mode t)
(projectile-mode t)

;; magit
(global-set-key (kbd "C-c g") #'magit-status) ;; Bind the `magit-status' command to a convenient key

;; auto load lsp in major modes
(add-hook 'rust-mode-hook #'lsp) ;; LSP and `rust-mode'

;; projectile-mode config
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "C-`") #'projectile-run-vterm)
(global-set-key [f9] 'projectile-compile-project)
(global-set-key [f10] 'projectile-run-project)

;; treemacs config
(global-set-key [f8] 'treemacs)
(treemacs-project-follow-mode t)

(provide '.emacs)
;;; .emacs ends here
