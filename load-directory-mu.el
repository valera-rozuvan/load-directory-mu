;;; load-directory-mu.el --- Load all ".el" files in a directory, and sub-dirs.
;;
;; Copyright (C) 2014 Emanuele Tomasi, all rights reserved.
;; Copyright (C) 2015 Valera Rozuvan, all rights reserved.
;;
;; Author: Valera Rozuvan <valera dot rozuvan at gmail dot com>
;; Created: 14 March 2014. (as a utility function)
;;           1 June  2015. (packaged as library `load-directory-mu.el')
;; Keywords: load directory recursively
;; Revision: $Id$
;; URL: https://github.com/valera-rozuvan/load-directory-mu/blob/master/load-directory-mu.el
;; GitHub: https://github.com/valera-rozuvan/load-directory-mu
;; Version: 1.0
;; Contributed by:
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


;;; Commentary:
;;
;; Overview
;; ========
;; This library provides functionality to load recursively all ".el" files
;; contained in a specified directory (along with all files in
;; sub-directories).
;;
;; Original functionality was written by Emanuele Tomasi as a discussion
;; for improving `recursive-subdirs' routine. Please see:
;;
;;  http://www.emacswiki.org/emacs/DotEmacsModular
;;
;; The library has been called `load-directory-mu' so as not to confuse it
;; with other libraries that offer more functionality. For example take a
;; look at:
;;
;;  http://www.cb1.com/~john/computing/emacs/lisp/basics/load-directory.el
;;
;; "mu" in `load-directory-mu' stands for the Greek letter /mu:/. In physics
;; this letter represents the concept of "reduced mass". This library is
;; a "reduced version" of it's bigger implementations = )
;;
;; INSTALLING
;; ==========
;; To install this library, save this file to a directory in your
;; `load-path' (you can view the current `load-path' using "C-h v
;; load-path" within Emacs), then add the following line to your
;; .emacs start up file:
;;
;;    (require 'load-directory-mu)
;;
;; USING
;; =====
;; For example, suppose your "~/.emacs.d" directory has the following structure:
;;
;;  $> tree .emacs.d/
;;  .emacs.d/
;;  |-- config/
;;  |   |-- completion.el
;;  |   |-- control-version.el
;;  |   |-- external-command-whole-buffer.el
;;  |   |-- highligth-current-line.el
;;  |   |-- modes/
;;  |   |   |-- flymake-mode.el
;;  |   |   |-- markdown-mode.el
;;  |   |   |-- po-mode.el
;;  |   |   |-- programming/
;;  |   |   |   |-- c-mode.el
;;  |   |   |   |-- css-mode.el
;;  |   |   |   |-- global.el
;;  |   |   |   |-- js-mode.el
;;  |   |   |   |-- perl-mode.el
;;  |   |   |   |-- php-mode.el
;;  |   |   |   |-- python-mode.el
;;  |   |   |   |-- sh-mode.el
;;  |   |   |   `-- yasnippet.el
;;  |   |   |-- xml-mode.el
;;  |   |   `-- yaml-mode.el
;;  |   |-- rename-frame.el
;;  |   |-- revert-all-buffers.el
;;  |   |-- sh.el
;;  |   `-- windows.el
;;  `-- load-directory-mu.el
;;
;; To load all of the ".el" files, from "~/.emacs.d" you would do:
;;
;;  (load-directory-mu "~/.emacs.d")


;;; Change Log:
;;
;; v1.0  Mon Jun  1 20:51:27 EEST 2015
;;   - Original release of `load-directory-mu.el' library.

;;; Code:

(provide 'load-directory-mu)

;;;============================================================================
;;;
;;;  Public Functions/Commands.
;;;
;;;============================================================================

(defun load-directory-mu (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
        (fullpath (concat directory "/" path))
        (isdir (car (cdr element)))
        (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
        ((and (eq isdir t) (not ignore-dir))
          (load-directory-mu fullpath))
        ((and (eq isdir nil) (string= (substring path -3) ".el"))
          (load (file-name-sans-extension fullpath)))))))
