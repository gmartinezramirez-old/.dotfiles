;; Set personal information
(setq user-full-name "Gonzalo Martinez Ramirez")
(setq user-mail-adress "gmartinezramirez@gmail.com")

;; Package Management
(load "package")
(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-archive-enable-alist '(("melpa" deft magit)))
(defvar gmartinez/packages '(magit
			     evil
			     moe-theme 
			     multiple-cursors
			     nlinum
			     projectile
			     smart-mode-line
			     org)
  "Default packages")

(defun gmartinez/packages-installed-p ()
  (cl-loop for pkg in gmartinez/packages
	when (not (package-installed-p pkg)) do (cl-return nil)
	finally (cl-return t)))

(unless (gmartinez/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg gmartinez/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; ;; Start-up options
;; Splash screen, Default org-mode
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;; Marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; Remove Scroll bar, Tool bar, and Menu bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Dont create backup files
(setq make-backup-files nil)

;; Automatically switch between moe-dark and moe-light according to the time
(require 'moe-theme-switcher)
;; Santiago, Chile
(setq calendar-latitude -33.447487)
(setq calendar-longitude -70.673676)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cl" 'org-agenda)
(setq org-log-done t)
(setq org-directory "~/Dropbox/notes/")

;; Plugins config
(evil-mode t)
