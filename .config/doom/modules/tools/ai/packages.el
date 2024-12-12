
(package! chatgpt-shell
  :recipe  (:host github :repo "xenodium/chatgpt-shell")
  )

(package! gptel
  )

(package! aider :recipe (:host github :repo "tninja/aider.el" :files ("*.el")))


(package! copilot
  :disable t
  :recipe (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))

(package! khoj
  :disable t
  )
