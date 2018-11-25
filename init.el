;;; init.el --- Luis Roberto P. Paula's Emacs init file

;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'base-theme)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)

;; Development
(require 'lang-ruby)
(require 'lang-go)
(require 'lang-clojure)
(require 'lang-sml)
(require 'lang-markdown)
(require 'lang-yaml)

;; Extras
(require 'extra-docker)

(provide 'init)
;;; init.el ends here
