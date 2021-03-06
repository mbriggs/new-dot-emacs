(provide 'init-erc)

(eval-after-load "erc"
  '(progn
     (require 'erc-terminal-notifier)))

(defun ido-erc-buffer()
  (interactive)
  (switch-to-buffer
   (ido-completing-read "Channel:"
                        (save-excursion
                          (delq nil
                                (mapcar
                                 (lambda (buf)
                                   (when (buffer-live-p buf)
                                     (with-current-buffer buf
                                       (and (eq major-mode 'erc-mode)
                                            (buffer-name buf)))))
                                 (buffer-list)))))))

  (global-set-key (kbd "C-c e") 'rgr/ido-erc-buffer)


(defun start-erc ()
  (interactive)

  (setq erc-autojoin-channels-alist '(("freenode.net"
                                       "#clojure"
                                       "#ruby-talk"
                                       "#emacs")))

  (setq erc-track-position-in-mode-line t)
  (setq erc-track-shorten-start 4)
  (setq erc-track-exclude '("irc.freenode.net"))

  (setq erc-modules '(autoaway autojoin button completion fill irccontrols
                               list match menu move-to-prompt netsplit networks
                               noncommands readonly ring stamp spelling track))

  (setq erc-nick "mbriggs")
  (setq erc-prompt ">")
  (setq erc-user-full-name "Matt Briggs")

  ;; auto identify
  (require 'erc-services)
  (erc-services-mode 1)
  (erc))
