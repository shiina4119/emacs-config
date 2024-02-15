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
(setq package-list '(markdown-mode lsp-mode lsp-ui lsp-treemacs treemacs projectile treemacs-projectile lsp-ivy flycheck company vertico vterm magit zenburn-theme all-the-icons treemacs-all-the-icons))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("melpa" . "https://melpa.org/packages/")))
			 
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; Misc.
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq-default frame-title-format '("%f [" mode-name "]"))
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode t)
(load-theme 'zenburn t)
(setq confirm-kill-emacs #'yes-or-no-p)

(vertico-mode t) ;; Enable completion by narrowing
(add-hook 'rust-mode-hook #'lsp) ;; LSP and `rust-mode'
(global-set-key (kbd "C-c g") #'magit-status) ;; Bind the `magit-status' command to a convenient key
(global-set-key [f8] 'treemacs) ;; Toggle treemacs
(auto-save-visited-mode t)

(projectile-mode t) ;; Projectile
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; (global-set-key (kbd "C-c p c") 'build)
;; (global-set-key (kbd "C-c p u") 'run)

;; Configure automatic backups
(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacsbackups/")) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)


(provide '.emacs)
;;; .emacs ends here
