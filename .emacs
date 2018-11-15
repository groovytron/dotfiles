
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "e2fd81495089dc09d14a88f29dfdff7645f213e2c03650ac2dd275de52a513de" "7f89ec3c988c398b88f7304a75ed225eaac64efa8df3638c815acc563dfd3b55" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (projectile dotenv-mode spacemacs-theme powerline-evil evil emmet-mode flycheck helm php-mode all-the-icons neotree vimrc-mode yaml-mode haskell-mode js2-mode scss-mode json-mode markdown-mode sass-mode scala-mode smex gruvbox-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Powerline
(require 'powerline)
(powerline-default-theme)
;; (powerline-center-evil-theme)
;; (powerline-vim-theme)
;; Icon fonts for NeoTree
(require 'all-the-icons)
;; Show project tree using NerdTree like package
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq-default neo-show-hidden-files t)
;; To make the window resize on open/close file/directory events
(defun neotree-resize-window (&rest _args)
    "Resize neotree window.
https://github.com/jaypei/emacs-neotree/pull/110"
    (interactive)
    (neo-buffer--with-resizable-window
     (let ((fit-window-to-buffer-horizontally t))
       (fit-window-to-buffer))))

(add-hook 'neo-change-root-hook #'neotree-resize-window)
(add-hook 'neo-enter-hook #'neotree-resize-window)
(global-set-key [f8] 'neotree-toggle)
;; Evil Mode
(require 'evil)
(evil-mode 1)
;; Evil Mode Powerline support
(require 'powerline-evil)
;; Projectile (for navigation in projects)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; Emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; Customization
(global-linum-mode t) ;; show line numbers
(global-auto-revert-mode t) ;; reload file when it changed
(xterm-mouse-mode 1) ;; enable the mouse
(global-hl-line-mode +1) ;; Highligth current cursor's line position
(set-face-attribute 'default nil :height 120) ;; Increase the font size
;; Color themes
;; (load-theme 'gruvbox-dark-hard)
(load-theme 'spacemacs-dark)
;; (windmove-default-keybindings) ;; Move to multiple windows using Shift + arrow
