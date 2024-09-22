
(after! bibtex
  (setq bibtex-completion-pdf-open-function (lambda (fpath)
                                              (call-process "open" nil 0 nil fpath))
        bibtex-completion-bibliography '("~/Dropbox/projects/library/bibliography/articles.bib" "~/Dropbox/projects/library/bibliography/books.bib")
        bibtex-completion-library-path (nth 0 bibtex-completion-bibliography) ; My PDF lib location
        bibtex-completion-notes-path "~/Dropbox/projects/org/roam")
  )

(after! org-roam
  (setq org-roam-mode-sections
        (list #'org-roam-backlinks-insert-section
              #'org-roam-reflinks-insert-section)
        org-roam-directory  "~/Dropbox/projects/org/roam"
        ;;(org-roam-db-autosync-enable)
        )
  )


(after! org-ref
  (setq bibtex-dialect 'biblatex
        )
  )

(after! citar
  (setq citar-bibliography  '("~/Dropbox/projects/library/bibliography/articles.bib"  "~/Dropbox/projects/library/bibliography/books.bib")
        citar-library-paths  '("~/Dropbox/projects/library/articles/")
        citar-file-extensions '("pdf" "org" "md")
        citar-file-open-function #'find-file
        citar-templates
        '((main . "${author editor:55}     ${date year issued:4}     ${title:55}")
          (suffix . "  ${tags keywords keywords:40}")
          (preview . "${author editor} ${title}, ${journal publisher container-title collection-title booktitle} ${volume} (${year issued date}).\n")

          (note . "# Notes on ${author editor}, ${title}"))
        citar-open-note-function 'orb-citar-edit-note
        citar-notes-paths '("~/Dropbox/projects/org/roam" ))
  (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)
  (citar-capf-setup)
  )


(after! scihub
  (setq scihub-download-directory "~/Dropbox/projects/library/articles/"
        scihub-fetch-domain 'scihub-fetch-domains-lovescihub
        )
  )
