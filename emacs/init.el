;; 1. Setup Package Repositories
(require 'package)
(setq package-archives
      '(("melpa"    . "https://melpa.org/packages/")
        ("gnu"      . "https://elpa.gnu.org/packages/")
        ("nongnu"   . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

;; 3. Load Synctank Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'synctank t)

;; 2. UI Cleanup
(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)

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


(custom-set-variables
 '(package-selected-packages '(company magit rainbow-delimiters)))
(custom-set-faces
 )
