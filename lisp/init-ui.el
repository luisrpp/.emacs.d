;;; init-ui.el --- UI setup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Suppress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen nil)

;; Window size and features
(setq-default
  window-resize-pixelwise t
  frame-resize-pixelwise t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(menu-bar-mode -1)

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

(when (and *is-a-mac* (fboundp 'toggle-frame-fullscreen))
  ;; Command-Option-f to toggle fullscreen mode
  ;; Hint: Customize `ns-use-native-fullscreen'
  (global-set-key (kbd "M-ƒ") 'toggle-frame-fullscreen))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Use `C-M-=` and `C-M--` to increase/decrease font size
(use-package default-text-scale
  :defer t
  :hook
  (after-init . default-text-scale-mode))

;; Scroll smoothly
(setq scroll-step           1
      scroll-conservatively 10
      scroll-margin         7
      scroll-conservatively 5)

;; Change default font
(add-to-list 'default-frame-alist '(font . "Source Code Pro-16"))

(toggle-frame-maximized)

(provide 'init-ui)
