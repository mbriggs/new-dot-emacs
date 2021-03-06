(provide 'init-clojure)


(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'clojure-mode-hook 'midje-mode)

(require 'cider)
(require 'clojure-mode)
;; (add-hook 'clojure-mode-hook 'turn-on-smartparens-strict-mode)
(setq cider-show-error-buffer nil)
(setq cider-repl-use-clojure-font-lock t)
(define-key cider-mode-map (kbd "M-1") 'reset-cider-repl)
(define-key cider-mode-map (kbd "M-2") 'my-cider-refresh)
(define-key cider-mode-map (kbd ",ta") 'cider-test-run-tests)
(define-key cider-mode-map (kbd ",tt") 'cider-test-run-test)
(define-key cider-mode-map (kbd ",tr") 'cider-test-rerun-tests)
(define-key cider-mode-map (kbd ",ce") 'cider-visit-error-buffer)
(define-key cider-mode-map (kbd ",cn") 'cider-repl-set-ns)
(define-key cider-mode-map (kbd ",cj") 'cider-jack-in)
(define-key cider-mode-map (kbd ",cJ") 'cider-restart)
(define-key cider-mode-map (kbd ",cr") 'cider-switch-to-relevant-repl-buffer)
(define-key cider-mode-map (kbd ",cc") 'cider-repl-clear-buffer)

(define-key cider-mode-map (kbd "M-?") 'cider-doc)

(eval-after-load "clojure-mode"
  (lambda ()
    (define-clojure-indent
      (while-let 2)
      (defroutes 'defun)
      (GET 2)
      (POST 2)
      (PUT 2)
      (DELETE 2)
      (HEAD 2)
      (ANY 2)
      (context 2))

    (define-clojure-indent
      (go-loop 1))
))


(defun reset-cider-repl ()
  (interactive)
  (cider-interactive-eval "(user/reset)"))

(defun my-cider-refresh ()
  "Refresh loaded code."
  (interactive)
  (cider-tooling-eval
   "(clojure.core/require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh)"
   (cider-interactive-eval-handler (current-buffer))))
