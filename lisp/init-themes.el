;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package all-the-icons)

(use-package doom-themes
  :defer t
  :init
  (load-theme 'doom-one t)
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

(provide 'init-themes)
