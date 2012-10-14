(setq user-full-name "Sun Wenxiang")
(setq user-mail-address "wxsun1991@gmail.com")

;; 设置默认字体
;;(set-default-font "Andale Mono Regular-16")
(fset 'yes-or-no-p 'y-or-n-p) 
(set-frame-parameter (selected-frame) 'alpha (list 100 100)) 
(add-to-list 'default-frame-alist (cons 'alpha (list 100 100))) 
(set-language-environment "Chinese-GB")
(set-keyboard-coding-system 'chinese-iso-8bit)


(setq mac-command-modifier 'meta)
(setq mac-control-modifier 'control)
(setq mac-option-modifier 'alt) 
;; UTF-8 settings
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)

(setq mac-option-modifier 'meta)

(setq default-major-mode 'text-mode)

(set-face-attribute
'default nil :font "consolas 16")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "Hiragino Sans GB" :size 18)))

;;(setq display-time-format “%V %m.%d/%H:%M”)
(display-time-mode 1) ; 显示时间
;;(setq display-time-24hr-format t) ; 24小时格式
;;(setq display-time-day-and-date t) ; 显示日期

(mouse-avoidance-mode 'animate) ; 光标移动到鼠标下时，鼠标自动弹开

(setq inhibit-startup-message t)

(setq kill-ring-max 200)

;;(setq default-fill-column 60)

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
(setq scroll-margin 3
    scroll-conservatively 10000)

;;(setq frame-title-format "emacs@%b")


(windmove-default-keybindings)

;;(show-paren-mode t)
;;(setq show-paren-style 'parentheses)
;;(linum-mode 1)

(require 'ido)
(ido-mode t)

(setq default-frame-alist
'((top . 0)(left . 300)(width . 120)(height . 65)(tool-bar-lines . 0)))
;;(setq default-frame-alist
;;'((height . 64) (width . 160) (menu-bar-lines . 0) (tool-bar-lines . 0)(scroll-bar-lines . 0))
(setq frame-title-format "☆Emacs☆      %b   ") ; 显示当前编辑的文档

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(add-to-list 'load-path
;;	     "~/.emacs.d/plugins/")
;;(require 'powerline)
;;(powerline-default)
;;(add-to-list 'load-path
;; 	     "~/.emacs.d/plugins/")
;;(require 'highlight-symbol)
;;(highlight-symbol-mode t)


;;
(global-set-key [(control f3)] 'highlight-symbol-at-point)
;;global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

(add-to-list 'load-path 
	     "~/.emacs.d/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)))


;;choose the color theme
;;(load-file “~/.emacs.d/themes/zenburn-theme.el”)
(load-file "~/.emacs.d/themes/color-theme-molokai.el")
(load-file "~/.emacs.d/themes/color-theme-blackboard.el")
(color-theme-molokai)
;;(Color-theme-blackboard)
;;(color-theme-gnome2)
;;(color-theme-zenburn)


;;cedet
(add-to-list 'load-path "~/.emacs.d/cedet-1.1/common")
(require 'cedet)
(require 'semantic-ia)
 
;; Enable EDE (Project Management) features
(global-ede-mode 1)
 
(semantic-load-enable-minimum-features)
;;(semantic-load-enable-code-helpers)
(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers) 
;; Enable SRecode (Template management) minor-mode.
(global-srecode-minor-mode 1)

;;ecb
(add-to-list 'load-path
	     "~/.emacs.d/ecb-2.40/")
(require 'ecb)
(setq stack-trace-on-error nil)


;;自动补全auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete//ac-dict")
(ac-config-default)

;;autopari
(add-to-list 'load-path
	     "~/.emacs.d/plugins")
(require 'autopair)
(autopair-global-mode) 
(require 'auto-pair+)

;;yasnippet
;;(add-to-list 'load-path
;;              "~/.emacs.d/plugins/yasnippet")
;;(require 'yasnippet)
;;(yas-global-mode 1)

;;auctex配置
(add-to-list 'load-path
             "~/.emacs.d/Auctex")
(add-to-list 'load-path
	     "~/.emacs.d/Auctex/preview")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook (lambda()
                                  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                                  (setq TeX-command-default "XeLaTeX")
                                     (setq TeX-save-query  nil )
                                      (setq TeX-show-compilation t)
                                                                   ))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (turn-on-reftex)
            (setq reftex-plug-into-AUCTeX t)))
(setq TeX-PDF-mode t)
(setq TeX-view-program-selection
      '(((output-dvi style-pstricks)
         "dvips and PDF Viewer")
        (output-dvi "PDF Viewer")
        (output-pdf "PDF Viewer")
        (output-html "Safari")))
(setq TeX-view-program-list
      '(("dvips and PDF Viewer" "%(o?)dvips %d -o && open %f")
        ("PDF Viewer" "open %o")
        ("Safari" "open %o")))



;;powerline配置
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline/")
(load-file "~/.emacs.d/vender/emacs-powerline/powerline.el")
(require 'powerline)
;;(require 'cl)

(defun arrow-right-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 24 2 1\",
\". c %s\",
\"  c %s\",
\".           \",
\"..          \",
\"...         \",
\"....        \",
\".....       \",
\"......      \",
\".......     \",
\"........    \",
\".........   \",
\"..........  \",
\"........... \",
\"............\",
\"........... \",
\"..........  \",
\".........   \",
\"........    \",
\".......     \",
\"......      \",
\".....       \",
\"....        \",
\"...         \",
\"..          \",
\".           \",
\"            \"};"  color1 color2))
 
 
 
(defun arrow-left-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 24 2 1\",
\". c %s\",
\"  c %s\",
\"           .\",
\"          ..\",
\"         ...\",
\"        ....\",
\"       .....\",
\"      ......\",
\"     .......\",
\"    ........\",
\"   .........\",
\"  ..........\",
\" ...........\",
\"............\",
\" ...........\",
\"  ..........\",
\"   .........\",
\"    ........\",
\"     .......\",
\"      ......\",
\"       .....\",
\"        ....\",
\"         ...\",
\"          ..\",
\"           .\",
\"            \"};"  color2 color1))
 
 
(defun arrow-first-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"21 24 2 1\",
\". c %s\",
\"  c %s\",
\".   ......           \",
\"..   ......          \",
\"...   ......         \",
\"....   ......        \",
\".....   ......       \",
\"......   ......      \",
\".......   ......     \",
\"........   ......    \",
\".........   ......   \",
\"..........   ......  \",
\"...........   ...... \",
\"............   ......\",
\"...........   ...... \",
\"..........   ......  \",
\".........   ......   \",
\"........   ......    \",
\".......   ......     \",
\"......   ......      \",
\".....   ......       \",
\"....   ......        \",
\"...   ......         \",
\"..   ......          \",
\".   ......           \",
\"   ......            \"};"  color1 color2))
 
 
 
(defconst color1 "#F9408C")
(defconst color2 "#989898")
(defconst color3 "#696969")
 
(defvar arrow-right-1 (create-image (arrow-first-xpm color1 color2) 'xpm t :ascent 'center))
(defvar arrow-right-2 (create-image (arrow-right-xpm color2 color3) 'xpm t :ascent 'center))
(defvar arrow-right-3 (create-image (arrow-right-xpm color3 "None") 'xpm t :ascent 'center))
(defvar arrow-left-1  (create-image (arrow-left-xpm color2 color1) 'xpm t :ascent 'center))
(defvar arrow-left-2  (create-image (arrow-left-xpm color3 color2) 'xpm t :ascent 'center))
(defvar arrow-left-3  (create-image (arrow-left-xpm "None" color3) 'xpm t :ascent 'center))
 
(setq-default mode-line-format
 (list  '(:eval (concat (propertize " %* %b " 'face 'mode-line-color-1)
                        (propertize " " 'display arrow-right-1)))
        '(:eval (concat (propertize " %Z " 'face 'mode-line-color-2)
                        (propertize " " 'display arrow-right-2)))
        '(:eval (concat (propertize " %m " 'face 'mode-line-color-3)
                        (propertize " " 'display arrow-right-3)))
 
        ;; Justify right by filling with spaces to right fringe - 16
        ;; (16 should be computed rahter than hardcoded)
        '(:eval (propertize " " 'display '((space :align-to (- right-fringe 17)))))
 
        '(:eval (concat (propertize " " 'display arrow-left-3)
                        (propertize " %p " 'face 'mode-line-color-3)))
        '(:eval (concat (propertize " " 'display arrow-left-2)
                        (propertize "%4l:%2c  " 'face 'mode-line-color-2)))
))
 
(make-face 'mode-line-color-1)
(set-face-attribute 'mode-line-color-1 nil
                    :foreground "#fff"
                    :background color1)
 
(make-face 'mode-line-color-2)
(set-face-attribute 'mode-line-color-2 nil
                    :foreground "#fff"
                    :background color2)
 
(make-face 'mode-line-color-3)
(set-face-attribute 'mode-line-color-3 nil
                    :foreground "#fff"
                    :background color3)
 
(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "#404040"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :foreground "#fff"
                    :background "#202020")



;;scroll优化
(setq scroll-step 1)

(global-set-key (kbd "<next>") 'my-page-down)
(defun my-page-down ()
  "12Feb03"
  (interactive)
  (let ((pos (point)))
    (goto-char (window-start))
    (next-line 1)
    (set-window-start (selected-window)
                      (point))
    (goto-char pos)
    (next-line 1)))

(global-set-key (kbd "<prior>") 'my-page-up)
(defun my-page-up ()
  "12Feb03"
  (interactive)
  (let ((pos (point)))
    (goto-char (window-start))
    (previous-line 1)
    (set-window-start (selected-window)
                      (point))
    (goto-char pos)
    (previous-line 1)))



(global-set-key "\M-w"
                (lambda ()
                  (interactive)
                  (if mark-active
                      (kill-ring-save (region-beginning)
                                      (region-end))
                    (progn
                     (kill-ring-save (line-beginning-position)
                                     (line-end-position))
                     (message "copied line")))))

;; kill region or whole line
(global-set-key "\C-w"
                (lambda ()
                  (interactive)
                  (if mark-active
                      (kill-region (region-beginning)
                                   (region-end))
                    (progn
                     (kill-region (line-beginning-position)
                                  (line-end-position))
                     (message "killed line")))))



