;;(setq user-emacs-directory "D:/emacs_settings/.emads.d/)
(setq custom-file "D:/emacs_settings/.emacs.d/init.el")
(load custom-file)

(load-file "D:/emacs_settings/.emacs.d/rc.el")

(set-frame-font "Iosevka-20" nil t)
(add-to-list 'default-frame-alist '(font . "Iosevka-20"))

(tab-bar-mode 0) ;; don't want tabs
(global-tab-line-mode 1) ;; want buffers as tab line 

;;(set-frame-parameter nil 'undecorated t)   ;; Hide
(set-frame-parameter nil 'undecorated nil) ;; Show


(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(column-number-mode 1)

;;tabs

(custom-set-faces
 ;; Overall tab-line area
 '(tab-line ((t (:background "#1e1e1e" :foreground "#ffffff" :height 0.5))))
 
 ;; Unselected tab
 '(tab-line-tab ((t (:background "#2e2e2e" :foreground "#aaaaaa"
                      ;;  :box (:line-width -1 :style pressed-button)
                        :weight normal
                        :height 1.5))))

 ;; Currently selected tab
 '(tab-line-tab-current ((t (:background "#007acc" :foreground "#aaaaaa"
                        ;;        :box (:line-width -1 :style released-button)
                                :weight normal
                                :height 1.5))))

 ;; Inactive but visible tab
 '(tab-line-tab-inactive ((t (:background "#1e1e1e" :foreground "#777777"
                          ;;      :box (:line-width -1 :style released-button)
                                :height 1.5))))

 ;; Tab hover highlight
'(tab-line-highlight ((t (:background "#444444" :foreground "#ffffff"
                              )))) ;; :underline t  --> for underline if needed
)


(setq tab-line-separator " ")  ;; Adds space between tabs

;;tabs ends.../////


;; Auto completion and ido suggestions

(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)

;;IDO plus
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)
;;

