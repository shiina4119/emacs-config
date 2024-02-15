;;; .emacs --- Initialization file for Emacs
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

(setq package-list '(markdown-mode lsp-mode lsp-ui lsp-treemacs lsp-ivy flycheck company vertico vterm magit zenburn-theme))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("melpa" . "https://melpa.org/packages/")))
			 
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(vertico-mode t) ;; Enable completion by narrowing
(add-hook 'rust-mode-hook #'lsp) ;; LSP and `rust-mode'
(global-set-key (kbd "C-c g") #'magit-status) ;; Bind the `magit-status' command to a convenient key

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
(setq-default frame-title-format '("%f [" mode-name "]"))
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode t)
(load-theme 'zenburn t)

(provide '.emacs)
;;; .emacs ends here
