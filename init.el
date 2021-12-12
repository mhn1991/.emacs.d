(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa")
			 ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; initializing use-package
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes nil)
 '(package-selected-packages
   '(marginalia vertico auto-package-update use-package srcery-theme rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'srcery t)
(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 4)
   (auto-package-update-maybe))


(use-package org)
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))


(use-package vertico
  ;; ensure will download the package if it is not present on the system
  :ensure t
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))
