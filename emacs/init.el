(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Packages

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))
(use-package solarized-theme
  :ensure t
  :config
  (setq solarized-distinct-fringe-background t)
  (setq solarized-high-contrast-mode-line t)
  (load-theme 'solarized-light-high-contrast t))
(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (evil-set-leader 'normal ",")
  (evil-define-key 'normal 'global (kbd "<leader>f") 'counsel-fzf)
  (evil-define-key 'normal 'global (kbd "<leader>b") 'counsel-switch-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>u") 'undo-tree-visualize)
  (evil-define-key 'normal 'global (kbd "<home>") 'evil-beginning-of-visual-line)
  (evil-define-key 'normal 'global (kbd "<end>") 'evil-end-of-visual-line))
(use-package evil-fringe-mark
  :ensure t
  :config
  (global-evil-fringe-mark-mode t))
(use-package counsel
  :ensure t
  :config
  (counsel-mode t))
(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (ivy-mode t))
(use-package ivy-prescient
  :ensure t
  :after (counsel)
  :config
  (ivy-prescient-mode t))
(use-package swiper
  :ensure t
  :bind ("C-s" . swiper-isearch))
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode t))
(use-package markdown-mode
  :ensure t)
(use-package writeroom-mode
  :ensure t
  :config
  (visual-line-mode t)
  :hook markdown-mode)
(use-package focus
  :ensure t
  :config
  (add-to-list 'focus-mode-to-thing '(text-mode . paragraph))
  :hook (markdown-mode . focus-mode))
(use-package org
  :config
  (setq org-startup-indented t))
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode t))))
(use-package magit
  :ensure t)
(use-package deft
  :ensure t
  :config
  (setq deft-directory "~/Documents/noteringar/"))

(set-face-attribute 'default nil :family "Triplicate T3c" :slant 'normal :weight 'normal :height 200 :width 'normal)
(toggle-frame-fullscreen)
(setq-default line-spacing 8)
(setq scroll-margin 12)
(fringe-mode 20)
(global-hl-line-mode t)
(global-visual-line-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Fuck off bell. Flash the mode line instead.
(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))

(setf sentence-end-double-space nil)
(setq bookmark-save-flag 1)
(setq auto-revert-check-vc-info t)
(when (eq system-type 'darwin)
  (setq mac-right-option-modifier 'none))
