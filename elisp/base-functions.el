;;; package --- Functions
;;; Commentary:
;;; Custom functions

;;; Code:

(defun lrpp/prepend-line (&optional arg)
  (interactive "P")
  (move-beginning-of-line arg)
  (open-line 1))

(defun lrpp/append-line (&optional arg)
  (interactive "P")
  (move-end-of-line arg)
  (open-line 1)
  (forward-line 1))

(provide 'base-functions)
;;; base-functions ends here
