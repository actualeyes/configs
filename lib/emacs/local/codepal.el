;; codepal.el -- AI code integration

(eval-when-compile
  (require 'cl))


(define-minor-mode codepal-mode
  "A minor mode to integrate ai code."
  :init-value nil
  :lighter " [CP]"
  ;; :key-map (keymap
  ;;            ("C-c c" . co))
  :global nil ; or t if it's a global minor mode
)


(define-key global-map (kbd "C-c c") 'codepal-mode)

(provide 'codepal)

;;; codepal.el ends here
