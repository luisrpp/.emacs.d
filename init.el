;;; init.el -*- lexical-binding: t; -*-
;;
;; Author:  Luis Roberto Pereira de Paula <luisrpp@gmail.com>

(let ((file-name-handler-alist nil))
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

  (defconst *spell-check-support-enabled* t)
  (defconst *is-a-mac* (eq system-type 'darwin))

  ;; Measure startup time
  (require 'init-benchmarking)

  ;; In noninteractive sessions, prioritize non-byte-compiled source files to
  ;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
  ;; to skip the mtime checks on every *.elc file.
  (setq load-prefer-newer noninteractive)

  ;; Bootstrap config
  (require 'init-packages)
  (require 'init-os)

  ;; Allow users to provide an optional "init-preload-local.el"
  (require 'init-preload-local nil t)

  ;; Load configs for specific features and modes
  (use-package diminish)
  (use-package scratch)
  (use-package command-log-mode)

  (require 'init-defaults)
  (require 'init-look-and-fill)
  (require 'init-osx-keys)
  (require 'init-completions)

  (when *spell-check-support-enabled*
    (require 'init-spelling))

  (when *is-a-mac*
    (use-package osx-location))

  ;; Allow access from emacsclient
  (add-hook 'after-init-hook
            (lambda ()
              (require 'server)
              (unless (server-running-p)
                (server-start))))

  ;; Locales (setting them earlier in this file doesn't work in X)
  (require 'init-locales))

(provide 'init)
