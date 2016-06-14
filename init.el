          (require 'package) ;; You might already have this line
          (add-to-list 'package-archives
          '("popkit" . "https://elpa.popkit.org/packages/"))
          (when (< emacs-major-version 24)
          ;; For important compatibility libraries like cl-lib
          (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
          (package-initialize) ;; You might already have this line


;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

(require-package 'evil)

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)
