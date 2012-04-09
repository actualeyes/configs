(setq visible-bell 1)
(setq load-path (cons "/home/apallatto/lib/emacs/" load-path))
(add-to-list 'load-path "/home/apallatto/lib/emacs/imported/")
(require 'tramp)

;(setq ac-dictionary-directories "/home/apallatto/lib/emacs/imported/auto-complete/dict")
;(require 'auto-complete-config)
;(ac-config-default)

(add-to-list 'load-path "/home/apallatto/lib/emacs/local/")
(require 'org_prefs)
(require 'perl_prefs)
(require 'automation)
                                        ;(require 'tramp_prefs)



(add-to-list 'load-path "/home/apallatto/.emacs.d/pde/")
;(add-to-list 'load-path "/home/apallatto/lib/emacs/imported/emacs-jabber-0.8.0/")

;(require 'jabber)
(require 'template-simple)

(load "pde-load")

(ido-mode 1)

;; Global Key Definitions
(global-set-key "\C-l" 'goto-line) ; [Ctrl]-[L] 

;; Global Preferences 
(setq auto-save-default nil)
(setq inhibit-splash-screen t)
(setq-default indent-tabs-mode nil)
;; Set line width to 78 columns
(setq fill-column 78)
(setq auto-fill-mode t)
;; default font size




(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(erc-nick "actualeyes")
 '(erc-port 6667)
 '(erc-server "irc.perl.org")
 '(org-agenda-files (quote ("~/Documents/Org/home.org" "~/Documents/Org/work.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(put 'scroll-left 'disabled nil)
