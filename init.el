(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq package-list
      '(youdao-dictionary
	evil))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; youdao-dictionary
(require 'youdao-dictionary)
(setq url-automatic-caching t)
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
(global-set-key (kbd "C-c t") 'youdao-dictionary-search-at-point+)

;; evil
(setq evil-toggle-key "")
(require 'evil)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(custom-set-variables
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (evil youdao-dictionary relative-line-numbers linum-relative))))
(custom-set-faces)
