(defvar black-theme
  (make-instance 'theme:theme
                 :font-family "Iosevka"
                 :dark-p t
                 :background-color- "#222323"
                 :background-color "#222323"
                 :background-color+ "#1E1E2A"
                 :on-background-color "#F8F8F2"

                 :primary-color- "#A9A9A9"
                 :primary-color "#A9A9A9"
                 :primary-color+ "#A9A9A9"
                 :on-primary-color "#F8F8F2"

                 :secondary-color- "#44475A"
                 :secondary-color "#44475A"
                 :secondary-color+ "#6272A4"
                 :on-secondary-color "#F8F8F2"

                 :action-color- "#000000"
                 :action-color "#000000"
                 :action-color+ "#000000"
                 :on-action-color "#282A36"

                 :success-color- "#000000"
                 :success-color "#000000"
                 :success-color+ "#000000"
                 :on-success-color "#282A36"

                 :highlight-color- "#FF79C6"
                 :highlight-color "#FF79C6"
                 :highlight-color+ "#FF92D0"
                 :on-highlight-color "#282A36"

                 :warning-color- "#FFB86C"
                 :warning-color "#FFB86C"
                 :warning-color+ "#FFD166"
                 :on-warning-color "#282A36"

                 :codeblock-color- "#6272A4"
                 :codeblock-color "#6272A4"
                 :codeblock-color+ "#6D88E8"
                 :on-codeblock-color "#F8F8F2"
                 ))


(define-configuration (browser)
    (
     (restore-session-on-startup-p nil)
     (external-editor-program (if (member :flatpak *features*)
                                  "flatpak-spawn --host /usr/local/bin/emacsclient -c"
                                  "/usr/local/bin/emacsclient -c"))
     (theme black-theme)
     )
  )


(define-configuration status-buffer
    ((style (str:concat %slot-value%
                        (theme:themed-css (theme *browser*))))))


(define-configuration nyxt/mode/password:password-mode
    ((nyxt/mode/password:password-interface
      (make-instance 'password:password-store-interface :executable (if (member :flatpak *features*)
                                                                        "flatpak-spawn --host pass"
                                                                        "pass")))))

(define-configuration buffer
    ((default-modes
      (append (list 'nyxt/mode/password:password-mode) %slot-value%))))


(define-configuration (input-buffer)
    ((default-modes (pushnew 'nyxt/mode/vi:vi-normal-mode %slot-value%))))

(define-configuration (prompt-buffer)
    ((default-modes (pushnew 'nyxt/mode/vi:vi-insert-mode %slot-value%))))


(defvar *my-search-engines*
  (list
   '("g" "https://google.com/search?q=~a" "https://google.com")
   '("gs" "https://scholar.google.com/scholar?q=~a" "https://scholar.google.com")
   '("git" "https://github.com/search?q=~a" "https://github.com")
   '("r" "https://old.reddit.com/search?q=~a" "https://old.reddit.com")
   '("yt" "https://yewtu.be/search?q=~a" "https://yewtu.be")
   '("ax" "https://arxiv.org/search?query=~a&searchtype=all&source=header" "https://arxiv.org")
   '("arch" "https://aur.archlinux.org/packages?O=0&K=~a" "https://aur.archlinux.org")
   )
  "List of search engines.")

(define-configuration context-buffer
  "Go through the search engines above and make-search-engine out of them."
  ((search-engines
    (append
     (mapcar (lambda (engine) (apply 'make-search-engine engine))
             *my-search-engines*)
     %slot-default%))))

(define-configuration nyxt/mode/proxy:proxy-mode
    ((nyxt/mode/proxy:proxy (make-instance 'proxy
                                           :url (quri:uri "http://127.0.0.1:8080")
                                           :allowlist '("localhost" "localhost:8080")
                                           :proxied-downloads-p t))))




(setf (uiop/os:getenv "WEBKIT_DISABLE_COMPOSITING_MODE") "1")