(add-to-list 'load-path "D:/emacs_settings/.emacs.d/")

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(global-display-line-numbers-mode 1)

(rc/require-theme 'gruber-darker)

(setq-default indent-tabs-mode t)  ;; Use tabs instead of spaces

(require 'cc-mode)
(add-hook 'c-mode-common=hook 'electric-pair-mode)
(electric-pair-mode 1)

; Mx recentf-open-files to check out recently opened files in emacs to navigate faster 
(recentf-mode 1)

(setq history-length 25)
(savehist-mode 1)

(save-place-mode 1)
(global-set-key (kbd "C-.") 'recentf-open-files)


; revert buffers when the underlying file has changed.
(global-auto-revert-mode 1)

; open emacs full screen on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

; This is for vertical compilation buffer
(setq split-height-threshold nil)
(setq split-width-threshold 0)
(setq compiliation-window-width 30)

(setq compilation-ask-about-save nil)

;;;;;; Function to copy current line above or below

(defun duplicate-region-or-line-below ()
  "Duplicate the selected region or current line below."
  (interactive)
  (if (use-region-p)
      ;; Duplicate the selected region
      (let ((region (buffer-substring (region-beginning) (region-end))))
        (save-excursion
          (goto-char (region-end))
          (newline)
          (insert region)))
    ;; Duplicate the current line if no region is selected
    (let ((line (thing-at-point 'line t)))
      (save-excursion
        (end-of-line)
        (newline)
        (insert line)))))

(defun duplicate-region-or-line-above ()
  "Duplicate the selected region or current line above."
  (interactive)
  (if (use-region-p)
      ;; Duplicate the selected region
      (let ((region (buffer-substring (region-beginning) (region-end))))
        (save-excursion
          (goto-char (region-beginning))
          (newline)
          (forward-line -1)
          (insert region)))
    ;; Duplicate the current line if no region is selected
    (let ((line (thing-at-point 'line t)))
      (save-excursion
        (beginning-of-line)
        (newline)
        (forward-line -1)
        (insert line)))))


(global-set-key (kbd "M-S-<down>") 'duplicate-region-or-line-below)
(global-set-key (kbd "M-S-<up>") 'duplicate-region-or-line-above)
;;;;;; ------------- M up down  --------- END...

;; rectangle replacement starts--------
(defun replace-rectangle-with-text (text)
  "Replace the selected rectangle with the given TEXT."
  (interactive "sReplace rectangle with: ")
  (when (use-region-p)
    (string-rectangle (region-beginning) (region-end) text)))

(global-set-key (kbd "C-c r") 'replace-rectangle-with-text)

;;; rectangle character replacement ends...


;; copy a line without deleting it ---- START
(defun copy-selection-or-line ()
  "Copy the selected region (word or lines) if active, or copy the entire line if no selection is made."
  (interactive)
  (if (use-region-p)  ; Check if there is an active region
      (kill-ring-save (region-beginning) (region-end))  ; Copy the selected region (word, line, etc.)
    (progn
      (move-beginning-of-line 1)  ; Move to the beginning of the current line
      (kill-ring-save (point) (line-end-position)))))  ; Copy the whole line


(global-set-key (kbd "C-c c") 'copy-selection-or-line)

;; Copy line without deleting -- ENDS...


;;Move line or selection using package move-text
(use-package move-text
  :ensure t
  :bind (("M-<up>" . move-text-up)
         ("M-<down>" . move-text-down)))

;; move-text package ends....--------

;; Move text up and down after copying

(defun duplicate-line-up ()
  "Duplicate current line and move cursor to the duplicated line above."
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (let ((line (thing-at-point 'line t)))
        (beginning-of-line)
        (insert line)))
    (previous-line)
    (move-to-column col)))

(defun duplicate-line-down ()
  "Duplicate current line and move cursor to the duplicated line below."
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (let ((line (thing-at-point 'line t)))
        (end-of-line)
        (newline)
        (insert line)))
    (next-line)
    (move-to-column col)))

(global-set-key (kbd "C-c M-<up>") 'duplicate-line-up)
(global-set-key (kbd "C-c M-<down>") 'duplicate-line-down)

;;move text up and down after copying ends...-----

;;Delete selection mode to delete word/ line if start typing after selection
(delete-selection-mode 1)
;; ends...

;;c lang format code
(defun astyle-buffer ()
  (interactive)
  (let ((saved-line-number (line-number-at-pos)))
    (shell-command-on-region
     (point-min)
     (point-max)
     "astyle --style=kr"
     nil
     t)
    (goto-line saved-line-number)))

(global-set-key (kbd "C-S-l") 'astyle-buffer)

(add-hook 'simpc-mode-hook
	  (lambda ()
	    (interactive)
	    (setq-local fill-paragraph-function 'astyle-buffer)))

(require 'compile)

;; compilation buffer settings
(setq compilation-scroll-output t)
(setq compilation-auto-jump-to-first-error t)
(setq compilation-max-output-line-length nil)
(global-set-key (kbd "<f6>") 'compile)
(global-set-key (kbd "<f5>") 'recompile)

;; scrolling other window i.e compilation to check
(global-set-key (kbd "<f7>") (lambda () (interactive) (scroll-other-window 3)))
(global-set-key (kbd "<f8>") (lambda () (interactive) (scroll-other-window-down 3)))

;; company mode and ya snippet enable
(add-hook 'after-init-hook 'global-company-mode)
(require 'yasnippet)
(yas-global-mode 1)

;;enable dired dwim for history of moving files
(setq dired-dwim-target t)
(setq dired-listing-switches "-alh")

(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)

;; ----- multiple cursors settings
(require 'multiple-cursors)

;; do what I means
(global-set-key (kbd "C-S-m") 'mc/mark-all-dwim)

;; both marked and unmarked region. multiple presses.
;; C-g to unmark region and keep the cursors at the start of a position
;; RET to disable multiple cursors

;;edit lines
;;(global-set-key (kbd "C-S-e") 'mc/edit-lines) ;; for continous lines, mark lines and then create cursors

;; NOT defining key for below because we can enable multiple cursors, and then Cg and then Ce to jump to the end of lines.
(global-set-key (kbd "C-S-e") 'mc/edit-ends-of-lines)  ;; end of lines, have to select lines.

;;expand region, type once and then use l(expand), - (reduce), 0 (go away)
;; (global-set-key (kbd "C-S-r") 'er/expand-region)  ;; Enable if needed.

;; select region first, then create cursors

;;skip this match and move to the next one
(global-set-key (kbd "C-<") 'mc/skip-to-previous-like-this)
(global-set-key (kbd "C->") 'mc/skip-to-next-like-this)

(global-set-key (kbd "C-S-n") 'mc/mark-next-like-this)

;;kill all buffers
;; you can do it using Mx kill-some-buffers and go one by one, below is a single key to kill all except current buffer

(defun kill-other-buffers ()
  "Kill all buffers except the current one."
  (interactive)
  (let ((current-buffer (current-buffer)))
    (dolist (buffer (buffer-list))
      (unless (eq buffer current-buffer)
        (kill-buffer buffer)))))


(global-set-key (kbd "C-c k") 'kill-other-buffers)

;;; git bash
(setq explicit-shell-file-name "C:/Program Files/Git/git-bash.exe")
(setq shell-file-name "bash")
(setq explicit-bash.exe-args '("--login" "-i"))

;;expand region
(require 'expand-region)
(global-set-key (kbd "<f9>") 'er/expand-region)

;;disable bell and use visual bell
(setq ring-bell-function 'ignore)
(setq visible-bell t)

;; lsp mode
;; (add-to-list 'auto-mode-alist '("\\.c\\'" . simpc-mode))
;; (add-to-list 'auto-mode-alist '("\\.h\\'" . simpc-mode))
;; (add-to-list 'auto-mode-alist '("\\.hpp\\'" . simpc-mode))
;; (add-to-list 'auto-mode-alist '("\\.cc\\'" . simpc-mode))
;; (add-to-list 'auto-mode-alist '("\\.cpp\\'" . simpc-mode))

;; (use-package lsp-mode
;;   :hook ((c-mode . lsp)
;; 	 (python-mode . lsp)
;; 	 (simpc-mode . lsp)
;; 	 (c++-mode . lsp))
;;   :commands lsp)

;;consult mark
(global-set-key (kbd "<f12>") 'consult-mark)

;;load yasnippet
(yas-recompile-all)
(yas-reload-all)

;;c3-mode
(setq treesit-language-source-alist
      '((c3 "https://github.com/c3lang/tree-sitter-c3")))

(add-to-list 'treesit-language-source-alist
	     '(c3 "https://github.com/c3lang/tree-sitter-c3"))

(add-to-list 'load-path "D:/emacs_settings/.emacs.d/c3-ts-mode.el")
(require 'c3-ts-mode)

(add-to-list 'load-path "D:/emacs_settings/.emacs.d/tree-sitter/libtree-sitter-c3.dll")
;;(module-load "libtree-sitter-c3.dll")

(setq treesit-font-lock-level 4)
(setq c3-ts-mode-indent-offset 1)

;; Select right and left to a text

(defun select-to-eol ()
  "Select from point to end of line."
  (interactive)
  (set-mark (point))
  (end-of-line))

(defun select-to-bol ()
  "Select from point to beginning of line."
  (interactive)
  (set-mark (point))
  (beginning-of-line))

(global-set-key (kbd "C-c C-<right>") 'select-to-eol)
(global-set-key (kbd "C-c C-<left>") 'select-to-bol)

