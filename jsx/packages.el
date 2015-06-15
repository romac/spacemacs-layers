;;; packages.el --- JSX Layer packages File for Spacemacs
;;
;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq jsx-packages
    '(
      web-mode
      flycheck
      ))

;; List of packages to exclude.
(setq jsx-excluded-packages '())

(defun jsx/init-web-mode ()
  (use-package web-mode
    :defer t
    :mode
    (("\\.jsx\\'" . web-mode))
    :config
    (progn
      (defadvice web-mode-highlight-part (around tweak-jsx activate)
        (if (equal web-mode-content-type "jsx")
            (let ((web-mode-enable-part-face nil))
              ad-do-it)
          ad-do-it)))))

(defun jsx/init-flycheck ()
  (use-package flycheck
    :defer t
    :config
    (progn
      (flycheck-add-mode 'javascript-eslint 'web-mode))))
