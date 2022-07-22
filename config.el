(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-always-ensure t)

;; Enable Evil
(use-package evil
 :ensure t)
(evil-mode 1)

(use-package doom-themes
:ensure t)
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-tokyo-night t)

(set-face-attribute 'default nil
  :font "Source Code Pro"
  :height 105
  :weight 'medium)
(set-face-attribute 'variable-pitch nil
  :font "Source Code Pro"
  :height 105
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "Source Code Pro"
  :height 105
  :weight 'medium)

(use-package dashboard
:ensure t)
  :init
    (setq dashboard-set-file-icons t)
    (setq dashboard-set-heading-icons t)
    (setq dashboard-banner-logo-title "Welcome to Tenshi Emacs :D")
    (setq dashboard-startup-banner "~/.emacs.d/tenshi.png")  ;; use custom image as banner
    ;;(setq dashboard-center-content nil) ;; set to 't' for centered content
    (setq dashboard-items '((recents . 5)
			    (agenda . 5 )
			    (bookmarks . 3)
			    (projects . 3)
			    (registers . 3)))
    (dashboard-setup-startup-hook)

(use-package which-key
:ensure t)
(which-key-mode)

(use-package neotree
:ensure t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(use-package general
  :config
  (general-evil-setup t))

(nvmap :prefix "SPC"
  "." '(find-file :which-key "find file")
  "h r r" '((lambda () (interactive) (load-file "~/.emacs.d/init.el")) :which-key "Reload emacs config")
  "t o"   '(vterm :which-key "Open vterm")
  ;;neotree
  "t n"   '(neotree-toggle :which-key "Toggle neotree file viewer")
  "d n"   '(neotree-dir :which-key "Open directory in neotree")
  ;;buffer
   "b i"   '(ibuffer :which-key "Ibuffer"))

(use-package haxe-mode
  :mode ("\\.hx\\'" . haxe-mode)
  :no-require t
  :init
  (require 'js)
  (define-derived-mode haxe-mode js-mode "Haxe"
    "Haxe syntax highlighting mode. This is simply using js-mode for now."))

(use-package battle-haxe
  :hook (haxe-mode . battle-haxe-mode)
  :bind (("S-<f4>" . #'pop-global-mark) ;To get back after visiting a definition
	 :map battle-haxe-mode-map
	 ("<f4>" . #'battle-haxe-goto-definition)
	 ("<f12>" . #'battle-haxe-helm-find-references))
  :custom
  (battle-haxe-yasnippet-completion-expansion t "Keep this if you want yasnippet to expand completions when it's available.")
  (battle-haxe-immediate-completion nil "Toggle this if you want to immediately trigger completion when typing '.' and other relevant prefixes."))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	 (c-mode . lsp)
	 (lua-mode . lsp)
	 (c++-mode . lsp)
         (python-mode . lsp)
	 ;; if you want which-key integration
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package all-the-icons
:ensure t 
:if (display-graphic-p))

(use-package projectile
:ensure t)

(use-package doom-modeline
:ensure t
:init (doom-modeline-mode 1))

(use-package vterm
    :ensure t)
(add-to-list 'display-buffer-alist
   '("\*vterm\*"
     (display-buffer-in-side-window)
     (window-height . 0.25)
     (side . bottom)
     (slot . 0)))
