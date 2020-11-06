;;; init-os.el --- OS related config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Garbage collection
(let ((normal-gc-cons-threshold (* 2 1000 1000))
      (init-gc-cons-threshold most-positive-fixnum))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))
  
;; Asynchronous bytecode compilation
(use-package async
  :ensure t
  :defer t
  :init
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1)
  :custom (async-bytecomp-allowed-packages '(all)))

;; Set PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setenv "LD_LIBRARY_PATH" (concat (getenv "LD_LIBRARY_PATH") ":/usr/local/lib"))
(setq exec-path (append exec-path '("/usr/local/lib")))

;; Fix old security Emacs problems
(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))

;; Compilation
(use-package emacs
  :ensure nil
  :config
  (setq compilation-always-kill t
        compilation-ask-about-save nil
        compilation-context-lines 10
        compilation-window-height 100
        compilation-scroll-output 'first-error))

;; System monitor
(use-package symon
  :ensure t
  :defer t)

(setq proced-auto-update-flag t
      proced-auto-update-interval 1
      proced-descend t)

(provide 'init-os)
