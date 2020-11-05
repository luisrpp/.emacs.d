;;; init-selectrum.el --- Selectrum setup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package selectrum)
(use-package prescient)
(use-package selectrum-prescient)

(selectrum-mode +1)

;; to make sorting and filtering more intelligent
(selectrum-prescient-mode +1)

;; to save your command history on disk, so the sorting gets more
;; intelligent over time
(prescient-persist-mode +1)

(provide 'init-selectrum)
