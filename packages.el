;; Load path to elpa
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

;; Autopair
(require 'autopair)
(autopair-global-mode)

;; Ace Jump
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "M-s") 'ace-jump-mode)
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
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces-in-repl t)
(setq nrepl-history-file "~/.emacs.d/nrepl-history")
(add-hook 'nrepl-connected-hook
          (defun pnh-clojure-mode-eldoc-hook ()
            (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
            (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
            (nrepl-enable-on-existing-clojure-buffers)))
(add-hook 'nrepl-mode-hook 'subword-mode)
(require 'ac-nrepl)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)


;; Powerline
(powerline-default-theme)


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
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-M-s") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)




