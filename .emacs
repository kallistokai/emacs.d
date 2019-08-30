(add-to-list 'load-path "/etc/emacs.d/cl-lib/")
(require 'cl-lib)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/etc/emacs.d/umlaute-mode/")
(require 'html-umlaute-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/etc/emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/etc/emacs.d/web-mode")
(require 'web-mode)

(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\.")
        ("template-toolkit"  . "\\.html\\'"))
)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)

; HTML
(set-face-attribute 'web-mode-doctype-face nil :foreground "Pink3")
(set-face-attribute 'web-mode-html-tag-face nil :foreground "blue" :weight 'bold)
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "white")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "yellow")
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "green")
(set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "white")
(set-face-attribute 'web-mode-html-tag-custom-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-attr-tag-custom-face nil :foreground "Pink3")

; Code
;(set-face-attribute 'web-mode-string-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-comment-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-preprocessor-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-variable-name-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-function-name-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-constant-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-type-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-keyword-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-symbol-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-builtin-face nil :foreground "Pink3")

; Block
;(set-face-attribute 'web-mode-block-control-face nil :foreground "Pink3")
(set-face-attribute 'web-mode-block-delimiter-face nil :foreground "white" :weight 'normal)
;(set-face-attribute 'web-mode-block-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-block-string-face nil :foreground "Pink3")
;(set-face-attribute 'web-mode-block-comment-face nil :foreground "Pink3")






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "~/.emacs.d/tt-mode")
;(require 'tt-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(menu-bar-mode -1)

;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

;; Use indentation of 4 in html-mode
(add-hook 'html-mode-hook
        (lambda ()
            (setq sgml-basic-offset 4)))

;; Use spaces instead of tabs to indent code
(setq-default indent-tabs-mode nil)
;; Width of tabs (display existing tabs)
(setq-default tab-width 4)

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(defun n-cperl-mode-hook ()
  (hs-minor-mode 1)
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 0)
  (setq cperl-extra-newline-before-brace t)
  (setq cperl-extra-newline-after-brace t)
  ;;(set-face-background 'cperl-array-face "wheat")
  ;;(set-face-background 'cperl-hash-face "wheat")
)

(setq cperl-invalid-face (quote off))

(setq linum-format "%d   ")
(global-linum-mode 1)
(set-default 'truncate-lines t)


;;(global-set-key "\M-[1;5C"    'forward-word)      ; Ctrl+right   => forward word
;;(global-set-key "\M-[1;5D"    'backward-word)     ; Ctrl+left    => backward word



(add-to-list 'load-path "~/elisp")
;;(require 'hideshowvis) 
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)



;;(global-set-key (kbd "C-x C-b") 'buffer-menu-other-window)
(global-set-key (kbd "C-x C-b") 'ibuffer)




(require 'ido)
    (ido-mode t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; for smooth scrolling and disabling the automatical recentering of emacs when moving the cursor
(setq
 scroll-step 1
 scroll-margin 10
 scroll-conservatively 0
 scroll-up-aggressively 0.01
 scroll-down-aggressively 0.01
)







;; YAML mode
(add-to-list 'load-path "/etc/emacs.d/yaml-mode")
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
