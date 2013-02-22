(setq inhibit-startup-message t)
(global-unset-key "\C-x\C-b")
(cua-selection-mode) ; C-RET for visual rect selection
(show-paren-mode 1)
(setq show-paren-delay 0)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq x-select-enable-clipboard t)
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

;; stroustrup when editing c
(add-hook 'c-initialization-hook
          '(lambda ()
             (setq-default c-default-style "stroustrup")))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(delete-selection-mode 1)
(line-number-mode 1)
(global-linum-mode 1)
(setq default-tab-width 4)
(setq tab-width 4)
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")
(fset 'html-mode 'nxml-mode)
(setq inhibit-splash-screen t)
(scroll-bar-mode -1)

(custom-set-variables
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue))))

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path))

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
