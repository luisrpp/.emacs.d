;;; init-ui.el --- UI setup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Neotree
(use-package neotree
  :defer t
  :bind
  ("C-;" . neotree-toggle)
  :config
  ;; needs package all-the-icons
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))

  ;; Disable line-numbers minor mode for neotree
  (add-hook 'neo-after-create-hook
            (lambda (&rest _) (display-line-numbers-mode -1)))

  ;; Every time when the neotree window is opened, let it find current
  ;; file and jump to node.
  (setq neo-smart-open t)

  ;; track ‘projectile-switch-project’ (C-c p p),
  (setq projectile-switch-project-action 'neotree-projectile-action))

(provide 'init-ui)
