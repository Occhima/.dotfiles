(defun load-assets-directory (directory read-function)
  (mapcar (lambda (i)
            (setf (gethash (file-namestring i) *static-data*)
                  (funcall read-function i)))
          (uiop:directory-files directory)))

(load-assets-directory
 (asdf:system-relative-pathname :invader "")
 #'alexandria:read-file-into-string)

(defvar invader-theme
  (make-instance 'theme:theme
                 :dark-p t
                 :background-color- "#282A36"
                 :background-color "#282A36"
                 :background-color+ "#1E1E2A"
                 :on-background-color "#F8F8F2"

                 :primary-color- "#BD93F9"
                 :primary-color "#BD93F9"
                 :primary-color+ "#B58AFE"
                 :on-primary-color "#F8F8F2"

                 :secondary-color- "#44475A"
                 :secondary-color "#44475A"
                 :secondary-color+ "#6272A4"
                 :on-secondary-color "#F8F8F2"

                 :action-color- "#50FA7B"
                 :action-color "#50FA7B"
                 :action-color+ "#8BE9FD"
                 :on-action-color "#282A36"

                 :success-color- "#50FA7B"
                 :success-color "#50FA7B"
                 :success-color+ "#8BE9FD"
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

(define-configuration browser
    ((theme invader-theme)))

(define-configuration status-buffer
    ((style (str:concat %slot-value%
                        (theme:themed-css (theme *browser*))))))

(in-package :nyxt)

(define-internal-page-command-global new ()
  (buffer "*New buffer*")
  "Display a page suitable as `default-new-buffer-url'."
  (spinneret:with-html-string
      (:nstyle
       `(body
         :min-height "100vh"
         :background ,(format nil "url('data:image/svg+xml;base64,~a')"
                              (cl-base64:string-to-base64-string (gethash "tiling-frame.svg" *static-data*)))
         :background-size "cover"
         :overflow "hidden"
         :padding "0"
         :margin "0")
       `(nav
         :text-align "center")
       `(.container
         :padding-top "32px"
         :display "flex"
         :flex-direction "row"
         :justify-content "center")
       `(.button
         :background-color ,theme:secondary
         :border-color ,theme:secondary
         :color ,theme:on-secondary
         :min-width "144px")
       `(.copyright
         :position "absolute"
         :bottom "12px"
         :right "48px")
       `(.program-name
         :color ,theme:action
         :font-size "24px"
         :font-weight "bold")
       `(.main
         :margin-top "35vh"
         :display "flex"
         :flex-direction "row"
         :width "900px")
       `(.logo
         :margin-top "-35px"
         :margin-right "10px")
       `(.set-url
         :min-width "180px"
         :height "40px"
         :color ,theme:on-action
         :background-color ,theme:action
         :border "none"
         :border-width "2px"
         :border-radius "3px"
         :margin-bottom "17px")
       `(.execute-command
         :min-width "180px"
         :line-height "12px"
         :height "40px"
         :border "none"
         :background-color ,theme:primary
         :border-color ,theme:primary
         :color ,theme:on-primary)
       `(.binding
         :margin-left "12px"
         :font-weight "bold"
         :color ,theme:secondary)
       `(".tentacle svg"
         :display "inline-block"
         :height "48px"
         :padding-top "4px"
         :padding-left "10px"
         :margin-bottom "-16px"))
    (:div
     :class "container"
     (:main
      (:nav
       (:nbutton :text "Quick-Start"
                 '(quick-start))
       (:a :class "button" :href (nyxt-url 'describe-bindings)
           :title "List all bindings for the current buffer."
           "Describe-Bindings")
       (:a :class "button" :href (nyxt-url 'manual)
           :title "Full documentation about Nyxt, how it works and how to configure it."
           "Manual")
       (:a :class "button" :href (nyxt-url 'common-settings)
           :title "Switch between Emacs/vi/CUA key bindings, set home page URL, and zoom level."
           "Settings"))
      (:div :class "main"
            (:div :class "logo" (:raw (gethash "squid-head.svg" *static-data*)))
            (:div
             (:div (:nbutton :class "set-url" :text "Set-URL"
                             '(set-url :prefill-current-url-p nil))
                   (:span :class "binding"
                          (format nil "(~a)" (nyxt::binding-keys 'set-url)))
                   (:span :class "tentacle"
                          (:raw (gethash "upper-tentacle.svg" *static-data*))))
             (:div (:nbutton :class "execute-command" :text "Execute-Command"
                             '(execute-command))
                   (:span :class "binding"
                          (format nil "(~a)" (nyxt::binding-keys 'execute-command)))
                   (:span :class "tentacle"
                          (:raw (gethash "lower-tentacle.svg" *static-data*)))))))
     (:p :class "copyright"
         (:span :class "program-name" "Nyxt")
         (format nil " ~a (~a)" +version+ (name *renderer*))
         (:br)
         (format nil "Atlas Engineer, 2018-~a" (time:timestamp-year (time:now)))))))
