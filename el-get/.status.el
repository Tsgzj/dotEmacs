((ace-jump-mode status "installed" recipe
                (:name ace-jump-mode :website "https://github.com/winterTTr/ace-jump-mode/wiki" :description "A quick cursor location minor mode for emacs" :type github :pkgname "winterTTr/ace-jump-mode" :features ace-jump-mode))
 (cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :load "el-get.el"))
 (expand-region status "installed" recipe
                (:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme" :features expand-region))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :compile nil :features helm-config))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (powerline status "installed" recipe
            (:name powerline :website "https://github.com/milkypostman/powerline" :depends
                   (cl-lib)
                   :description "Powerline for Emacs" :type github :pkgname "milkypostman/powerline" :load-path "." :features powerline))
 (smartparens status "installed" recipe
              (:name smartparens :description "Autoinsert pairs of defined brackets and wrap regions" :type github :pkgname "Fuco1/smartparens" :depends dash))
 (smooth-scrolling status "installed" recipe
                   (:name smooth-scrolling :description "Make emacs scroll smoothly, keeping the point away from the top and bottom of the current buffer's window in order to keep lines of context around the point visible as much as possible, whilst avoiding sudden scroll jumps which are visually confusing." :type github :pkgname "aspiers/smooth-scrolling" :features smooth-scrolling))
 (sr-speedbar status "installed" recipe
              (:name sr-speedbar :type emacswiki :description "Same frame speedbar" :post-init
                     (require 'sr-speedbar)))
 (yascroll status "installed" recipe
           (:name yascroll :description "Yet Another Scroll Bar Mode" :website "https://github.com/m2ym/yascroll-el" :type github :pkgname "m2ym/yascroll-el" :features "yascroll")))
