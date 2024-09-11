
(setq
 frame-title-format '"\n" ; use a new-line to make sure rezising info is on the next line
 undo-limit 80000000      ; Raise undo-limit to 80Mb
 evil-want-fine-undo t ; By default while in insert all changes are one big blob. Be more granular
 auto-save-default t   ; Nobody likes to loose work, I certainly don't
 truncate-string-ellipsis "…" ; Unicode ellispis are nicer than "...", and also save /precious/ space
 display-line-numbers-type 'relative
 which-key-idle-delay 0.3               ; Show key binding help quicker
 +workspaces-on-switch-project-behavior t
 evil-vsplit-window-right t
 evil-split-window-below t
 show-trailing-whitespace t
 which-key-idle-secondary-delay 0
 doom-theme 'doom-one
 doom-font (font-spec :family "IosevkaTerm" :size 22 :weight 'Semibold)
 doom-variable-pitch-font (font-spec :family "IosevkaTerm" :size 20)
 doom-symbol-font (font-spec :family "JuliaMono")
 doom-fallback-buffer-name "*dashboard*"

 ;; fancy-splash-image "~/.config/doom/misc/splash/emacs.svg"
 )


;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)

;; (doom/set-frame-opacity 50)
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic)
  )

;; (after! all-the-icons
;;   (setq all-the-icons-scale-factor 1.2))

(after! doom-themes
  (setq
   doom-themes-enable-bold t
   doom-themes-enable-italic t))

(after! centaur-tabs
  (centaur-tabs-mode)
  (centaur-tabs-group-by-projectile-project)
  (setq centaur-tabs-set-bar 'over
        centaur-tabs-set-icons t
        centaur-tabs-gray-out-icons 'buffer
        centaur-tabs-height 24
        centaur-tabs-set-modified-marker t
        centaur-tabs-style "slant"
        centaur-tabs-modified-marker "•"))


(use-package! dashboard
  :init (add-hook 'dashboard-mode-hook (lambda () (setq show-trailing-whitespace nil)))
  :custom
  (dashboard-set-navigator t)
  (dashboard-center-content t)
  (dashboard-set-file-icons t)
  (dashboard-display-icons-p t)
  (dashboard-set-heading-icons t)
  (dashboard-image-banner-max-height 250)
  (dashboard-banner-logo-title "[ S C I E N T I A 🔱 V I N C E S]" ) ; [Ποσειδον 🔱 εδιτορ]
  (dashboard-startup-banner "~/.config/doom/misc/splash/emacs_splash.png" )
  :config
  (dashboard-setup-startup-hook)
  (setq
   dashboard-navigator-buttons
   `(;; line1

     (
      (, ""
         "GitHub"
         "Browse homepage"
         (lambda (&rest _) (browse-url "https://github.com/Occhima/")) nil "[ " " ]")

      (, ""
         "HackTheBox"
         "Access HackTheBox"
         (lambda (&rest _) (browse-url "https://app.hackthebox.com/home")) nil "[ " " ]")

      (, ""
         "Numerai"
         "Access Numerai"
         (lambda (&rest _) (browse-url "https://numer.ai")) nil "[ " " ]")

      )

     ;; ;; line 2
     ;; Empty line
     (("" "\n" "" nil nil "" ""))

     ((, "  "
         "Find file" nil
         (lambda (&rest _) (find-file)) nil "" "            SPC f f"))

     ((, "  "
         "Open project" nil
         (lambda (&rest _) (projectile-switch-project)) nil "" "         SPC p p"))

     ((, "  "
         "Open Agenda" nil
         (lambda (&rest _) (org-agenda)) nil "" "         SPC o A"))

     ((, "  "
         "Open Doom Config" nil
         (lambda (&rest _) (org-agenda)) nil "" "         SPC f p"))

     )

   )

  (setq
   dashboard-projects-backend 'projectile
   dashboard-projects-switch-function 'projectile-switch-project
   dashboard-items '((recents        . 3)
                     (projects       . 2)
                     (bookmarks      . 2)
                     ;; (agenda         . 2)
                     (registers      . 2)
                     )
   initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))
   )

  ) ; "#f1fa8c"

                                        ; Golden ration
                                        ;

;; (golden-ratio-mode)
