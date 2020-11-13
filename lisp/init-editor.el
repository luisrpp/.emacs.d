;;; init-editor.el --- Text editor common features -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil))

(use-package projectile
  :defer t)

(projectile-mode +1)

(when (executable-find "rg")
  (setq-default projectile-generic-command "rg --files --hidden"))

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'init-editor)
