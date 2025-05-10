(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(display-line-numbers-type 'relative)
 '(gdb-many-windows t)
 '(inhibit-startup-screen t)
 '(org-agenda-dim-blocked-tasks nil)
 '(org-agenda-exporter-settings '((org-agenda-tag-filter-preset (list "+personal"))))
 '(org-cliplink-transport-implementation 'url-el)
 '(org-enforce-todo-dependencies nil)
 '(org-modules
   '(org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc
	      org-mhe org-rmail org-w3m))
 '(org-refile-use-outline-path 'file)
 '(package-selected-packages
   '(avy clang-format company consult dash dash-functional expand-region
	 flycheck format-all gruber-darker-theme hydra
	 ido-completing-read+ move-text multiple-cursors projectile
	 smartparens typescript-mode which-key yasnippet))
 '(safe-local-variable-values
   '((eval progn (auto-revert-mode 1) (rc/autopull-changes)
	   (add-hook 'after-save-hook 'rc/autocommit-changes nil
		     'make-it-local))))
 '(warning-minimum-level :error)
 '(whitespace-style
   '(face tabs spaces trailing space-before-tab newline indentation empty
	  space-after-tab space-mark tab-mark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tab-line ((t (:background "#222222" :foreground "#ffffff" :box nil))))
 '(tab-line-highlight ((t (:background "#005f5f" :foreground "#ffffff"))))
 '(tab-line-tab ((t (:background "#444444" :foreground "#dddddd" :box (:line-width -1 :style pressed-button)))))
 '(tab-line-tab-current ((t (:background "#007acc" :foreground "#ffffff" :box (:line-width -1 :style released-button)))))
 '(tab-line-tab-inactive ((t (:background "#333333" :foreground "#888888" :box (:line-width -1 :style released-button))))))
