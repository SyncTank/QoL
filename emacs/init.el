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
;;(blink-cursor-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'box)
(global-display-line-numbers-mode)

;; Adding `simpc` to load-path so `require` can find it
(add-to-list 'load-path (expand-file-name "local" user-emacs-directory))
(require 'simpc-mode)
;; Automatically enabling simpc-mode on files with extensions like .h, .c, .cpp, .hpp
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; hide menu-bar till f10 is clicked
(menu-bar-mode -1)
(defun synctank/toggle-menu-bar()
  "Toggle the menu bar visibility."
  (interactive)
  (menu-bar-mode (if menu-bar-mode -1 1)))
(global-set-key (kbd "<f10>") 'synctank/toggle-menu-bar)
(global-set-key (kbd "<f10>") 'menu-bar-open)

;; Load font if exists
(defun synctank/set-font ()
  (let ((font (cond
               ((find-font (font-spec :name "Consolas")) "Consolas")
               ((find-font (font-spec :name "Ubuntu Mono")) "Ubuntu Mono")
               ((find-font (font-spec :name "DejaVu Sans Mono")) "DejaVu Sans Mono")
               (t "monospace"))))
    (set-face-attribute 'default nil :font font :height 120)))

(synctank/set-font)
