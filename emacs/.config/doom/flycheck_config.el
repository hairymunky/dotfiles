;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

(setq confirm-kill-emacs nil)
(global-auto-revert-mode t)
(add-hook! 'org-mode-hook #'+org-pretty-mode #'mixed-pitch-mode)
(add-hook! 'org-mode-hook (company-mode -1))
(add-hook! 'org-capture-mode-hook (company-mode -1))


(setq baby-blue '("#d2ecff" "#d2ecff" "brightblue"))
(setq gk/font-mono "JetBrainsMono NFM")

(setq
      user-full-name "Graham Kerr"
      user-mail-address "hairymunky@gmail.com"
      doom-font (font-spec :family gk/font-mono :size 14)
      doom-big-font (font-space :family gk/font-mono :size 20)
      doom-theme 'doon-outrun-electric
      projectile-project-search-path '("~/Projects/" "~/.dotfiles/")
      default-directory "~"
      display-line-numbers-type 'relative
      web-mode-markup-indent-offset 2
      web-mode-code-indent-offset 2
      web-mode-css-indent-offset 2
      org-directory "~/Org/"
      org-ellipsis " ▾ "
      org-bullets-bullet-list '("·")
      org-tags-column -80
      org-agenda-files (ignore-errors (directory-files +org-dir t "\\.org$" t))
      org-log-done 'time
      css-indent-offset 2
      org-refile-targets (quote ((nil :maxlevel . 1)))
      org-capture-templates '(("x" "Note" entry
                               (file+olp+datetree "journal.org")
                               "**** [ ] %U %?" :prepend t :kill-buffer t)
                              ("t" "Task" entry
                               (file+headline "tasks.org" "Inbox")
                               "* [ ] %?\n%i" :prepend t :kill-buffer t))
      +org-capture-todo-file "tasks.org"
      org-super-agenda-groups '((:name "Today"
                                 :time-grid t
                                 :scheduled today)
                                (:name "Due today"
                                       :deadline today)
                                (:name "Important"
                                       :priority "A")
                                (:name "Overdue"
                                       :deadline past)
                                (:name "Due soon"
                                       :deadline future)
                                (:name "Big Outcomes"
                                       :tag "bo")))

(after! org
  (set-face-attribute 'org-link nil
                      :weight 'normal
                      :background nil)
  (set-face-attribute 'org-code nil
                      :foreground "#a9a1e1"
                      :background nil)
  (set-face-attribute 'org-date nil
                      :foreground "#5B6268"
                      :background nil)
  (set-face-attribute 'org-level-1 nil
                      :foreground "steelblue2"
                      :background nil
                      :height 1.2
                      :weight 'normal)
  (set-face-attribute 'org-level-2 nil
                      :foreground "slategray2"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-3 nil
                      :foreground "SkyBlue2"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-4 nil
                      :foreground "DodgerBlue2"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-5 nil
                      :weight 'normal)
  (set-face-attribute 'org-level-6 nil
                      :weight 'normal)
  (set-face-attribute 'org-document-title nil
                      :foreground "SlateGray1"
                      :background nil
                      :height 1.75
                      :weight 'bold)
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))
(setq +magit-hub-features t)

(set-popup-rule! "^\\*Org Agenda" :side 'bottom :size 0.90 :select t :ttl nil)
(set-popup-rule! "^CAPTURE.*\\.org$" :side 'bottom :size 0.90 :select t :ttl nil)
(set-popup-rule! "^\\*org-brain" :side 'right :size 1.00 :select t :ttl nil)
