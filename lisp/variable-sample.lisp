(defun var-scope(x)
  (format t "Function: ~d~%" x)
  (let ((x 2))
    (format t "Let: ~d~%" x)
    (let ((x 3))
      (format t "Let inner: ~d~%" x))
    (format t "Let: ~d~%" x))
  (format t "Funtion: ~d~%" x))

(defun other-let ()
  (let* ((x 10)
	 (y (* x 2)))
    (list x y)))

(defun other-lexical()
  (let ((count 0))
    #'(lambda () (setf count (1+ count)))))

(defparameter *fn*
  (let ((count 0))
    #'(lambda () (setf count (1+ count)))))

(defun increment-widget-count ()
  (incf *count*))

(defvar *x* 10)
(defun foo ()
  (format t "X: ~d~%" *x*))

(defun foo-again ()
  (format t "Before assignment~18tX: ~d~%" *x*)
  (setf *x* (+ 1 *x*))
  (format t "After assignment~18tX: ~d~%" *x*))

(defun bar ()
  (foo-again)
  (let ((*x* 20)) (foo-again))
  (foo-again))
