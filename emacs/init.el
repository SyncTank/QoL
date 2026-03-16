;; keep init clean
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; init.el - synctank.theme.el - plugins.el - custom.el

;; 1. Setup Package Repositories
(require 'package)
(setq package-archives
      '(("melpa"    . "https://melpa.org/packages/")
        ("gnu"      . "https://elpa.gnu.org/packages/")
        ("nongnu"   . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

;; Setup packages
(require 'use-package)
(setq use-package-always-ensure t)

;; Load the plugin configuration file
(load (expand-file-name "plugins.el" user-emacs-directory))

;; 3. Load Synctank Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'synctank t)

;; 2. UI Cleanup
(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(setq-default cursor-type 'box)
