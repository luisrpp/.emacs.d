;;; package --- Markdown language
;;; Commentary:
;;; Markdown configuration

;;; Code:

(use-package markdown-mode+
  :init
  (setq markdown-command "multimarkdown"))

(provide 'lang-markdown)
;;; lang-markdown.el ends here
