;; Hairymunkys personal emacs config
;; Borrowed from many places on the interwebs... systemcrafters yay!

;; First up, keep all customizations elsewhere, dont clutter our config!
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Give us a blank window plz
(setq inhibit-startup-message t)

;; Setup the GUI
(scroll-bar-mode -1)	
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)	; Some padding around the window
(menu-bar-mode -1)
(setq visible-bell t)
(set-face-attribute 'default nil :font "JetBrainsMono NFM" :height 130)
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for shells, orgmode
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))



(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; init packages
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package swiper)

(use-package ivy
	     :diminish
	     :bind (("C-s" . swiper)
		    :map ivy-minibuffer-map
		    ("TAB" . ivy-alt-done)
		    ("C-l" . ivy-alt-done)
		    ("C-j" . ivy-next-line)
		    ("C-k" . ivy-previous-line)
		    :map ivy-switch-buffer-map
		    ("C-k" . ivy-previous-line)
		    ("C-l" . ivy-done)
		    ("C-d" . ivy-switch-buffer-kill)
		    :map ivy-reverse-i-search-map
		    ("C-k" . ivy-previous-line)
		    ("C-d" . ivy-reverse-i-search-kill))
	     :config
	     (ivy-mode 1))

(use-package nerd-icons)
(use-package doom-modeline
	     :ensure t
	     :init (doom-modeline-mode 1)
	     :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-one-light))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))


(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package general
  :config
  (general-create-definer hairymunky/leader-keys
			  :keymaps '(normal insert visual emacs)
			  :prefix "SPC"
			  :global-prefix "C-SPC")

  (hairymunky/leader-keys
   "t" '(:ignore t :which-key "toggles")
   "tt" '(counsel-load-theme :which-key "choose theme")))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
	  "scale text"
	  ("j" text-scale-increase "in")
	  ("k" text-scale-decrease "out")
	  ("f" nil "finished" :exit t))

(hairymunky/leader-keys
 "ts" '(hydra-scale/body :which-key "scale text"))
