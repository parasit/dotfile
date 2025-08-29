(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (list "~/google-drive-bartosz.bubak/org/agendas/"))
 '(org-default-notes-file "/google-drive-bartosz.bubak/org/notes.org")
 '(python-shell-exec-path '("./venv/bin/")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(with-eval-after-load 'ox-latex
(setq org-latex-with-hyperref nil)
(add-to-list 'org-latex-classes
             '("org-plain-latex"
               "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
 ;;   '("/Users/bart/org/agendas/agenda.org" "/Users/bart/org/agendas/agenda_domowa.org" "/Users/bart/org/agendas/agenda_testowa.org" "/Users/bart/org/agendas/archiwum-domowe.org" "/Users/bart/org/agendas/archiwum.org" "/Users/bart/org/agendas/from-mobile.org" "/Users/bart/org/agendas/test.org" "/Users/bart/org/agendas/urodziny.org")))
