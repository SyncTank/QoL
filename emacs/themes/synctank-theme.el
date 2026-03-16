;;; synctank-theme.el --- Custom emacs 30.2.

;; Copyright (C) 2026-2027 Rudy a.k.a SyncTank

;; Author: Rudy <synctanked@gmail.com>
;; URL: http://github.com/SyncTank/synctank-theme
;; Version: 0.1

;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.
;;

;; install Rainbow-mode
;; Colors with +x are lighter. Colors with -x are darker.
(deftheme synctank
  "Custom emacs theme by SyncTank.")

(let ((st-fg      "#e4e4ef") ; Main text
      (st-bg      "#181818") ; Main background (Charcoal-black)
      (st-bg+1    "#282828") ; Highlighted lines/UI
      (st-bg+4    "#52494e") ; Comments/Muted text (Dark Gray-pink)
      (st-yellow  "#ffdd33") ; Keywords (Bright Yellow)
      (st-green   "#73c936") ; Strings (Grassy Green)
      (st-niagara "#96a6c8") ; Functions
      (st-red     "#f43841") ; Errors
      (st-quartz  "#95a99f") ; Constants/Types
      (st-wisteria "#9e95c7")) ; Numbers
      
  (custom-theme-set-variables
   'synctank
   '(frame-background-mode (quote dark)))

  (custom-theme-set-faces
   'synctank
   ;; --- The "Big Three" (Background, Text, Cursor) ---
   `(default ((t (:foreground ,st-fg :background ,st-bg))))
   `(cursor  ((t (:background ,st-yellow))))
   `(region  ((t (:background ,st-bg+1 :foreground nil))))

   ;; --- Syntax Highlighting (Font Lock) ---
   `(font-lock-builtin-face           ((t (:foreground ,st-yellow))))
   `(font-lock-comment-face           ((t (:foreground ,st-bg+4 :slant italic))))
   `(font-lock-constant-face          ((t (:foreground ,st-quartz))))
   `(font-lock-function-name-face     ((t (:foreground ,st-niagara :bold t))))
   `(font-lock-keyword-face           ((t (:foreground ,st-yellow :bold t))))
   `(font-lock-string-face            ((t (:foreground ,st-green))))
   `(font-lock-type-face              ((t (:foreground ,st-quartz))))
   `(font-lock-variable-name-face     ((t (:foreground ,st-fg))))
   `(font-lock-warning-face           ((t (:foreground ,st-red :bold t))))

   ;; --- UI Elements ---
   `(line-number              ((t (:foreground ,st-bg+4 :background ,st-bg))))
   `(line-number-current-line ((t (:foreground ,st-yellow :background ,st-bg+1))))
   `(mode-line                ((t (:background ,st-bg+1 :foreground ,st-fg :box nil))))
   `(mode-line-inactive       ((t (:background ,st-bg :foreground ,st-bg+4 :box nil))))
   `(minibuffer-prompt        ((t (:foreground ,st-niagara :bold t))))

  ;; Plugins
  ;; Magit
   `(magit-diff-added           ((t (:foreground ,st-green :background "#2e3b26"))))
   `(magit-diff-removed         ((t (:foreground ,st-red   :background "#3b2626"))))
   `(magit-hash                 ((t (:foreground ,st-bg+4))))
   `(magit-section-highlight    ((t (:background ,st-bg+1))))
   `(magit-branch-local         ((t (:foreground ,st-niagara))))

;; Company
   `(company-tooltip            ((t (:background ,st-bg+1 :foreground ,st-fg))))
   `(company-tooltip-selection  ((t (:background ,st-niagara :foreground ,st-bg))))
   `(company-tooltip-common     ((t (:foreground ,st-yellow :bold t))))
   `(company-scrollbar-bg       ((t (:background ,st-bg))))
   `(company-scrollbar-fg       ((t (:background ,st-bg+4))))

;; Org-mode
   `(org-level-1 ((t (:foreground ,st-yellow :bold t :height 1.2))))
   `(org-level-2 ((t (:foreground ,st-niagara :bold t :height 1.1))))
   `(org-level-3 ((t (:foreground ,st-quartz :bold t))))
   `(org-todo    ((t (:foreground ,st-red :bold t))))
   `(org-done    ((t (:foreground ,st-green :bold t))))
   `(org-link    ((t (:foreground ,st-niagara :underline t))))

;; Rainbow Delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,st-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,st-yellow))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,st-niagara))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,st-green))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,st-wisteria))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,st-quartz))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,st-red))))
   `(rainbow-delimiters-mismatched-face ((t (:background ,st-red :foreground ,st-bg :bold t))))
  ) ;; closes custom-theme-set-faces
) ;; closes the let block

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'synctank)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:
