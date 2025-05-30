;;; Compiled snippets and support files for `python-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
		     '(("fzip"
			"for ${1:items} in zip(${2:args}):\n    print(${3:items})\n    $0\n\n\n"
			"pythonzip" nil nil nil
			"d:/emacs_settings/.emacs.d/snippets/python-mode/zip"
			nil nil)
		       ("wh" "while ${1:True}:\n    $0" "python-while"
			nil ("control structure") nil
			"d:/emacs_settings/.emacs.d/snippets/python-mode/while"
			nil nil)
		       ("pformat" "print(\"$1{}\".format($2))\n$0"
			"python-print-format" nil nil nil
			"d:/emacs_settings/.emacs.d/snippets/python-mode/pf"
			nil nil)
		       ("p" "print(\"$1\")\n$0" "python-print" nil nil
			nil
			"d:/emacs_settings/.emacs.d/snippets/python-mode/p"
			nil nil)
		       ("from"
			"from ${1:module} import ${2:symbol}\n$0"
			"from" nil nil nil
			"d:/emacs_settings/.emacs.d/snippets/python-mode/from"
			nil nil)
		       ("for" "for ${var} in ${collection}:\n    $0"
			"for" nil nil nil
			"d:/emacs_settings/.emacs.d/snippets/python-mode/for"
			nil nil)
		       ("enumerate"
			"for i, n in enumerate($1):\n    $0"
			"python-enumerate" nil nil nil
			"d:/emacs_settings/.emacs.d/snippets/python-mode/enumerate"
			nil nil)
		       ("def" "def ${1:fun}(${2:args}):\n    $0"
			"function" nil nil nil
			"d:/emacs_settings/.emacs.d/snippets/python-mode/def"
			nil nil)
		       ("class"
			"class ${1:name}:\n      def __init__(self${2:args}):\n      	  $0"
			"python-class-with-init" nil nil nil
			"d:/emacs_settings/.emacs.d/snippets/python-mode/class"
			nil nil)))


;;; Do not edit! File generated at Wed May 28 21:12:28 2025
