(setq visible-bell 1)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize) 
(setq load-path (cons "/home/apallatto/lib/emacs/" load-path))
(add-to-list 'load-path "/home/apallatto/lib/emacs/imported/")
(require 'tramp)
;;(require 'notify)

(yas-global-mode t)

(add-to-list 'load-path "/home/apallatto/lib/emacs/local/")
(require 'org_prefs)
;; (require 'perl_prefs)
(require 'coding_prefs)
(require 'go_prefs)
(require 'javascript_prefs)
(require 'ruby_prefs)
(require 'whitespace)

;; Setup Chrome Links
(setq gnus-button-url 'browse-url-generic
      browse-url-generic-program "chromium"
      browse-url-browser-function gnus-button-url)

;;(require 'template-simple)
;; (load "pde-load")
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(erc-modules
   '(autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands notify page readonly ring smiley stamp track))
 '(erc-nick "actualeyes")
 '(erc-port 6667)
 '(erc-server "localhost")
 '(markdown-command "lowdown")
 '(org-agenda-files
   '("/home/apallatto/Documents/Org/home.org" "/home/apallatto/Documents/Org/work.org"))
 '(package-selected-packages
   '(rvm company-inf-ruby ac-inf-ruby ruby-test-mode flymake-ruby enh-ruby-mode auto-complete robe helm-robe rubocopfmt rubocop markdown-preview-mode markdown-preview-eww markdown-mode impatient-mode tree-sitter-langs tree-sitter company-restclient restclient-helm restclient prettier prettier-js xref-js2 web-mode unicode-fonts tide tern lsp-ui lsp-ivy js2-refactor helm-lsp gotest go-mode dap-mode company))
 '(tool-bar-mode nil))




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "bitstream" :family "Bitstream Vera Sans Mono")))))

(put 'scroll-left 'disabled nil)



(setq-default whitespace-style '(face trailing tabs lines-tail newline))
(setq-default whitespace-line-column 80)
(global-whitespace-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
