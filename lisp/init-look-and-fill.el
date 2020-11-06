;;; init-look-and-fill.el --- Look and fill setup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Suppress GUI features
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(when (display-graphic-p)
  (tooltip-mode -1))

(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t)

;; Helpful builtin modes
(show-paren-mode t)
(global-prettify-symbols-mode t)
(blink-cursor-mode 0)

;; Adding icons
;; Install fonts: M-x all-the-icons-install-fonts
(use-package all-the-icons)

;; Allow only one theme at a time
(setq custom-theme-allow-multiple-selections nil)

;; Themes
(use-package doom-themes
  :defer t
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t

        ;; doom-one specific settings
        doom-one-brighter-modeline nil
        doom-one-brighter-comments nil)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)

  ;; Corrects (and improves) org-mode's native fontification
  (doom-themes-org-config)

  ;; Enable nlinum line highlighting
  ; (doom-themes-nlinum-config)   ; requires nlinum and hl-line-mode
  
  ;; brighter source buffers (that represent files)
  ; (add-hook 'find-file-hook #'doom-buffer-mode-maybe)

  ;; ...if you use auto-revert-mode
  ; (add-hook 'after-revert-hook #'doom-buffer-mode-maybe)
  ;; And you can brighten other buffers (unconditionally) with:
  ; (add-hook 'ediff-prepare-buffer-hook #'doom-buffer-mode)

  ;; brighter minibuffer when active
  ; (add-hook 'minibuffer-setup-hook #'doom-brighten-minibuffer)
  )

;; Default theme
(add-hook 'after-init-hook
  (lambda ()
    (interactive)
    (load-theme 'doom-one t)))

;; Modeline
(use-package doom-modeline
  :ensure t
  :hook
  (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-window-width-limit fill-column
        doom-modeline-project-detection 'project
        doom-modeline-buffer-file-name-style 'auto
        doom-modeline-icon (display-graphic-p)
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t
        doom-modeline-minor-modes nil))

;; Specify font family in modeline
; (custom-set-faces
;   '(mode-line ((t (:family "Noto Sans" :height 0.9))))
;   '(mode-line-inactive ((t (:family "Noto Sans" :height 0.9)))))

;; Change default font
(when (member "Source Code Pro" (font-family-list))
  (set-face-attribute 'default nil :font "Source Code Pro" :height 120)
  (setq default-frame-alist '((font . "Source Code Pro-16"))))

;; Fullscreen mode
(when (and *is-a-mac* (fboundp 'toggle-frame-fullscreen))
  ;; Command-Option-f to toggle fullscreen mode
  ;; Hint: Customize `ns-use-native-fullscreen'
  (global-set-key (kbd "M-ƒ") 'toggle-frame-fullscreen))

;; Maximize at startup
(toggle-frame-maximized)

(provide 'init-look-and-fill)
