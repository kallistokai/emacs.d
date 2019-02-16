;; html-umlaute.el -- automatic replacement from unregular chars to html-code for Emacs
;; Copyright (C) 2001  Mirko Link

;; Author: Mirko Link <mirkolink@mirkolinkonline.de>
;; Keywords: html
;; $Revision: 1.1 $
;; $Date: 2001/07/03 07:25:33 $

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111, USA.

(defvar html-files (list "html" "htm")
  "List all file-extensions, there replace the unregular characters")

(defvar html-chars (list '("Ä" "&Auml;")
			 '("Ö" "&Ouml;")
			 '("Ü" "&Uuml;")
			 '("ä" "&auml;")
			 '("ö" "&ouml;")
			 '("ü" "&uuml;")
			 '("ß" "&szlig;"))
  "List of chars and theyr replacements. Add here new chars, if you want.")

(defun replace-unregular-chars ()
  "Search the strings, defined at `html-chars', and replace with theyr replace-string,
defined at `html-chars' too."
  (interactive)
  (let ((i 0)
	(old-case-fold-search case-fold-search))
    (save-excursion
      (setq case-fold-search nil)
      (while (< i (length html-chars))
	(message "replace all " (car (nth i html-chars)) " with " (car (cdr (nth i html-chars))))
	(goto-char 0)
	(while (search-forward (car (nth i html-chars)) nil t)
	  (replace-match (car (cdr (nth i html-chars))) t t))
	(setq i (1+ i)))
      (setq case-fold-search old-case-fold-search)))
  nil)

(defun open-html-file ()
  "Add the `replace-unregular-chars' as `local-write-file-hooks' if a html-file, defined at `html-files'"
  (let ((i 0))
    (while (< i (length html-files))
      (if (string= (file-name-extension (buffer-file-name)) (nth i html-files))
	  (add-hook 'local-write-file-hooks 'replace-unregular-chars t))
      (setq i (1+ i)))))


(defun html-umlaute-mode ()
  "Activate html-umlaute-mode: Before write a file, all unregular chars replaced with html-code."
  (add-hook 'find-file-hooks 'open-html-file))

(provide 'html-umlaute-mode)
