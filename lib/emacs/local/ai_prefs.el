;;; ai_prefs.el --- AI coding preferences

;; Always use Claude Code; don't prompt for which agent.
(setq agent-shell-preferred-agent-config 'claude-code)

;; Load these on first use, not at startup, so startup stays fast.
(autoload 'agent-shell-send-dwim   "agent-shell" nil t)
(autoload 'agent-shell-send-region "agent-shell" nil t)
(autoload 'agent-shell-send-file   "agent-shell" nil t)

;; C-c i = "intelligence" prefix
(global-set-key (kbd "C-c i i") #'agent-shell)                ; open/start Claude
(global-set-key (kbd "C-c i t") #'agent-shell-toggle)         ; show/hide the Claude window
(global-set-key (kbd "C-c i n") #'agent-shell-new-shell)      ; start a second session
(global-set-key (kbd "C-c i s") #'agent-shell-send-dwim)      ; send region or current context
(global-set-key (kbd "C-c i r") #'agent-shell-send-region)    ; send selected code
(global-set-key (kbd "C-c i f") #'agent-shell-send-file)      ; send current file
(global-set-key (kbd "C-c i p") #'agent-shell-prompt-compose) ; write a longer prompt in a buffer

;;; Targeted rewrites -- two approaches side by side for comparison.

;; Option A: rewrite via agent-shell (Claude subscription, sees whole project).
;; Select code, or leave point inside a function, then C-c i w.
(defun ai-rewrite (instruction)
  "Ask Claude to rewrite the region (or the function at point) per INSTRUCTION."
  (interactive "sRewrite how? ")
  (require 'agent-shell)
  (unless (use-region-p) (mark-defun))
  (let ((context (agent-shell--get-region-context :deactivate t)))
    (agent-shell-insert
     :text (concat context "\n\nRewrite ONLY the code above: " instruction
                   "\nDo not change anything outside this region.")
     :submit t)))
(global-set-key (kbd "C-c i w") #'ai-rewrite)

;; Option B: inline rewrite via gptel (Anthropic API key, sees only the region).
;; Select code, C-c i e, type instruction; accept/reject/diff the overlay.
;; API key is read from ~/.authinfo(.gpg):
;;   machine api.anthropic.com login apikey password sk-ant-...
(with-eval-after-load 'gptel
  (setq gptel-backend (gptel-make-anthropic "Claude"
                        :stream t
                        :key (lambda () (auth-source-pick-first-password
                                         :host "api.anthropic.com"))
                        :models '(claude-sonnet-5-5 claude-opus-5-5 claude-haiku-5-5))
        gptel-model 'claude-sonnet-5-5))
(global-set-key (kbd "C-c i e") #'gptel-rewrite)  ; inline edit of region
(global-set-key (kbd "C-c i g") #'gptel)          ; quick chat buffer

(provide 'ai_prefs)
;;; ai_prefs.el ends here
