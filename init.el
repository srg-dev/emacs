(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; Use straight.el for use-package expressions
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; theme
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(load-theme 'batman t)

;; Install and configure meow
(use-package meow
  :config
  (defun my/meow-setup ()
    (meow-motion-overwrite-define-key
     '("j" . meow-next)
     '("k" . meow-prev))

    (meow-leader-define-key
     '("s" . save-buffer)
     '("b" . switch-to-buffer)
     '("f" . find-file)
     '("w" . other-window))

    (meow-normal-define-key
     '("0" . digit-argument)
     '("1" . digit-argument)
     '("2" . digit-argument)
     '("3" . digit-argument)
     '("4" . digit-argument)
     '("5" . digit-argument)
     '("6" . digit-argument)
     '("7" . digit-argument)
     '("8" . digit-argument)
     '("9" . digit-argument)
     '("-" . negative-argument)
     '("/" . meow-keypad-describe-key)
     '("?" . meow-cheatsheet)
     '("a" . meow-append)
     '("A" . meow-open-below)
     '("b" . meow-back-word)
     '("B" . meow-back-symbol)
     '("c" . meow-change)
     '("d" . meow-delete)
     '("e" . meow-next-word)
     '("E" . meow-next-symbol)
     '("f" . meow-find)
     '("g" . meow-cancel-selection)
     '("h" . meow-left)
     '("H" . meow-left-expand)
     '("i" . meow-insert)
     '("I" . meow-open-above)
     '("j" . meow-next)
     '("J" . meow-next-expand)
     '("k" . meow-prev)
     '("K" . meow-prev-expand)
     '("l" . meow-right)
     '("L" . meow-right-expand)
     '("m" . meow-join)
     '("n" . meow-search)
     '("o" . meow-block)
     '("p" . meow-yank)
     '("q" . meow-quit)
     '("r" . meow-replace)
     '("s" . meow-kill)
     '("t" . meow-till)
     '("u" . meow-undo)
     '("v" . meow-visit)
     '("w" . meow-mark-word)
     '("W" . meow-mark-symbol)
     '("x" . meow-line)
     '("X" . meow-goto-line)
     '("y" . meow-save)
     '("z" . meow-pop-selection)
     '("'" . repeat)
     '(";" . meow-comment)))

  (my/meow-setup)
  (meow-global-mode 1))
