(setq inhibit-startup-message t)
(global-unset-key "\C-z")
(cua-selection-mode 1) ; C-RET for visual rect selection
(show-paren-mode 1)
(setq show-paren-delay 0)

(if window-system
    (progn
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

(setq x-select-enable-clipboard t)
(global-linum-mode 1)

(setq user-mail-address "thang@ccs.neu.edu")
(setq make-backup-files nil)
(server-start)
(column-number-mode t)
(ido-mode t)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; set indentation to 4 when editing in python
(add-hook 'python-mode-hook
          '(lambda ()
             (setq-default python-indent 4)))

(add-hook 'sql-mode-hook
          '(lambda ()
             (setq-default sql-indent 4)))

;; stroustrup when editing c
(add-hook 'c-initialization-hook
          '(lambda ()
             (setq-default c-default-style "stroustrup")))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(delete-selection-mode 1)
(line-number-mode 1)

(setq default-tab-width 2)
(setq tab-width 2)
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")
(fset 'html-mode 'nxml-mode)
(setq inhibit-splash-screen t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ((#("/" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) #("/" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu"))))))
 '(js-indent-level 2))

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path))

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(defun get-abs-path ()
  "Get the absolute path of the current working buffer, including filename and place it into the kill ring"
  (interactive)
  (kill-new (buffer-file-name)))

(global-set-key [f5] 'get-abs-path)

(add-to-list 'auto-mode-alist '("\\.adp\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.vcl\\'" . vcl-mode))

(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

(defun save-all ()
    (interactive)
    (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)

;; Trying a larger font for a bit
(set-face-attribute 'default (selected-frame) :height 150)
(setq org-support-shift-select t)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(setq package-enable-at-startup nil)

;; Stolen from http://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'auto-complete 'helm)

;; Package Specific schtuff
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key "\C-x\C-b" 'helm-buffers-list)
(global-auto-complete-mode t)
(helm-mode 1)
