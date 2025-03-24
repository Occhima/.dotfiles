(use-package! copilot
  :defer t
  :bind (
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map copilot-completion-map
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)))


(use-package! chatgpt-shell
  :defer t
  )

(use-package! khoj
  :defer t
  :if (modulep! :tools ai +khoj)
  :config
  (map!
   :localleader
   :n "k" #'khoj)
  )

(use-package! gptel
  :defer t
  ;; :if (modulep! :tools ai +khoj)
  )

(use-package! aider
  :defer t
  )
