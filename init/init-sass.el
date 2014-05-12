(provide 'init-sass)

(quelpa 'sass-mode)
(quelpa 'scss-mode)

(add-to-list 'auto-mode-alist '("\\.sass.erb$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.scss.erb$" . scss-mode))

(setq css-indent-offset 2)
