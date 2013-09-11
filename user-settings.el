;; ido-mode
;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
(require 'ido)
(ido-mode 'both) ;; for buffers and files
(setq
 ido-save-directory-list-file "~/.emacs.d/cache/ido.last"
 ido-ignore-buffers ;; ignore these guys
 '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
   "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
 ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~/Dropbox")
 ido-case-fold  t                       ; be case-insensitive
 ido-enable-last-directory-history t    ; remember last used dirs
 ido-max-work-directory-list 30         ; should be enough
 ido-max-work-file-list      50         ; remember many
 ido-use-filename-at-point nil          ; don't use filename at point (annoying)
 ido-use-url-at-point nil               ; don't use url at point (annoying)
 ido-enable-flex-matching nil           ; don't try to be too smart
 ido-max-prospects 8                    ; don't spam my minibuffer
 ido-confirm-unique-completion t)       ; wait for RET, even with unique completion
(define-key global-map (kbd "<escape>") 'keyboard-escape-quit)         ;; Making aborting commands easier
(setq-default truncate-lines 0)       ; Truncate lines off by default


;; recentf
(require 'recentf)    ;; save recently used files
(setq
 recentf-save-file "~/.emacs.d/cache/recentf"
 recentf-max-saved-items 100     ;; max save 100
 recentf-max-menu-items 15)      ;; max 15 in menu
(recentf-mode t)                  ;; turn it on
(global-set-key (kbd "C-c C-r") 'recentf-open-files)


;; webjump
(global-set-key (kbd "C-x g") 'webjump)


;; Goto line
(global-set-key (kbd "M-g") 'goto-line)


;; increase minibuffer size when ido completion is active
(add-hook 'ido-minibuffer-setup-hook
          (function
           (lambda ()
             (make-local-variable 'resize-minibuffer-window-max-height)
             (setq resize-minibuffer-window-max-height 1))))
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)


;; the modeline
(line-number-mode t)                     ;; show line numbers
(size-indication-mode t)                 ;; show file size (emacs 22+)


;; the minibuffer
(setq
 enable-recursive-minibuffers nil       ;;  allow mb cmds in the mb
 max-mini-window-height .25             ;;  max 2 lines
 minibuffer-scroll-window nil
 resize-mini-windows nil)
(icomplete-mode t)                      ;; completion in minibuffer
(setq
 icomplete-prospects-height 1           ;; don't spam my minibuffer
 icomplete-compute-delay 0)             ;; don't wait
(require 'icomplete+ nil 'noerror)      ;; drew adams' extras


;; Make splitting windows easier
(define-key global-map (kbd "M-3") 'split-window-right)
(define-key global-map (kbd "M-2") 'split-window-below)
(define-key global-map (kbd "M-0") 'delete-window)
(define-key global-map (kbd "M-1") 'delete-other-windows)

;; Random Settings



;; Initial Scratch Buffer
(setq initial-scratch-message
      ";; scratch buffer created -- happy hacking\n")

;; Ignore case when completing
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t)          ;; ...filenames too

(setq inhibit-startup-message t                         ;; don't show ...
      inhibit-startup-echo-area-message t)              ;; ... startup messages

;; End files with a newline
(setq require-final-newline t)


;; One letter answers please
(defalias 'yes-or-no-p 'y-or-n-p)

;; RET = RET & Indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Turn off system bell
(setq ring-bell-function 'ignore)

;; Line numbers in mode line
(line-number-mode 1)
(column-number-mode 1)

;; Change point in to a line
(setq-default cursor-type 'bar)

;; Make Ctrl-Tab a Microsoft Word style tab
(global-set-key (kbd "C-<tab>") 'tab-to-tab-stop)

;; Windmove: Switch between buffers with shift arrow
(require 'windmove)
(windmove-default-keybindings)
(define-key global-map(kbd "C-;") 'windmove-left-thorough)
(define-key global-map(kbd "C-'") 'windmove-right-thorough)
(key-chord-define-global "ja" 'windmove-left-thorough)
(key-chord-define-global "jw" 'windmove-up)
(key-chord-define-global "jd" 'windmove-right-thorough)
(key-chord-define-global "js" 'windmove-down)

;; Org mode is better with visual line mode
(add-hook 'org-mode 'visual-line-mode)

