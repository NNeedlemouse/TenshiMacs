(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))
;;idk
(defun display-startup-echo-area-message ()
  (message ""))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(add-hook 'after-init-hook 'global-company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(gdscript-mode doom-modeline python-mode vterm yasnippet-snippets yasnippet lua-mode lsp-mode battle-haxe company which-key page-break-lines all-the-icons-completion projectile dashboard all-the-icons neotree general use-package evil-visual-mark-mode doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
