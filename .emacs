(setq user-full-name "Sun Wenxiang")
(setq user-mail-address "wxsun1991@gmail.com")

(setq default-directory "~/")

;;(load "server")
;;(unless (server-running-p) (server-start))
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

;;将所有的~文件放在.backup文件夹里面
(setq backup-directory-alist (quote (("." . "~/.backups"))))
(setq mac-option-modifier 'meta)
(setq default-major-mode 'text-mode)

;; Setting English Font
(set-face-attribute 'default nil :font "Inconsolata 14")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "Hiragino Sans GB"
                                       :size 14)))
(tool-bar-mode 0)
(scroll-bar-mode 0)

;;(iswitchb-mode 1)
(setq default-frame-alist
'((top . 0)(left . 0)(width . 108)(height . 49)))
;;(setq default-frame-alist
;;'((height . 64) (width . 160) (menu-bar-lines . 0) (tool-bar-lines . 0)(scroll-bar-lines . 0)))
;;(setq frame-title-format "☆Emacs☆      %b   ") ; 显示当前编辑的文档
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-layout-window-sizes nil)
 ;;'(ecb-options-version "2.40")
 '(fill-column 100)
 '(scroll-bar-mode nil)
 '(show-paren-mode t))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;;咆哮体，勿用
;;(font-spec :family "FZNHT" :size 36 )))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;代码风格
(setq tab-width 4)
(setq default-tab-width 4)
;;use tab or space?
(setq indent-tabs-mode t)
(setq c-basic-offset 4)
;;100字符换行
;;(setq-default fill-column 100)

