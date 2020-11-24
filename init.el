(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Display settings
(set-face-attribute 'default nil :family "Triplicate T4c" :slant 'normal :weight 'normal :height 120 :width 'normal)
(toggle-frame-fullscreen)
(setq-default line-spacing 10)
(setq scroll-margin 4)
(fringe-mode 20)
(global-hl-line-mode t)
(global-visual-line-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq solarized-distinct-fringe-background t)
(setq solarized-high-contrast-mode-line t)
(load-theme 'solarized-light-high-contrast t)

;; Other settings
(setf sentence-end-double-space nil)
(setq bookmark-save-flag 1)
(setq auto-revert-check-vc-info t)

;; Plugin settings
(setq ivy-use-virtual-buffers t)  
(setq org-startup-indented t)

;; Turn on default plugins
(evil-mode t)
(ivy-mode t)
(global-undo-tree-mode t)
(global-evil-fringe-mark-mode t)

;; Org mode extras
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Distraction free markdown
(defun distraction-free ()
  (visual-line-mode 1)
  (writeroom-mode 1))
(add-hook 'markdown-mode-hook 'distraction-free)

;; Fuck off bell. Flash the mode line instead.
(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))

;; Key bindings
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-o") 'ace-window)
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(evil-set-leader 'normal ",")
(evil-define-key 'normal 'global (kbd "<leader>f") 'counsel-fzf)
(evil-define-key 'normal 'global (kbd "<leader>b") 'counsel-switch-buffer)
(evil-define-key 'normal 'global (kbd "<leader>u") 'undo-tree-visualize)
(evil-define-key 'normal 'global (kbd "<leader>mm") 'bookmark-set)
(evil-define-key 'normal 'global (kbd "<leader>ma") 'bookmark-set-annotation)
(evil-define-key 'normal 'global (kbd "<leader>mg") 'bookmark-jump)
(evil-define-key 'normal 'global (kbd "<leader>ml") 'bookmark-bmenu-list)

