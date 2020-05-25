;;; logfmt-mode.el --- Syntax highlighting for logfmt logs

;; Copyright (C) 2020 Robin Schroer

;; Author: Robin Schroer <sulami@peerwire.org>
;; Maintainer: Robin Schroer <sulami@peerwire.org>
;; Version: 1.0
;; Homepage: https://github.com/sulami/logfmt-mode
;; Keywords: languages

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This major mode provides syntax highlighting for logfmt logs.

;;; Code:

(defvar logfmt-font-lock-defaults nil "Font locks for logfmt-mode.")

(setq logfmt-font-lock-defaults
      (let ((x-equals-regexp (regexp-quote "="))
            (x-string-regexp (rx "\"" (0+ anything) "\"" word-end))
            (x-labels-regexp (rx word-start
                                 (group (1+ (not (any ?=
                                                      space))))
                                 (opt (sequence "="
                                                (+? (not (any space))))))))
        `((,x-labels-regexp . (1 font-lock-variable-name-face))
          (,x-equals-regexp . font-lock-builtin-face)
          (,x-string-regexp . font-lock-string-face))))

;;;###autoload
(define-derived-mode logfmt-mode prog-mode "logfmt"
  "Major mode for editing logfmt."
  (setq font-lock-defaults '((logfmt-font-lock-defaults))))

(provide 'logfmt-mode)
;;; logfmt-mode.el ends here
