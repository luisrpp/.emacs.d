;;; package --- Base configuration
;;; Commentary:
;;; Emacs base configuration file

;;; Code:

;; Personal information
(setq user-full-name "Luis Roberto Pereira de Paula"
      user-mail-address "luisrpp@gmail.com")

(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(defconst private-dir (expand-file-name "private" user-emacs-directory))
(defconst temp-dir (format "%s/cache" private-dir)
  "Hostname-based elisp temp directories.")

;; Core settings
;; UTF-8 please
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system        'utf-8)   ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Emacs customizations
(setq confirm-kill-emacs                  'y-or-n-p
      confirm-nonexistent-file-or-buffer  t
      save-interprogram-paste-before-kill t
      mouse-yank-at-point                 t
      require-final-newline               t
      visible-bell                        nil
      ring-bell-function                  'ignore
      custom-file                         "~/.emacs.d/.custom.el"
      ;; http://ergoemacs.org/emacs/emacs_stop_cursor_enter_prompt.html
      minibuffer-prompt-properties
      '(read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)

      ;; Disable non selected window highlight
      cursor-in-non-selected-windows      nil
      highlight-nonselected-windows       nil

      ;; PATH
      exec-path                           (append exec-path '("/usr/local/bin/"))
      indent-tabs-mode                    nil
      tab-width                           2
      inhibit-startup-message             t
      fringes-outside-margins             t
      select-enable-clipboard             t
      select-enable-primary               t
      mouse-drag-copy-region              t

      ;; Scroll smoothly
      scroll-step                         1
      scroll-conservatively               10
      scroll-margin                       7
      scroll-conservatively               5)

(defvar use-package-always-ensure         t)

;; Turn off the blinking cursor
(blink-cursor-mode                        -1)

;; Bookmarks
(defvar bookmark-save-flag                t)
(defvar bookmark-default-file             (concat temp-dir "/bookmarks"))

;; Backups enabled, use nil to disable
(setq history-length                      1000
      backup-inhibited                    nil
      make-backup-files                   t
      auto-save-default                   t
      auto-save-list-file-name            (concat temp-dir "/autosave")
      make-backup-files                   t
      create-lockfiles                    nil
      backup-directory-alist              `((".*" . ,(concat temp-dir "/backup/")))
      auto-save-file-name-transforms      `((".*" ,(concat temp-dir "/auto-save-list/") t)))

(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)

;; Disable toolbar & menubar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(toggle-frame-maximized)

;; Allows one to see matching pairs of parentheses and other characters
(show-paren-mode 1)

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Display pictures and other compressed files
(setq auto-image-file-mode t)
(setq auto-compression-mode t)

;; Terminal settings
(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-zsh)
  "Force zsh."
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; Requiring diminish
(unless (package-installed-p 'diminish)
  (package-refresh-contents)
  (package-install 'diminish))
(require 'diminish)

(provide 'base)
;;; base.el ends here
