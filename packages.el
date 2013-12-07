;; Recursively add everything in elpa/ to my load path
(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Mark Multiple
(require 'multiple-cursors)
                                        ; Add cursor to each line in region
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
                                        ; Multiple cursors by keyword
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C--") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "C-M--") 'set-rectangular-region-anchor)


;; move-text
(require 'move-text)
(move-text-default-bindings)

;; electric pair
(autopair-global-mode 1)

;; Ace Jump
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "M-s") 'ace-jump-mode)
(define-key global-map (kbd "C-M-s") 'ace-jump-mode)
(require 'ace-jump-buffer)
(define-key global-map (kbd "C-x M-b") 'ace-jump-buffer)

;; yasnippet
(require 'yasnippet)
(setq yas/prompt-functions '(yas/ido-prompt
                             yas/completing-prompt))
(yas-global-mode 1)

;; undo tree
(require 'undo-tree)
(global-undo-tree-mode)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)
(pending-delete-mode 1)

;; sr-speedbar
(require 'sr-speedbar)

;; key-chord
(require 'key-chord)
(key-chord-mode 1)


;; dired
(require 'dired-details)
(dired-details-install)
(require 'dired-details+)


;; Web Mode
(require 'web-mode)
(setq web-mode-engines-alist '(("django" . "\\.html\\'")))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))


;; clojure - paredit, nrepl, rainbow delimters
(add-hook 'clojure-mode-hook
          #'(lambda ()
              (paredit-mode)
              (rainbow-delimiters-mode)
              (setq autopair-dont-activate t)
              (autopair-mode -1)))
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate t)
              (autopair-mode -1)))
(setq nrepl-hide-special-buffers t)
(setq cider-auto-select-error-buffer t)
(setq nrepl-buffer-name-separator "-")
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; Powerline
;(powerline-vim-theme)


;; elisp
(add-hook 'emacs-lisp-hook
          #'(lambda ()
              (paredit-mode)
              (rainbow-delimiters-mode)
              (setq autopair-dont-activate t)
              (autopair-mode -1)))


;; python elpy
(package-initialize)
(elpy-enable)

;; iy go to char
(require 'iy-go-to-char)
(add-to-list 'mc/cursor-specific-vars 'iy-go-to-char-start-pos)
;; iy-go-to-char
(key-chord-define-global "fj" 'iy-go-to-char)
(key-chord-define-global "bj" 'iy-go-to-char-backward)

;; Smesxw
;(require 'smex) ; Not needed if you use package.el
;(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                                        ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Brows kill Ring
(browse-kill-ring-default-keybindings)

;; ido hacks
(load-file "~/.emacs.d/ido-hacks.el")

;; Skewer
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;; make paredit kill global
(require 'paredit)
(global-set-key (kbd "C-k") 'paredit-kill)

;; eclim
;; (require 'eclim)
;; (global-eclim-mode)
;; (require 'eclimd)
;; (setq help-at-pt-display-when-idle t)
;; (setq help-at-pt-timer-delay 0.1)
;; (help-at-pt-set-timer)
;; (require 'company)
;; (require 'company-emacs-eclim)
;; (company-emacs-eclim-setup)
;; (global-company-mode t)
