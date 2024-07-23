
;; config.el -*- lexical-binding: t; -*

;; Code:




(load! "elisp/+ui")
(load! "elisp/+prog")
(load! "elisp/+org")
(load! "elisp/+apps")
(load! "elisp/+academic")
(load! "elisp/+misc")
(load! "elisp/+functions")
(load! "elisp/+keybindings")


(setq user-full-name "Marco Occhialini"
      base-dir "~/Dropbox"
      user-mail-address "marcoocchialini@usp.br"
      command-line-default-directory "~/"
      delete-by-moving-to-trash t
      +lookup-provider-url-alist
      '(("Doom Emacs issues" "https://github.com/hlissner/doom-emacs/issues?q=is%%3Aissue+%s")
        ("DuckDuckGo"        +lookup--online-backend-duckduckgo "https://duckduckgo.com/?q=%s")
        ("StackOverflow"     "https://stackoverflow.com/search?q=%s")
        ("Github"            "https://github.com/search?ref=simplesearch&q=%s")
        ("Youtube"           "https://youtube.com/results?aq=f&oq=&search_query=%s")
        ("MDN"               "https://developer.mozilla.org/en-US/search?q=%s")
        ("Arch Wiki"         "https://wiki.archlinux.org/index.php?search=%s&title=Special%3ASearch&wprov=acrw1")
        ("AUR"               "https://aur.archlinux.org/packages?O=0&K=%s"))
      trash-directory "~/.local/share/Trash/files")               ; Compile the vterm-module when needed without asking


;; (server-start)












;;