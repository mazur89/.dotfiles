;; ----------------
;; INSTALL PACKAGES
;; ----------------

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(setq package-list
      '(better-defaults
        zenburn-theme
        elpy
        flycheck
        material-theme
        smex
        auctex))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; ----------------
;; GENERAL SETTINGS
;; ----------------

;; enable windmove
(when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))

;; enable line numbers
(line-number-mode 1)
(global-linum-mode 1)

;; disable menu, scroll and toolbar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; replace selection rather than append
(delete-selection-mode 1)

;; make copy and paste use xsel
(load-file "~/.emacs.d/copypaste.el")

;; load ido-mode for buffer and file opening
(load-file "~/.emacs.d/ido-settings.el")

;; disable lockfiles .#file# etc
(setq create-lockfiles nil)

;; disable autosave files file.ext~ etc
(setq auto-save-default nil)

;; AucTex standard
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

;; AucTex -shell-escape for minted
(eval-after-load "tex"
  '(progn
     (add-to-list
      'TeX-engine-alist
      '(default-shell-escape "Default with shell escape"
     "pdftex -shell-escape"
     "pdflatex -shell-escape"
     ConTeXt-engine))
     (setq-default TeX-engine 'default-shell-escape)
     ))

;; elpy
(elpy-enable)

;; flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; sensible-defaults
(load-file "~/.emacs.d/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

;; buffer change
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; line length
(setq whitespace-style '(lines))
(setq whitespace-line-column 78)
(global-whitespace-mode 1)

;; smex (command auto-complete)
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; theme
(load-theme 'material t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(package-selected-packages
   (quote
    (material-theme zenburn-theme smex lua-mode haskell-mode better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
