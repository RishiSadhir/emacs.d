;;			Rishi Sadhir
;;			User Defined Functions
;;
;;

;; Cleanup-buffer
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (cleanup-buffer-safe)
  (indent-buffer))
(define-key global-map(kbd "C-c c") 'cleanup-buffer)


;; Non inclusive zap to char
(defun zap-to-char2 (arg char)
  "Kill up to but not including ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes backward if ARG is negative; error if CHAR not found."
  (interactive "p\ncZap to char: ")
  (with-no-warnings
    (if (char-table-p translation-table-for-input)
        (setq char (or (aref translation-table-for-input char) char))))
  (kill-region (point) (progn
                         (search-forward (char-to-string char) nil nil arg)
                         (- (point) 1))))
(define-key global-map(kbd "C-z") 'zap-to-char2)


;; Clear shell history
(defun clear-shell ()
  "Clear() functin for M-x shell"
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))


;; Rename current buffer
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))


;; Delete the file associated with the current buffer
(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; join lines
(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))

;; C-d on an empty line in the shell terminates the process.
;; With this snippet, another press of C-d will kill the buffer.
(defun comint-delchar-or-eof-or-kill-buffer (arg)
  (interactive "p")
  (if (null (get-buffer-process (current-buffer)))
      (kill-buffer)
    (comint-delchar-or-maybe-eof arg)))
(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map
              (kbd "C-d") 'comint-delchar-or-eof-or-kill-buffer)))


;; M-9 Will rotate your windows counterclockwise
(defun rotate-windows ()
  "Rotate your open buffers clockwise"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list)
                           (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))
(global-set-key (kbd "M-9") 'rotate-windows)


;; I keep forgetting to how to toggle writeable in dired mode
(add-hook 'dired-mode-hook
		  (lambda ()
			(message "C-x C-q to toggle writeable")))


;; Opens ~/.emacs.d/init.el. Faster than C-x C-f ...
(defun open-init ()
     (interactive)
     (find-file "~/.emacs.d/init.el"))


;; Create etags - Instead of manually typing the shell command everytime
(defun etags-create-tags ()
  "Run etags in . -type f -name `extension` | xargs etags"
  (interactive "p")
  (let (
        (extension (read-from-minibuffer "extension:"))
        )
    (message (concat "find . -type f -name " extension " | xargs etags"))
    (shell-command (concat "find . -type f -name " extension " | xargs etags"))))


;; Make windmove switch frames if no more buffers to move to
(require 'windmove)
(defun windmove-left-thorough (&optional arg)
  "Select the buffer to the left of the current one.
With no prefix argument, or with prefix argument equal to zero,
\"left\" is relative to the position of point in the buffer; otherwise
it is relative to the top edge (for positive ARG) or the bottom edge
\(for negative ARG) of the current buffer.
If no window is at the desired location, we try switching to the left
frame instead."
  (interactive "P")
  (let ((other-window (windmove-find-other-window 'left arg nil)))
    (cond
     ((null other-window)
      (other-frame -1))
     (t
      (windmove-do-window-select 'left arg)))
    ))
(defun windmove-right-thorough (&optional arg)
  "Select the buffer to the left of the current one.
With no prefix argument, or with prefix argument equal to zero,
\"left\" is relative to the position of point in the buffer; otherwise
it is relative to the top edge (for positive ARG) or the bottom edge
\(for negative ARG) of the current buffer.
If no buffer is at the desired location, we try switchint to the right
frame instead"
  (interactive "P")
  (let ((other-window (windmove-find-other-window 'right arg nil)))
    (cond
     ((null other-window)
      (other-frame 1))
     (t
      (windmove-do-window-select 'right arg)))
    ))
(define-key global-map(kbd "C-;") 'windmove-left-thorough)
(define-key global-map(kbd "C-'") 'windmove-right-thorough)

