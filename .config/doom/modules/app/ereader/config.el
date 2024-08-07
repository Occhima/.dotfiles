
(use-package! nov
  :mode ("\\.epub\\'" . nov-mode)
  :hook (nov-mode . mixed-pitch-mode)
  :hook (nov-mode . visual-line-mode)
  :hook (nov-mode . visual-fill-column-mode)
  :config
  (setq nov-text-width t)
  (setq nov-variable-pitch nil))


(use-package! calibredb
  :defer t
  :config
  (map! :map calibredb-show-mode-map
        "v" #'calibredb-view
        )
  )
