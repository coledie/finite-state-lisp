;;; Helper
(defmethod what (obj)
	;; Make so can take just string or will evaluate lambda
	(format t (funcall (slot-value obj 'repr) obj))(terpri))


(defclass State ()
  ((repr 
	:initform 
	(lambda (obj) (format nil "is final: ~A~%" (slot-value obj 'is_final))))
   (is_final
	:accessor state-is_final
	:initarg :make-final
	:initform nil)))


(defclass Automaton () 
  ((repr
	:initform 
	(lambda (obj) (format nil "Alphabet - ~A"
		(slot-value obj 'alphabet))))
   (alphabet
	:accessor Automaton-alphabet
	:initarg :make-alphabet
	:initform (list ))
   (states
	:accessor Automaton-states
	:initarg :make-states
	:initform (list ))
   (transitions
    :accessor state-transitions
	:initarg :make-transitions
	:initform (list ))))


(defun run (machine tape)
   (format t tape)(TERPRI)
   
   (write '-------------)(TERPRI)
   
   (loop for s in tape do (format t s))
   
   (what machine)

	(write '-------------)(TERPRI)

	(if (slot-value machine 'states) 
		(loop for s in (slot-value machine 'states)
			do (what s)))

	(terpri)
	
	;; make sure every item in letter is in alphabet
	
	;; Progress through tape
	(loop for letter across tape 
	   do 
	      (princ letter)
		  
		  ;; Go through every transition function w/ state and letter
		  ;; if output is not nil add it to list
		  
		  ;; go though new state list and remove duplicates
		  
		  )

)


(defun main () 
	(setq tape "abcabcabc")

	(setq automata 
	  (make-instance 'automaton 
	    :make-states (list (make-instance 'state) (make-instance 'state))))

	(run automata tape))

(main)