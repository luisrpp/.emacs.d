;;; init-packages.el --- Packages setup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(eval-and-compile
  (straight-use-package 'use-package)
  (defvar use-package-always-ensure)
  (defvar use-package-verbose)
  (setq use-package-always-ensure nil
        use-package-verbose t
        straight-use-package-by-default t))
(require 'use-package)

(provide 'init-packages)
