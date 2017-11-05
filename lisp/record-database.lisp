; A method which get four arguments and storage them to a property list.
(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

; Declear a global variable to store cd
(defvar *db* nil)

; Add a cd to global db list.
(defun add-record (cd) (push cd *db*))

; Dump the db to human-readable format.
(defun dump-db ()
  (dolist (cd *db*)
    (format t "~{~a:~10t~a~%~}~%" cd)))

; Print a prompt and get the word what your inputed.
(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  ;(force-output *query-io*) This line is necessary in some implementations
  (read-line *query-io*))

; Prompt use to input the information of cd
(defun prompt-for-cd ()
  (make-cd
   (prompt-read "Title")
   (prompt-read "Artist")
   (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
   (y-or-n-p "Ripped [y/n]")))

; Loop if user agree to anthor, and add cd.
(defun add-cds ()
  (loop (add-record (prompt-for-cd))
     (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

; Write out db to a file.
(defun save-db (filename)
  (with-open-file (out filename
		       :direction :output
		       :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

; Read from the file to get the database
(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

