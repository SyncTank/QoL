;; --- 3. Package Configurations ---

;; Magit: The best Git interface
(use-package magit
  :bind ("C-x g" . magit-status))

;; Company: Autocompletion
(use-package company
  :init (global-company-mode)
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

;; Rainbow Delimiters: Color-coded brackets
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Org-mode: Built-in, so we just configure it
(use-package org
  :ensure nil; Don't try to download it, it's built-in
  :config
  (setq org-log-done 'time))

;; tree-sitter : better parsing
(use-package treesit-auto
  :config
  (treesit-auto-add-to-auto-mode-alist 'all))
