;;; package --- Ruby language
;;; Commentary:
;;; Ruby language configuration

;;; Code:

(use-package enh-ruby-mode
  :ensure t
  :mode (("\\.rb\\'"       . enh-ruby-mode)
         ("\\.ru\\'"       . enh-ruby-mode)
         ("\\.gemspec\\'"  . enh-ruby-mode)
         ("\\.rake\\'"     . enh-ruby-mode)
         ("Rakefile\\'"    . enh-ruby-mode)
         ("Gemfile\\'"     . enh-ruby-mode)
         ("Guardfile\\'"   . enh-ruby-mode))
  :config
  (progn
    (setq enh-ruby-indent-level 2
          enh-ruby-add-encoding-comment-on-save nil
          enh-ruby-deep-indent-paren nil
          enh-ruby-bounce-deep-indent t
          enh-ruby-hanging-indent-level 2)
    (setq enh-ruby-program "~/.rvm/rubies/ruby-2.5.3/bin/ruby")
    (setq ruby-insert-encoding-magic-comment nil)))

(use-package ruby-electric
  :ensure t
  :diminish
  :init
  ;; Autoclose paired syntax elements like parens, quotes, etc
  (add-hook 'enh-ruby-mode-hook 'ruby-electric-mode))

(use-package inf-ruby
  :ensure t
  :init
  (autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter))

(use-package robe
  :ensure t
  :init
  (add-hook 'enh-ruby-mode-hook 'robe-mode)
  :config
  (push 'company-robe company-backends))

(use-package rvm
  :ensure t
  :defer t
  :init
  (rvm-use-default)
  (rvm-autodetect-ruby))

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(use-package rspec-mode
  :ensure t
  :defer t
  :diminish
  :init
  (add-hook 'after-init-hook 'inf-ruby-switch-setup)
  :config
  (setq compilation-scroll-output 'first-error
        rspec-use-rake-when-possible nil
        rspec-use-bundler-when-possible t
        rspec-use-rvm-when-possible t))

;; (use-package rinari)

(provide 'lang-ruby)
;;; lang-ruby.el ends here
