

;; Automatically set PYTHONENV and the virtualenv for project
((python-mode .
	      ((eval . (setenv "PYTHONPATH" (concat (projectile-project-root) nil)))
	       (project-venv-name . nil))))
