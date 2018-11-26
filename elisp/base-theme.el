;;; package --- Theme
;;; Commentary:
;;; Theme configuration

;;; Code:

(use-package all-the-icons)

(use-package doom-themes
  :defer t
  :init
  ;; (load-theme 'doom-one t)
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)

  ;; Corrects (and improves) org-mode's native fontification
  (doom-themes-org-config))

(use-package spacemacs-theme
  :defer t
  :init
  (load-theme 'spacemacs-dark t)
  :config
  (doom-themes-neotree-config)
  (doom-themes-org-config))

(use-package spaceline
  :config
  (require 'spaceline-config)
    (defvar spaceline-buffer-encoding-abbrev-p nil)
    (defvar spaceline-line-column-p nil)
    (defvar spaceline-line-p nil)
    (setq powerline-default-separator (quote arrow))
    (spaceline-spacemacs-theme)
    (spaceline-helm-mode))

; (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

(provide 'base-theme)
;;; base-theme.el ends here
