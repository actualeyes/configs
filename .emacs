(setq visible-bell 1)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


(setq load-path (cons "/home/apallatto/lib/emacs/" load-path))
(add-to-list 'load-path "/home/apallatto/lib/emacs/imported/")
(require 'tramp)
(require 'notify)

(add-to-list 'load-path "/home/apallatto/lib/emacs/local/")
(require 'org_prefs)
(require 'perl_prefs)
(require 'irc_prefs)
(require 'automation)
(require 'tramp_prefs)
;; Setup w3m
(require 'w3m-e21)
(provide 'w3m-e23)
(setq w3m-use-cookies t)
(setq w3m-default-display-inline-images t)
(setq w3m-toggle-inline-images-permanently t)

;; Setup Chrome Links
(setq gnus-button-url 'browse-url-generic
      browse-url-generic-program "chromium"
      browse-url-browser-function gnus-button-url)
(add-to-list 'load-path "/home/apallatto/.emacs.d/pde/")

(require 'template-simple)
(load "pde-load")
(ido-mode 1)
(column-number-mode 1)
(tool-bar-mode -1)
;; Global Key Definitions
(global-set-key "\C-l" 'goto-line) ; [Ctrl]-[L] 
(global-set-key "\C-cw" 'browse-url-at-point) ; Browse Url Shortcut

;; Global Preferences 
(setq auto-save-default nil)
(setq inhibit-splash-screen t)
(setq-default indent-tabs-mode nil)
;; Set line width to 78 columns
(setq fill-column 78)
(setq auto-fill-mode t)
;; default font size

;; haskell-mode
;;(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-modules (quote (autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands notify page readonly ring smiley stamp track)))
 '(erc-nick "actualeyes")
 '(erc-port 6667)
 '(erc-server "localhost")
 '(org-agenda-files (quote ("~/Documents/Org/Pulled.org" "~/Documents/Org/projects.org" "~/Documents/Org/work.org" "~/Documents/Org/home.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(put 'scroll-left 'disabled nil)
