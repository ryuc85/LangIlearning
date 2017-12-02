(defun optional-param (a b &optional c d)
  "Get the required parameter and optional parameter and return a list."
  (list a b c d))

(defun rest-param (a &rest b)
  "Get the params and print out required parameter and return a list of rest parameter."
  (format t "The required parameter is ~d.~%" a)
  b)

(defun keys-param (&key a b c)
  "The parameter which have a key, if you want to use one in them. Call this function like (keys-param :b 2)"
  (list a b c))

(defun keys-with-default (&key (a 10) b c)
  "This function will show you which a keyword parameter with a default value. If you call this function by (keys-with-default :b 2) the result will be (10 2 NIL)"
  (list a b c))

(defun alias-param (&key ((:apple a)) ((:banana b) 10) ((:chicken c)))
  "In this function I give the parameter a alias. Then you will use (alias-param :apple 1 :banana 2 :chicken 3) to call this function."
  (list a b c))

(defun mixed-param (x &optional y &key z)
  "Don't use this code in your code, beacause mix optional to key parameter will lead to somewhat surprising result."
  (list x y z))

(defun mixed-param-optional-rest (x &optional y &rest z)
  "You can see if you don't supply the optional parameter, they will eat up the value for rest parameter. 
If you don't want that you must supply the NIL to optional paramter if you don't want to use them, so they will not be optional."
  (list x y z))

(defun mixed-param-optional (x &optional y z)
  "This is a right sample to mix parameters."
  (list x y z))

(defun mixed-param-rest (x y &rest z)
  "This also a right sample to mix parameters."
  (list x y z))

(defun mixed-param-rest-key (&rest rest &key a b c)
  "Your can see that it's not a good idea to mix rest and key"
  (list rest a b c))

(defun foo (n)
  "Notice that this is a wrong code."
  (dotimes (i 10)
    (dotimes (j 10)
      (when (> (* i j) n)
	(list i j)))))

(defun foo (n)
  "And this is right, if i * j equals n, return the i and j "
  (dotimes (i 10)
    (dotimes (j 10)
      (when (> (* i j) n)
	(return-from foo (list i j))))))

(defun plot (fn min max step)
  (loop for i from min to max by step do
       (loop repeat (funcall fn i) do (format t "*"))
       (format t "~%")))

(defun apply-plot(plot-data)
  "You can call plot with a list variable using apply.
  call this use (apply-plot (list #'exp 0 4 1/2))"
  (apply #'plot plot-data))

(defun apply-plot-ex (&rest plot-data)
  "If you want to call apply-plot like calling plot use this."
  (apply #'plot plot-data))

(defun plot-lambda ()
  (plot #'(lambda (x) (* x 2)) 0 10 1))