;;highlight space
(load-file "~/.emacs.d/plugins/highlight-indentation.el")
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#323232")
(set-face-background 'highlight-indentation-current-column-face "#465457")


;;quickrun
(load-file "~/.emacs.d/plugins/quickrun.el")
(require 'quickrun)
(setq quickrun-timeout-seconds nil)
(global-set-key (kbd "<f12>") 'quickrun)
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)
;;flymake
(load-file "~/.emacs.d/vender/emacs-flymake/flymake.el")
;; ;; Let's run 8 checks at once instead.
(setq flymake-max-parallel-syntax-checks 8)
;; ;; Yes, I want my copies in the same dir as the original.
(setq flymake-run-in-place t)
;; ;; I want to see at most the first 4 errors for a line.
(setq flymake-number-of-errors-to-display nil)

;;(setq display-time-format “%V %m.%d/%H:%M”)
(display-time-mode 1) ; 显示时间
;;(setq display-time-24hr-format t) ; 24小时格式
;;(setq display-time-day-and-date t) ; 显示日期

(require 'cua-base)
(cua-mode)

(mouse-avoidance-mode 'animate) ; 光标移动到鼠标下时，鼠标自动弹开
(setq inhibit-startup-message t)
(setq kill-ring-max 2000)
(require 'linum)
(global-linum-mode t)

;;Haskell-mode
(load "~/.emacs.d/haskell-mode/haskell-site-file")

;;(setq default-fill-column 60)

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
(setq scroll-margin 3
      scroll-conservatively 10000)

;;(setq frame-title-format "emacs@%b")


(windmove-default-keybindings)

;;(setq show-paren-style 'parentheses)
;;(linum-mode 1)

(require 'ido)
(ido-mode t)


;;(add-to-list 'load-path
;;	     "~/.emacs.d/plugins/")
;;(require 'powerline)
;;(powerline-default)
;;(add-to-list 'load-path
;; 	     "~/.emacs.d/plugins/")
;;(require 'highlight-symbol)
;;(highlight-symbol-mode t)
;;

;;markdown-mode
(add-to-list 'load-path
	     "~/.emacs.d/plugins/markdown-mode/")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command 
   (format "open -a /Applications/Marked.app %s" 
           (shell-quote-argument (buffer-file-name))))
  )
(global-set-key "\C-cm" 'markdown-preview-file)

;;(global-set-key [(control f3)] 'highlight-symbol-at-point)
;;global-set-key [f3] 'highlight-symbol-next)
;;(global-set-key [(shift f3)] 'highlight-symbol-prev)
;;(global-set-key [(meta f3)] 'highlight-symbol-prev)

(add-to-list 'load-path 
             "~/.emacs.d/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)))

(add-to-list 'load-path
             "~/.emacs.d/slime-2013-02-05/")
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(require 'slime)
(slime-setup '(slime-fancy))


;;choose the color theme
;;(load-file “~/.emacs.d/themes/zenburn-theme.el”)
(load-file "~/.emacs.d/themes/color-theme-molokai.el")
(load-file "~/.emacs.d/themes/color-theme-blackboard.el")
;;(Color-theme-blackboard)
;;(color-theme-gnome2)
;;(color-theme-zenburn)
(color-theme-molokai)


;;dash
(add-to-list 'load-path
             "~/.emacs.d/plugins/dash-at-point")
(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)
(global-set-key (kbd "C-c C-d") 'dash-at-point)

;; (defun set-frame-size-according-to-resolution ()
;;   (interactive)
;;   (if window-system
;;       (progn
;;         ;; use 180 char wide window for largeish displays
;;         ;; and smaller 80 column windows for smaller displays
;;         ;; pick whatever numbers make sense for you
;;         (if (> (x-display-pixel-width) 1280)
;;             (add-to-list 'default-frame-alist (cons 'width 180))
;;           (add-to-list 'default-frame-alist (cons 'width 80)))
;;         ;; for the height, subtract a couple hundred pixels
;;         ;; from the screen height (for panels, menubars and
;;         ;; whatnot), then divide by the height of a char to
;;         ;; get the height we want
;;         (add-to-list 'default-frame-alist
;;                      (cons 'height (/ (- (x-display-pixel-height) 200) (frame-char-height)))))))

;; (set-frame-size-according-to-resolution)

;;透明
;;(set-frame-parameter (selected-frame) 'alpha (list 95 95))
;;(add-to-list 'default-frame-alist (cons 'alpha (list 95 95)))

;;自动缩进
;;(global-set-key (kbd "RET") 'newline-and-indent)
(load-file "~/.emacs.d/plugins/auto-indent-mode.el")
;;(setq auto-indent-on-visit-file t)
(require 'auto-indent-mode)
(auto-indent-global-mode)

;;fill-column
(load-file "~/.emacs.d/plugins/fill-column-indicator.el")
(require 'fill-column-indicator)
(fci-mode t)

;; ;;cedet
;; (add-to-list 'load-path "~/.emacs.d/cedet-1.1/common")
;; (require 'cedet)
;; (require 'semantic-ia)

;; ;; Enable EDE (Project Management) features
;; (global-ede-mode 1)

;; (semantic-load-enable-minimum-features)
;; ;;(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)
;; ;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;;ruby-tools
(add-to-list 'load-path
             "~/.emacs.d/elpa/ruby-tools-20121008.1851")
(require 'ruby-tools)

;;tabbar
;; (add-to-list 'load-path
;;              "~/.emacs.d/elpa/tabbar-20110824.1439")
;; (add-to-list 'load-path
;;              "~/.emacs.d/elpa/tabbar-ruler-20130501.1226")
;; (setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
;; ;;(setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;; (setq tabbar-ruler-popup-menu 't) ; If you want a popup menu.
;; (setq tabbar-ruler-popup-toolbar 't) ; If you want a popup toolbar

;; (require 'tabbar-ruler)

;;blank-mode
(load-file "~/.emacs.d/plugins/blank-mode.el")
(require 'blank-mode)
(setq blank-empty 'underline)

;;python
;;(add-to-list 'load-path
;;             "~/.emacs.d/plugins/python.el")
;;(require 'python)


;;textmate-mode
(add-to-list 'load-path "~/.emacs.d/vender/textmate.el")
(require 'textmate)
(textmate-mode)

;;highlight-parentheses
(load-file "~/.emacs.d/vender/highlight-parentheses.el")
(require 'highlight-parentheses)

;;whitespace
(setq whitespace-display-mappings
      ;;all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
      '(
        (space-mark 32 [183] [46]) 
        (newline-mark 10 [8629 10])
        (tab-mark 9 [187 9])
        ))

;;Never Shall you use Tabs
(setq indent-tabs-mode nil)

;; C language setting
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "bsd")
             (setq tab-width 8)
             (fci-mode)
             ;;(setq indent-tabs-mode t)
             ;; (setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))
             ;;             (whitespace-mode)
             (setq c-basic-offset 8)))
;; C++ language setting
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "bsd")
             ;;(c-toggle-auto-state)
             (setq tab-width 8)
             (fci-mode)
             ;; (setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))
             ;;(whitespace-mode)
             ;;(setq indent-tabs-mode t)
             (setq c-basic-offset 8)))
;;Ruby language setting
(add-hook 'ruby-mode-hook
          '(lambda ()
             (fci-mode)
;;             (setq whitespace-style (quote (tabs newline tab-mark newline-mark)))
             ;;             (whitespace-mode)))
             ;;(blank-mode)
             ;;(setq indent-tabs-mode t)
             (highlight-indentation-mode)))
;;Lisp language setting
(add-hook 'lisp-mode-hook
          '(lambda ()
             (setq tab-width 8)
             (auto-complete-mode t)
             (fci-mode)
             ))

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)


;;test-case-mode
(add-to-list 'load-path "~/.emacs.d/plugins/test-case-mode")
(autoload 'test-case-mode "test-case-mode" nil t)
(autoload 'enable-test-case-mode-if-test "test-case-mode")
(autoload 'test-case-find-all-tests "test-case-mode" nil t)
(autoload 'test-case-compilation-finish-run-all "test-case-mode")
(add-hook 'find-file-hook 'enable-test-case-mode-if-test)

;;SML-mode
(global-font-lock-mode t)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/sml-mode-6/"))
(autoload 'sml-mode "sml-mode" "Major mode for editing SML." t)
(autoload 'run-sml "sml-proc" "Run an inferior SML process." t)
(setq sml-program-name "/usr/local/bin/sml")
(add-to-list 'auto-mode-alist '("\\.\\(sml\\|sig\\)\\'" . sml-mode))
(defun my-sml-mode-hook () "Local defaults for SML mode"
  (setq sml-indent-level 2)
  (setq words-include-escape t)
  (setq indent-tabs-mode nil))
(add-hook 'sml-mode-hook 'my-sml-mode-hook)


;;ecb
;;(add-to-list 'load-path
;;   "~/.emacs.d/ecb-2.40/")
;;(require 'ecb)
;;(setq stack-trace-on-error nil)


;;autopari
(add-to-list 'load-path
	     "~/.emacs.d/plugins")
(require 'autopair)
(autopair-global-mode) 
(require 'auto-pair+)

;;Golang
(add-to-list 'load-path
	     "~/.emacs.d/go")
(require 'go-mode-load)

(add-to-list 'load-path
             "~/.emacs.d/elpa/popup-20130117.1954/")

(add-to-list 'load-path
             "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
;; setting dictionary directory.
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict/")

;; setup and turn on `auto-complete-mode` for various major modes
(ac-config-default)

;; resetting ac-sources
(setq-default ac-sources '(
                           ac-source-yasnippet
                           ac-source-abbrev
                           ac-source-dictionary
                           ac-source-words-in-same-mode-buffers
                           ))
(global-auto-complete-mode t)

;;(global-set-key (kbd "TAB") 'smart-tab)
(add-to-list 'load-path
             "~/.emacs.d/yasnippet/")
(require 'yasnippet)
(setq yas-snippet-dirs "~/.emacs.d/yasnippet/snippets/")
(yas-global-mode t)


;;org-mode
(add-to-list 'load-path 
             "~/.emacs.d/org-mode/lisp/")

(require 'org)                                   
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t) 

;;js2-mode
(add-to-list 'load-path
             "~/.emacs.d/plugins/js2-mode.el")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)) 

;;RSENSE
(setq rsense-home (expand-file-name "~/opt/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;;quicklisp
;;(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq inferior-lisp-program "sbcl -K utf-8")

;;weibo
(add-to-list 'load-path
             "~/.emacs.d/weibo/")
(require 'weibo)


(setenv "PATH" (concat "/usr/texbin:/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append '("/usr/texbin" "/usr/local/bin") exec-path))

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


;;autoinsert
;;首先这句话设置一个目录，你的auto-insert 的模版文件会存放在这个目录中，
(setq-default auto-insert-directory "~/.emacs.d/auto-insert/")
(auto-insert-mode)  ;;; 启用auto-insert
;; 默认情况下插入模版前会循问你要不要自动插入，这里设置为不必询问，
;; 在新建一个org文件时，自动插入`auto-insert-directory'目录下的`org-auto-insert`文件中的内容
(setq auto-insert-query nil) 
(define-auto-insert "\\.org" "org-auto-insert")
(define-auto-insert "\\.c" "c.auto")
(define-auto-insert "\\.cpp" "cpp.auto")
(define-auto-insert "\\.lisp" "cl.auto")
(define-auto-insert "\\.sml" "ml.auto")
(define-auto-insert "\\.rb" "ruby.auto")

(defadvice auto-insert  (around yasnippet-expand-after-auto-insert activate)
  "expand auto-inserted content as yasnippet templete,
  so that we could use yasnippet in autoinsert mode"
  (let ((is-new-file (and (not buffer-read-only)
                          (or (eq this-command 'auto-insert)
                              (and auto-insert (bobp) (eobp))))))
    ad-do-it
    (let ((old-point-max (point-max)))
      (when is-new-file
        (goto-char old-point-max)
        (yas/expand-snippet (buffer-substring-no-properties (point-min) (point-max)))
        (delete-region (point-min) old-point-max)
        )
      )
    )
  )
