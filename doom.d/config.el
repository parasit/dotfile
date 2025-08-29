;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/bartosz.bubak@gmail.com\ -\ Google\ Drive/Mój\ dysk/org/agendas")
;;(setq org-directory "~/org/")

(after! corfu
:custom
    (setq corfu-cycle t)
    (setq corfu-auto t)
    (setq corfu-auto-prefix 2)
    (setq corfu-auto-delay 0.25)
    (setq corfu-echo-documentation 0.25)
    (setq corfu-preview-current 'insert)
    (setq corfu-preselect-first nil)
    ;;:bind (:map corfu-map
    ;;    ("M-SPC" . corfu-insert-separator)
    ;;    ("RET" .  nil)
    ;;    ("<tab>" . corfu-next)
    ;;    ("<S-tab>" . corfu-previous)
    ;;    ("<escape>" . corfu-quit)
    ;;    ("TAB" . corfu-next)
    ;;    ("S-TAB" . corfu-previous)
    ;;    ("S-<return>" . corfu-insert)))
)


(after! ispell
(setq ispell-program-name "hunspell")
(setq ispell-hunspell-dict-paths-alist
      '(("pl_PL" "/Users/bart/Library/Spelling/pl_PL.aff")
        ("en_US" "/Users/bart/Library/Spelling/en_US.aff")))

(setq ispell-local-dictionary-alist
      '(
        ("pl_PL" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "pl_PL") nil utf-8)
        ("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
        ))
(setq ispell-local-dictionary "pl_PL,en_US")
(ispell-set-spellchecker-params)
(ispell-hunspell-add-multi-dic "pl_PL,en_US")
(setq ispell-personal-dictionary "~/.hunspell_personal")
;; The personal dictionary file has to exist, otherwise hunspell will
;; silently not use it.
(unless (file-exists-p ispell-personal-dictionary)
  (write-region "" nil ispell-personal-dictionary nil 0))

)
(setq org-directory "~/org/")
(after! org
  (setq org-agenda-files (list (expand-file-name "agendas/" org-directory)))
)
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
