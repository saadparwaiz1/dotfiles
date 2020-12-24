; vim: set foldmethod=marker foldlevel=0 nomodeline:
; ====================================================================
; Set Emacs Settings {{{
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq display-line-numbers-type 'relative)

(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font" :foundry "nil" :slant normal :weight normal :height 120 :width normal)))))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;}}}
; ====================================================================
; Builtin Modes {{{
; ====================================================================
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode t)
(global-display-line-numbers-mode t)
; }}}
; ====================================================================
; Emacs Set Up Straight.el{{{
; ====================================================================
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
;}}}
; ====================================================================
; Use-Package Config {{{
(use-package evil
  :init
    (setq evil-want-keybinding nil)
  :config
    (evil-mode 1)
)

(use-package evil-collection
  :after evil
  :config
    (evil-collection-init)
)

(use-package gruvbox-theme
  :config
    (load-theme 'gruvbox t)
)

(use-package tree-sitter
  :config
    (global-tree-sitter-mode)
  :init
    (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
)

(use-package tree-sitter-langs)

(use-package key-chord
  :config
    (key-chord-mode 1)
    (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
)

(use-package counsel
  :after evil
  :diminish
  :bind (
    ("C-s" . swiper-isearch)
    ("M-f" . counsel-fzf)
    ("M-x" . counsel-M-x)
    ("C-x C-f" . counsel-find-file)
  )
)

(use-package exec-path-from-shell
  :config
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "FZF_DEFAULT_COMMAND")
)

(use-package smart-mode-line
  :config
    (sml/setup)
)

(use-package org)
; }}}
; ====================================================================
