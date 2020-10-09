(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Display settings
(set-face-attribute 'default nil :family "Triplicate T4c" :slant 'normal :weight 'normal :height 130 :width 'normal)
(toggle-frame-fullscreen)
(setq-default line-spacing 10)
(global-hl-line-mode t)
(global-visual-line-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq solarized-distinct-fringe-background t)
(setq solarized-high-contrast-mode-line t)
(load-theme 'solarized-light-high-contrast t)

;; Plugin settings
(setq bm-highlight-style (quote bm-highlight-only-fringe))
(setq evil-cross-lines t)
(setq ivy-use-virtual-buffers t)
      
;; Turn on default plugins
(evil-mode t)
(ivy-mode t)

;; Key bindings
(global-set-key (kbd "C-s") 'swiper-isearch)
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(evil-set-leader 'normal ",")
(evil-define-key 'normal 'global (kbd "<leader>f") 'counsel-fzf)
(evil-define-key 'normal 'global (kbd "<leader>b") 'counsel-switch-buffer)

;; Distraction free
(defun distraction-free ()
  (visual-line-mode 1)
  (writeroom-mode 1))
(add-hook 'markdown-mode-hook 'distraction-free)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "76d5f2f47ebcb151e5becf8d8b7e2dd1ddb113cba163aec15138e3aa87466959" "d0fd069415ef23ccc21ccb0e54d93bdbb996a6cce48ffce7f810826bb243502c" "cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2" "ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "021321ae56a45794f43b41de09fb2bfca184e196666b7d7ff59ea97ec2114559" default)))
'(package-selected-packages
   (quote
    (evil counsel ivy bm solarized-theme magit markdown-mode writeroom-mode))))
