;;; org_prefs.el --- Org Preferences

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author:  <apallatto@apallatto.cheetahmail.com>
;; Maintainer:  <apallatto@apallatto.cheetahmail.com>
;; Created: 22 Oct 2010
;; Version: 0.01
;; Keywords

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'org_prefs)

;;; Code:

(eval-when-compile
  (require 'cl))
;;(require 'org-ascii)


(setq org-modules (quote
                   (org-bbdb org-bibtex org-gnus org-info
                    org-habit org-irc org-w3m)))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-agenda-custom-commands
      '(("b" occur-tree "habit")))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-font-lock-mode 1)                     ; for all buffers
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
(setq org-log-done 'note) ;Timestamp and note  on close
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Habit Graph
(setq org-habit-graph-column 60)
(setq org-habit-show-habits-only-for-today t)
(setq org-agenda-files
   (quote
    ("~/Documents/Org/home.org"
     "~/Documents/Org/work.org")))


(setq org-todo-keywords
      '((sequence "TODO(t)" "PROGRESS(p@/!)" "RESCHEDULE(r!)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)" "Failed(f@!)")))

;; (setq org-mobile-directory "~/Dropbox/MobileOrg")
;; (setq org-directory "~/Documents/Org/")
;; (setq org-mobile-inbox-for-pull "~/Documents/Org/Pulled.org")


(provide 'org_prefs)
;;; org_prefs.el ends here
