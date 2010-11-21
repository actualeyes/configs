(setq load-path (cons "/home/apallatto/lib/emacs/" load-path))
(add-to-list 'load-path "/home/apallatto/lib/emacs/imported/")
(require 'bitlbee)
(require 'tramp)
(require 'template-simple)
(require 'tea-time)
(add-to-list 'load-path "/home/apallatto/lib/emacs/local/")
(require 'org_prefs)
(require 'perl_pref)
(require 'tramp_hosts)


(add-to-list 'load-path "/home/apallatto/.emacs.d/pde/")
(load "pde-load")

(ido-mode 1)

;; Global Key Definitions
(global-set-key "\C-l" 'goto-line) ; [Ctrl]-[L] 

;; Global Preferences 
(setq auto-save-default nil)
(setq inhibit-splash-screen t)
(setq-default indent-tabs-mode nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(erc-nick "actualeyes")
 '(erc-port 6667)
 '(erc-server "localhost")
 '(org-agenda-files (quote ("~/lib/emacs/org/home.org" "~/lib/emacs/org/work.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
