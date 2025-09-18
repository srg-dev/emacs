;;; init.el --- Main Emacs Configuration -*- lexical-binding: t; -*-

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

; Configure use-package to use straight.el by default
(use-package straight
  :custom
  (straight-use-package-by-default t))

;; Basic Emacs settings
(setq inhibit-startup-message t
      visible-bell t
      ring-bell-function 'ignore
      make-backup-files nil
      auto-save-default nil)

;; Font configuration
(set-face-attribute 'default nil
                    :family "Noto Sans Mono"
                    :height 160) ; 16pt (height is in 1/10pt units)

;; UI improvements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)

;; Essential packages
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize))

(use-package which-key
  :config
  (which-key-mode))

(use-package ivy
  :config
  (ivy-mode 1)
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t))

(use-package counsel
  :config
  (counsel-mode 1))

(use-package swiper
  :bind (("C-s" . swiper)))

(use-package company
  :config
  (global-company-mode 1))

(use-package magit
  :bind (("C-x g" . magit-status)))

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
