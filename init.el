;; RTTS emacs rc file
;;
;;
;; lookat http://tuhdo.github.io/c-ide.html
;; then
;; http://syamajala.github.io/c-ide.html
;; then maybe
;; https://github.com/Golevka/emacs-clang-complete-async
;;
;;




(set-face-attribute 'default nil :font "-misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso10646-1" )

(desktop-save-mode 1)
;; RTT make it load the current desktop from the current directory
(setq desktop-path '("./"))

;;RTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
;;RTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
;;RTT START ---> load melpa stuff
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
;;RTT END---> proxy stuff from http://stackoverflow.com/questions/10787087/use-elpa-emacs-behind-proxy-requiring-authentication
;;RTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
;;RTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)


; start auto-complete with emacs
(require 'auto-complete)
;;; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  ;; auto complete comment to make flycheck happy
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include/c++")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include/c++/x86_64-pc-cygwin")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include/c++/backward")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/include")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-cygwin/6.3.0/../../../../lib/../include/w32api")
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)



;;;; ;;(add-to-list 'load-path (concat myoptdir "AC"))
;;;; (require 'auto-complete-config)
;;;; ;;(add-to-list 'ac-dictionary-directories (concat myoptdir "AC/ac-dict"))
;;;; 
;;;; (require 'auto-complete-clang)
;;;; 
;;;; (setq ac-auto-start nil)
;;;; (setq ac-quick-help-delay 0.5)
;;;; ;; (ac-set-trigger-key "TAB")
;;;; ;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;;;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;;;; 
;;;; (ac-config-default)
;;;; 
;;;; (defun my-ac-config ()
;;;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;;;   (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;;; ;;  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;;; ;;  (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;;; ;;  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;;;   (global-auto-complete-mode t))
;;;; 
;;;; (defun my-ac-cc-mode-setup ()
;;;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;;;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;;;; ;; ac-source-gtags
;;;; (my-ac-config)
;;;; 
;;;; (setq ac-clang-flags
;;;;       (mapcar (lambda (item)(concat "-I" item))
;;;;               (split-string "
;;;; /usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include/c++
;;;; /usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include/c++/x86_64-pc-cygwin
;;;; /usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include/c++/backward
;;;; /usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include
;;;; /usr/local/include
;;;; /usr/include
;;;; /usr/lib/gcc/x86_64-pc-cygwin/6.3.0/../../../../lib/../include/w32api
;;;; "
;;;; )))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(package-selected-packages
   (quote
    (buffer-move cmake-ide company irony rtags bash-completion auto-complete-clang auto-complete-c-headers flycheck iedit yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(global-set-key (kbd "<f8>") 'undo)    ; F8 undo RTT
(global-set-key (kbd "M-o") 'other-window)    ; m-o other


; Fix iedit bug in Mac and cygwin
(define-key global-map (kbd "C-c ;") 'iedit-mode)

(horizontal-scroll-bar-mode 1)
(window-divider-mode 1)
(toggle-truncate-lines 1)

;; window layout undo buffer
(winner-mode 1)


; turn on Semantic
(semantic-mode 1)

; start auto-complete-clang with emacs
;;(require 'auto-complete-clang)


; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

; emacs development environment mode
(global-ede-mode t)

;;(ede-cpp-root-project "rtt_mlssa" :file "/cygdrive/c/RTT_MLSSA/rtt_2.cpp"
;;		      :include-path '("/."))
; you can use system-include-path for setting up the system header file locations.
; turn on automatic reparsing of open buffers in semantic
;(global-semantic-idle-scheduler-mode 1)
(put 'scroll-left 'disabled nil)

;; RTT line  numbers on by default
(global-linum-mode t)

;; RTT truncate  lines by default

(add-hook 'diff-mode-hook (lambda () (setq truncate-lines t)))
(add-hook 'c++-mode-hook (lambda () (setq truncate-lines t)))
(add-hook 'c-mode-hook (lambda () (setq truncate-lines t)))


;; SUBLIMITY SCROLL BAR - doesnt work properly
;;(load-file "~/.emacs.d/sublimityRTT/sublimity.el")
;;(load-file "~/.emacs.d/sublimityRTT/sublimity-scroll.el")
;;(load-file "~/.emacs.d/sublimityRTT/sublimity-map.el")
;;(load-file "~/.emacs.d/sublimityRTT/sublimity-attractive.el")
;;
;;(require 'sublimity)
;;(require 'sublimity-scroll)
;;(require 'sublimity-map) ;; experimental
;;(require 'sublimity-attractive)

(setq ac-quick-help-delay 0.2)

(require 'flycheck)

(global-flycheck-mode)

(global-set-key (kbd "M-g r") 'rtags-find-symbol-at-point)

(load-file "~/.emacs.d/dogturd/doctor.el")

(provide 'init)


(require 'rtags) ;; optional, must have rtags installed


(defun my:cmake_ide_RTT_init ()
  ;;;cmake ide include and symbol include directpoy list
  (add-to-list 'cmake-ide-flags-c++ '"/usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include/c++")
  (add-to-list 'cmake-ide-flags-c++ '"/usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include/c++/x86_64-pc-cygwin")
  (add-to-list 'cmake-ide-flags-c++ '"/usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include/c++/backward")
  (add-to-list 'cmake-ide-flags-c++ '"/usr/lib/gcc/x86_64-pc-cygwin/6.3.0/include")
  (add-to-list 'cmake-ide-flags-c++ '"/usr/local/include")
  (add-to-list 'cmake-ide-flags-c++ '"/usr/include")
  (add-to-list 'cmake-ide-flags-c++ '"/usr/lib/gcc/x86_64-pc-cygwin/6.3.0/../../../../lib/../include/w32api")
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:cmake_ide_RTT_init)
(add-hook 'c-mode-hook 'my:cmake_ide_RTT_init)

(cmake-ide-setup)

(require 'buffer-move) ;; optional, must have rtags installed
(global-set-key (kbd "M-g <up>")     'buf-move-up)
(global-set-key (kbd "M-g <down>")   'buf-move-down)
(global-set-key (kbd "M-g <left>")   'buf-move-left)
(global-set-key (kbd "M-g <right>")  'buf-move-right)
;;(global-set-key (kbd "C-S-right") 'buf-move-right)    ; F8 undo RTT
;;(global-set-key (kbd "C-S-left") 'buf-move-left)    ; F8 undo RTT
;;(global-set-key (kbd "C-S-up") 'buf-move-up)    ; F8 undo RTT
;;(global-set-key (kbd "C-S-down") 'buf-move-down)    ; F8 undo RTT

;;;(setq yow-file "~/.emacs.d/yow_file_zippy_pinhead_quotes.txt.gz" )
;;; init.el ends here
