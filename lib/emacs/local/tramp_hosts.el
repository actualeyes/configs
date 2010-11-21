;;; tramp_hosts.el --- 

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author:  <apallatto@apallatto.cheetahmail.com>
;; Maintainer:  <apallatto@apallatto.cheetahmail.com>
;; Created: 21 Oct 2010
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
;;   (require 'tramp_hosts)

;;; Code:

(eval-when-compile
  (require 'cl))

(setq tramp-default-method "ssh") 
(add-to-list 'tramp-default-proxies-alist
             `( "\\(p-exp[et][12]\\|p-ttb\\|p-tt12\\)" nil "/ssh2:apallatto@devt1:"))


(provide 'tramp_hosts)
;;; tramp_hosts.el ends here
