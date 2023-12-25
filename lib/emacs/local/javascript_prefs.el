;;; javascript_prefs.el --- Javascript Preferences

;; Copyright (C) 2017 Free Software Foundation, Inc.
;;
;; Author:  <apallatto@actualeyes>
;; Maintainer:  <apallatto@actualeyes>
;; Created: 03 Jul 2017
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
;;   (require 'javascript_prefs)

;;; Code:s

(eval-when-compile
  (require 'cl))

;; (require 'js2-mode)
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


;; Loading tree-sitter package
(require 'tree-sitter-langs)
(require 'tree-sitter)

;; Activate tree-sitter globally (minor mode registered on every buffer)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
(require 'lsp-mode)
(add-hook 'js-mode-hook #'lsp)
(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'js-mode-hook (lambda () (electric-indent-mode -1)))
(lsp-treemacs-sync-mode 1)
(define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)


;; Typescript
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   ;; `M-x package-install [ret] company`
;;   (company-mode +1))

;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)
;; formats the buffer before saving
;; (add-hook 'before-save-hook 'prettier-js-mode)

(add-hook 'typescript-mode-hook 'lsp-deferred)
(add-hook 'typescript-mode-hook (lambda () (electric-indent-mode -1)))

;; (setq tide-format-options '(
;;     :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
;;     :placeOpenBraceOnNewLineForFunctions nil
;;     :indentSize 2
;;     :tabSize 2
;;     ))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode ))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode ))
(add-hook 'web-mode-hook
          (lambda ()
            (when
                (or
                 (string-equal "ts" (file-name-extension buffer-file-name)
                               (string-equal "tsx" (file-name-extension buffer-file-name))
                               )
                 )
              (setup-tide-mode)
              )))

(provide 'javascript_prefs)
;;; javascript_prefs.el ends here
