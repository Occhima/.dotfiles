
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
 doom-theme 'doom-monokai-classic
 ;; doom-theme 'srcery
 doom-font (font-spec :family "IosevkaTerm" :size 22 :weight 'Semibold)
 doom-variable-pitch-font (font-spec :family "IosevkaTerm" :size 20)
 doom-symbol-font (font-spec :family "JuliaMono")
 doom-fallback-buffer-name "*dashboard*"
 fancy-splash-image "~/.config/doom/misc/splash/xemacs_color.svg"
 )



;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)

;; (doom/set-frame-opacity 50)
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic)
  )


(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(add-hook '+doom-dashboard-function #'doom-dashbo)
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


                                        ; Golden ration
                                        ;

;; (golden-ratio-mode)
