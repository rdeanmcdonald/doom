;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

(package! jsonnet-mode)
(package! blamer)

;; Unpin lsp-mode
;; (unpin! lsp-mode)
;; (package! lsp-mode :pin "526859a9c77faf4c208c4bd9637163b717204040")
