(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)


(setq make-backup-files nil)
(setq inhibit-startup-message t)
(global-linum-mode 1) ; always show line numbers
(setq linum-format "%4d \u2502")  ;set format
(global-visual-line-mode 1)
(global-set-key (kbd "C-SPC") 'nil)
(global-set-key (kbd "M-SPC") 'set-mark-command)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'evil)
(evil-mode 1)
(defun org-mode-my-init ()
  (define-key org-mode-map (kbd "×") (kbd "*"))
  (autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
  (autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)
  ;; (define-key org-mode-map (kbd "－") (kbd "-"))
  )
(add-hook 'org-mode-hook 'org-mode-my-init)
;;(set-fontset-font "fontset-default" 'unicode"WenQuanYi Zen Hei Mono 14") ;;for linux
(setq auto-save-mode nil) ;;关闭自动保存模式
(setq auto-save-default nil) ;;不生成 #filename# 临时文件

(ispell-change-dictionary "american" t)
(add-to-list 'load-path "~/rcfiles/lisp")

(setq org-agenda-files (list "~/org/work.org"
                             "~/org/study.org"
                             "~/org/home.org"))

;;org-mode export to latex
(require 'ox-latex)
(setq org-export-latex-listings t)

;;org-mode source code setup in exporting to latex
(add-to-list 'org-latex-listings '("" "listings"))
(add-to-list 'org-latex-listings '("" "color"))

(add-to-list 'org-latex-packages-alist '("" "xcolor" t))
(add-to-list 'org-latex-packages-alist '("" "listings" t))
(add-to-list 'org-latex-packages-alist '("" "fontspec" t))
(add-to-list 'org-latex-packages-alist '("" "indentfirst" t))
(add-to-list 'org-latex-packages-alist '("" "xunicode" t))
(add-to-list 'org-latex-packages-alist '("" "geometry"))
(add-to-list 'org-latex-packages-alist '("" "float"))
(add-to-list 'org-latex-packages-alist '("" "longtable"))
(add-to-list 'org-latex-packages-alist '("" "tikz"))
(add-to-list 'org-latex-packages-alist '("" "fancyhdr"))
(add-to-list 'org-latex-packages-alist '("" "textcomp"))
(add-to-list 'org-latex-packages-alist '("" "amsmath"))
(add-to-list 'org-latex-packages-alist '("" "tabularx" t))
(add-to-list 'org-latex-packages-alist '("" "booktabs" t))
(add-to-list 'org-latex-packages-alist '("" "grffile" t))
(add-to-list 'org-latex-packages-alist '("" "wrapfig" t))
(add-to-list 'org-latex-packages-alist '("normalem" "ulem" t))
(add-to-list 'org-latex-packages-alist '("" "amssymb" t))
(add-to-list 'org-latex-packages-alist '("" "capt-of" t))
(add-to-list 'org-latex-packages-alist '("figuresright" "rotating" t))
(add-to-list 'org-latex-packages-alist '("Lenny" "fncychap" t))
;; Use XeLaTeX to export PDF in Org-mode
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        ;;"biber %b" "xelatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}
\\usepackage[slantfont, boldfont]{xeCJK}
\\usepackage{titlesec}
\\usepackage{hyperref}

[NO-DEFAULT-PACKAGES]
[PACKAGES]

\\parindent 2em

%如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
\\defaultfontfeatures{Mapping=tex-text}

% 中文断行
\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

[EXTRA]
"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass{beamer}
\\usepackage[slantfont, boldfont]{xeCJK}
\\usepackage[none]{hyphenat}
\\usepackage[abs]{overpic}

[NO-DEFAULT-PACKAGES]
[PACKAGES]

\\parindent 2em

%如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
\\defaultfontfeatures{Mapping=tex-text}

% 中文断行
\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

[EXTRA]
"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

