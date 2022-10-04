;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Ricky McDonald"
      user-mail-address "richard_mcdonald@alumni.brown.edu"
      ;; doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 22 :weight 'regular)
      ;; doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 22 :weight 'regular)
      doom-font (font-spec :family "Iosevka Nerd Font Mono" :size 20 :weight 'regular)
      ;; doom-font (font-spec :family "FantasqueSansMono Nerd Font" :size 20 :weight 'regular)
      ;; doom-font (font-spec :family "scientifica" :size 22 :weight 'regular)
      ;; doom-font (font-spec :family "Comic Mono" :size 20 :weight 'regular)
      doom-theme 'doom-one
      org-directory "~/org/"
      display-line-numbers-type t
      confirm-kill-emacs nil
      evil-escape-key-sequence "kj"
      evil-kill-on-visual-paste nil
      lsp-enable-symbol-highlighting t
      lsp-ui-doc-enable t
      ;; lsp-ui-doc-show-with-cursor t
      lsp-ui-doc-show-with-mouse t
      lsp-lens-enable t
      lsp-headerline-breadcrumb-enable t
      lsp-ui-sideline-enable t
      lsp-ui-sideline-show-diagnostics t
      lsp-ui-sideline-show-code-actions t
      lsp-ui-sideline-enable t
      lsp-ui-sideline-show-hover t
      lsp-modeline-code-actions-enable t
      ;; lsp-diagnostics-provider :flycheck
      lsp-ui-sideline-enable t
      lsp-eldoc-enable-hover t
      lsp-modeline-diagnostics-enable t
      lsp-signature-auto-activate t
      lsp-signature-render-documentation t
      lsp-completion-show-detail t
      lsp-completion-show-kind t
      projectile-project-search-path '("~/random/" "~/wise/" "~/.config/" "~/chat/"))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(alpha . 95))

;; in org mode, auto crop lines to 80 char width
(add-hook 'org-mode-hook #'(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; treat '_' and '-' as part of word for all modes
(add-hook! 'after-change-major-mode-hook
        (modify-syntax-entry ?_ "w")
        (modify-syntax-entry ?- "w"))

;; Always show 80 char column
(global-display-fill-column-indicator-mode 1)

;; ========== SCROLLING IN TTY MODE ==========
(unless window-system
        (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
        (global-set-key (kbd "<mouse-5>") 'scroll-up-line))
;; ========== SCROLLING IN TTY MODE ==========

;; ========== TTY MODE WITH KITTY ==========
;; get rid of the discontinuous vertical separators in Emacs
;; (set-display-table-slot standard-display-table 'vertical-border (make-glyph-code ?│))
;; clean up the end of the modeline
;; (setq mode-line-end-spaces nil)
;; ========== TTY MODE WITH KITTY ==========

;; Don't create new workspace when creating new emacsclient
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))

;; Debugging
(after! dap-mode
  (setq dap-python-debugger 'debugpy))

;; (add-hook 'after-make-frame-functions
;;         (lambda (frame)
;;                 (doom/set-frame-opacity 95)))

;; Don't format on save for markdown
(setq +format-on-save-enabled-modes
      '(not gfm-mode))

;; Keybindings
(map! :g "S-<down>" #'+workspace/switch-to)
;; Org mode overrides global key bindings
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "S-<down>") #'+workspace/switch-to))

;; Jsonnet
(use-package! jsonnet-mode
  :defer t)
