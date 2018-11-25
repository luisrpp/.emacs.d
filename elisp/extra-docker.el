;;; package --- Docker
;;; Commentary:
;;; Docker configuration

;;; Code:

(use-package docker
  :ensure t
  :defer t
  :diminish)

(use-package dockerfile-mode
  :ensure t
  :defer t)

(provide 'extra-docker)
;;; extra-docker ends here
