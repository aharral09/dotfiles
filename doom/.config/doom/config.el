;; Identifier
(setq user-full-name "Alex Harral"
      user-mail-address "aharral@wistar.org")

;; Theme
(setq doom-theme 'doom-dark+)

;; Fonts
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 15)
      doom-symbol-font (font-spec :family "Symbols Nerd Font Mono" :size 15))

;; Relative Line Numbers
(setq display-line-numbers-type 'relative)

;; Keybinds
(map! :leader
      :desc "Toggle Comment" "-" #'comment-line
      :desc "Toggle Treemacs" "e" #'treemacs
      :desc "Find Buffers" "fb" #'view-buffer
      :desc "Save File" "w" #'evil-save
      )

;; Org Mode
(setq org-directory "~/work/org/")
(use-package org-bullets :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(custom-theme-set-faces!
  'doom-dark+
  '(org-level-8 :inherit outline-3 :height 1.0)
  '(org-level-7 :inherit outline-3 :height 1.0)
  '(org-level-6 :inherit outline-3 :height 1.1)
  '(org-level-5 :inherit outline-3 :height 1.2)
  '(org-level-4 :inherit outline-3 :height 1.3)
  '(org-level-3 :inherit outline-3 :height 1.4)
  '(org-level-2 :inherit outline-3 :height 1.5)
  '(org-level-1 :inherit outline-1 :height 1.6)
  '(org-document-title :height 1.8 :bold t :underline nil))
(setq org-modern-table-vertical 1)
(setq org-modern-table t)
(add-hook 'org-mode-hook #'hl-todo-mode)
(setq org-hide-emphasis-markers t)
