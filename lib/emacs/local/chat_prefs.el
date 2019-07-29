;;; chat_prefs.el --- Chat Preferences

;; Copyright (C) 2017 Free Software Foundation, Inc.
;;
;; Author:  <apallatto@actualeyes>
;; Maintainer:  <apallatto@actualeyes>
;; Created: 24 Oct 2017
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
;;   (require 'chat_prefs)

;;; Code:

(eval-when-compile
  (require 'cl))

(require 'notifications)
;; Association list, pairing buffer names with notification IDs.

(setq erc-log-channels-directory "~/.erc/logs/")
(setq erc-save-buffer-on-part t)

(defun erc-show-management-screens ()
  (interactive)
    (progn
      (delete-other-windows)
      (switch-to-buffer "&bitlbee")
      (split-window-below)
      (other-window 1)
      (switch-to-buffer "127.0.0.1:6667")
      (other-window 1)
      (split-window-right)
      (switch-to-buffer "irc.freenode.net:6667")
      ))


(defun erc-show-dp-screens ()
  (interactive)
    (progn
      (delete-other-windows)
      (switch-to-buffer "#watercooler")
      (split-window-right)
      (other-window 1)
      (switch-to-buffer "#engineering")
      (split-window-below)
      (other-window 1)
      (switch-to-buffer "#music")
      (other-window 1)
      (split-window-below)
      (other-window 1)
      (switch-to-buffer "#videos")
      ))

(defun erc-show-elc-screens ()
  (interactive)
    (progn
      (delete-other-windows)
      (switch-to-buffer "#15005_elc_dev")
      (split-window-below)
      (other-window 1)
      (switch-to-buffer "#15005_elcv_fm__kilian")
      ))

(defun erc-show-fun-screens ()
  (interactive)
    (progn
      (delete-other-windows)
      (switch-to-buffer "#perl6")
      (split-window-below)
      (other-window 1)
      (switch-to-buffer "#twitter_actualeyes")
      (other-window 1)
      (split-window-right)
      (switch-to-buffer "#emacs")
      ))



(setq erc-notification-id-alist '())

;; Function for use by erc-new-message-notify.

(defun erc-notification-closed (id reason)
  "Callback function, for removing notification entry if user closed notification manually."
  (dolist (entry erc-notification-id-alist)
    (if (equal id (cdr entry))
        (setq erc-notification-id-alist
              (delq
               (assoc (car entry) erc-notification-id-alist)
               erc-notification-id-alist)))))

;; Create notification when ERC message received.

(defun erc-new-message-notify (message)
  "Notify user of new ERC message."
  (let ((this-buffer (buffer-name (current-buffer))))
    (if (not (string-match "^[#&]" this-buffer))
        (if (not (assoc this-buffer erc-notification-id-alist))
            (setq erc-notification-id-alist
                  (cons
                   `(,this-buffer ,@(notifications-notify :timeout 0 :on-close 'erc-notification-closed :title "New message in chat" :body (buffer-name (current-buffer))))
                   erc-notification-id-alist))))))

(add-hook 'erc-insert-pre-hook 'erc-new-message-notify)

;; ;; On ERC buffer modification by user, clear notification message.

(defun erc-close-notification ()
  "Close ERC notification bubbles related to the current chat."
  (let ((this-buffer (buffer-name (current-buffer))))
    (if (assoc this-buffer erc-notification-id-alist)
        (progn
          (notifications-close-notification (cdr (assoc this-buffer erc-notification-id-alist)))
          (setq erc-notification-id-alist
                (delq
                 (assoc this-buffer erc-notification-id-alist)
                 erc-notification-id-alist))))))

(add-hook 'erc-send-post-hook 'erc-close-notification)


(eval-after-load "erc" '
  (progn
    (define-key erc-mode-map (kbd "C-c d") 'erc-show-dp-screens)
    (define-key erc-mode-map (kbd "C-c e") 'erc-show-elc-screens)
    (define-key erc-mode-map (kbd "C-c t") 'erc-show-fun-screens)
    (define-key erc-mode-map (kbd "C-c m") 'erc-show-management-screens)
    )
  )
;; Clears out annoying erc-track-mode stuff for when we don't care.
;; Useful for when ChanServ restarts :P

(defun bitlbee-netrc-identify ()
  "Auto-identify for Bitlbee channels using authinfo or netrc.

    The entries that we look for in netrc or authinfo files have
    their 'port' set to 'bitlbee', their 'login' or 'user' set to
    the current nickname and 'server' set to the current IRC
    server's name.  A sample value that works for authenticating
    as user 'keramida' on server 'localhost' is:

    machine localhost port bitlbee login keramida password supersecret"
  (interactive)
  (when (string= (buffer-name) "&bitlbee")
    (let* ((secret (plist-get (nth 0 (auth-source-search :max 1
                                                         :host erc-server
                                                         :user (erc-current-nick)
                                                         :port "bitlbee"))
                              :secret))
           (password (if (functionp secret)
                         (funcall secret)
                       secret)))
      (erc-message "PRIVMSG" (concat (erc-default-target) " " "identify" " " password) nil))))

;; Enable the netrc authentication function for &biblbee channels.
(add-hook 'erc-join-hook 'bitlbee-netrc-identify)

(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(setq erc-autojoin-channels-alist '(("freenode.net" "#perl6" "#emacs")))
(setq erc-interpret-mirc-color t)

(setq erc-save-buffer-on-part t)

(defun erc-initiate-connections ()
  "Connect to bitlbee and freenode irc servers"
  (interactive)
  (erc :server "127.0.0.1" :port 6667 :nick "bitlbee")
  (erc :server "irc.freenode.net" :port 6667 :nick "Actualeyes")
  )
(provide 'chat_prefs)

;;; chat_prefs.el ends here
