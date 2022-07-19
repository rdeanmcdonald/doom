;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Ricky McDonald"
      user-mail-address "richard_mcdonald@alumni.brown.edu"
      ;; doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 22 :weight 'regular)
      ;; doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 22 :weight 'regular)
      ;; doom-font (font-spec :family "Iosevka Nerd Font Mono" :size 20 :weight 'regular)
      doom-font (font-spec :family "FantasqueSansMono Nerd Font" :size 20 :weight 'regular)
      ;; doom-font (font-spec :family "Comic Mono" :size 20 :weight 'regular)
      doom-theme 'doom-dracula
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
      projectile-project-search-path '("~/random/" "~/wise/" "~/.config/"))

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


;; Keybindings
(map! :g "S-<down>" #'+workspace/switch-to)
;; Org mode overrides global key bindings
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "S-<down>") #'+workspace/switch-to))
;; (map! :leader
;;       (:prefix ("r" . "Replace")
;;        :desc "Replace all"
;;        "r" #'org-journal-search))

;; (use-package! lsp-mode
;;   :hook  (scala-mode . lsp)
;;          (lsp-mode . lsp-lens-mode))

;; (use-package! lsp-mode
;;   ;; Optional - enable lsp-mode automatically in scala files
;;   :hook  (scala-mode . lsp)
;;          (lsp-mode . lsp-lens-mode)
;;   :custom
;;   ;; what to use when checking on-save. "check" is default, I prefer clippy
;;   (lsp-rust-analyzer-cargo-watch-command "clippy")
;;   (lsp-eldoc-render-all t)
;;   (lsp-idle-delay 0.6)
;;   ;; This controls the overlays that display type and other hints inline. Enable
;;   ;; / disable as you prefer. Well require a `lsp-workspace-restart' to have an
;;   ;; effect on open projects.
;;   (lsp-rust-analyzer-server-display-inlay-hints t)
;;   (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
;;   (lsp-rust-analyzer-display-chaining-hints t)
;;   (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
;;   (lsp-rust-analyzer-display-closure-return-type-hints t)
;;   (lsp-rust-analyzer-display-parameter-hints nil)
;;   (lsp-rust-analyzer-display-reborrow-hints nil)
;;   :config
;;   ;; Uncomment following section if you would like to tune lsp-mode performance according to
;;   ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
;;   ;;       (setq gc-cons-threshold 100000000) ;; 100mb
;;   ;;       (setq read-process-output-max (* 1024 1024)) ;; 1mb
;;   ;;       (setq lsp-idle-delay 0.500)
;;   ;;       (setq lsp-log-io nil)
;;   ;;       (setq lsp-completion-provider :capf)
;;   (setq lsp-prefer-flymake nil)
;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; (use-package! lsp-ui
;;   :commands lsp-ui-mode
;;   :custom
;;   (lsp-ui-peek-always-show t)
;;   (lsp-ui-sideline-show-hover t)
;;   (lsp-ui-doc-enable nil))








;; (use-package! lsp-metals)

;; (use-package! rustic
;;   ;; :bind (:map rustic-mode-map
;;   ;;             ("C-c C-c h" . lsp-describe-thing-at-point))
;;   :config
;;   (setq rustic-format-on-save t))
