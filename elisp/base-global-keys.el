;;; package --- Global keys
;;; Commentary:
;;; Global keys definitions

;;; Code:

;; Keybindings to increase and decrease the font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; C-x C-0 restores the default font size

;; Terminal
(global-set-key (kbd "<s-return>") 'ansi-term)

;; Append & prepend
(global-set-key (kbd "C-o") 'lrpp/append-line)
(global-set-key (kbd "C-S-o") 'lrpp/prepend-line)

(provide 'base-global-keys)
;;; base-global-keys.el ends here
