;;; init-defaults.el --- Some defaults -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default user-mail-address "luisrpp@gmail.com"
              user-full-name "Luis Roberto Pereira de Paula"
              disabled-command-function nil)

;; Variables configured via the interactive 'customize' interface
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Scroll smoothly
(setq scroll-step           1
      scroll-conservatively 10
      scroll-margin         7
      scroll-conservatively 5)

(setq auto-window-vscroll nil)

;; Don't use tabs to indent and fix some indentation settings
(use-package emacs
  :ensure nil
  :config
  (setq-default tab-always-indent 'complete)
  (setq-default indent-tabs-mode nil
                tab-width 4
                fill-column 70))

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)
(setq save-interprogram-paste-before-kill t)

;; Backups
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      vc-make-backup-files t
      version-control t
      kept-old-versions 0
      kept-new-versions 10
      delete-old-versions t
      backup-by-copying t)

;; Word case switch
(use-package fix-word
  :ensure t
  :config
  (global-set-key (kbd "M-u") #'fix-word-upcase)
  (global-set-key (kbd "M-l") #'fix-word-downcase)
  (global-set-key (kbd "M-c") #'fix-word-capitalize))

(use-package which-key
  :diminish
  :config
  (which-key-mode))

;; Recentf
;; This is a built-in mode that keeps track of the files you have opened allowing you go back to them faster.
(use-package recentf
  :ensure t
  :init
  (setq recentf-max-saved-items 50
        recentf-max-menu-items 15
        recentf-show-file-shortcuts-flag nil
        recentf-auto-cleanup 'never)
  :config
  (recentf-mode t))

;; Extended command
(use-package smex
  :ensure t
  :config
  (smex-initialize))

(provide 'init-defaults)
