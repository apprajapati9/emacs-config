;;; Compiled snippets and support files for `simpc-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'simpc-mode
		     '(("printVector"
			"void printVector(vector<int> &v){\n     for(size_t i = 0; i < v.size(); i++) {\n     	     cout << v[i] << \",\"; \n     }\n     cout << endl;\n}\n"
			"cpp-print-vector" nil nil nil
			"d:/emacs_settings/.emacs.d/snippets/simpc-mode/printVector"
			nil nil)
		       ("for"
			"for(size_t i = $1; i < $2; i++) {\n	   $0\n}\n"
			"cpp-for-loop" nil nil nil
			"d:/emacs_settings/.emacs.d/snippets/simpc-mode/for"
			nil nil)
		       ("cpp"
			"#include <iostream>\n\nusing namespace std;\n\nint main(){\n    cout << \"Hello world!\" << endl;\n    $0\n    return 0;\n}\n"
			"cpp-hello-world" nil nil nil
			"d:/emacs_settings/.emacs.d/snippets/simpc-mode/cpp"
			nil nil)
		       ("comment" "/*\n$0\n*/" "cpp-comment" nil nil
			nil
			"d:/emacs_settings/.emacs.d/snippets/simpc-mode/comment"
			nil nil)))


;;; Do not edit! File generated at Sat May 10 16:53:23 2025
