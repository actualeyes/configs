(setq load-path (cons "/home/apallatto/lib/emacs/" load-path))
(require 'template-simple)
(require 'tea-time)
(ido-mode 1)

;; Global Key Definitions
(global-set-key "\C-l" 'goto-line) ; [Ctrl]-[L] 

;; Global Preferences 
(setq auto-save-default nil)
(setq inhibit-splash-screen t)

;;Org Mode

(setq org-modules (quote (org-bbdb org-bibtex org-gnus org-info org-jsinfo org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m)))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-font-lock-mode 1)                     ; for all buffers
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
(setq org-log-done 'note) ;Timestamp and note  on close
(setq org-agenda-files (list "~/lib/emacs/org/work.org"
                             "~/lib/emacs/org/home.org"))
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))


;; Perl stuff
;; M-SPC not available, window manager take it away
(global-set-key (kbd "M-'") 'just-one-space)
(global-set-key (kbd "C-M-=") 'pde-indent-dwim)
;; nearest key to dabbrev-expand
(global-set-key (kbd "M-;") 'hippie-expand)
(global-set-key (kbd "C-;") 'comment-dwim)
(global-set-key (kbd "C-c f") 'comint-dynamic-complete)

(setq hippie-expand-try-functions-list
          '(try-expand-line
            try-expand-dabbrev
            try-expand-line-all-buffers
            try-expand-list
            try-expand-list-all-buffers
            try-expand-dabbrev-visible
            try-expand-dabbrev-all-buffers
            try-expand-dabbrev-from-kill
            try-complete-file-name
            try-complete-file-name-partially
            try-complete-lisp-symbol
            try-complete-lisp-symbol-partially
            try-expand-whole-kill))
(autoload 'comint-dynamic-complete "comint" "Complete for file name" t)
(setq comint-completion-addsuffix '("/" . ""))
(setq-default indent-tabs-mode nil)

(defalias 'perl-mode 'cperl-mode)
(defun pde-perl-mode-hook ()
  (abbrev-mode t)
  (add-to-list 'cperl-style-alist
               '("PDE"
                 (cperl-auto-newline                         . t)
                 (cperl-brace-offset                         . 0)
                 (cperl-close-paren-offset                   . -4)
                 (cperl-continued-brace-offset               . 0)
                 (cperl-continued-statement-offset           . 4)
                 (cperl-extra-newline-before-brace           . nil)
                 (cperl-extra-newline-before-brace-multiline . nil)
                 (cperl-indent-level                         . 4)
                 (cperl-indent-parens-as-block               . t)
                 (cperl-label-offset                         . -4)
                 (cperl-merge-trailing-else                  . t)
                 (cperl-tab-always-indent                    . t)))
  (cperl-set-style "PDE"))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/lib/emacs/org/home.org" "~/lib/emacs/org/work.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
