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
