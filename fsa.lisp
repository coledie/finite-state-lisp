; Helper
(defmethod what (obj)
	;; Make so can take just string or will evaluate lambda
	(write (funcall (slot-value obj 'repr) obj))(terpri))

; State
(defclass State ()
  ((repr 
	:initform 
	(lambda (obj) (format nil "is final: ~A~%" (slot-value obj 'is_final))))
   (is_final
	:accessor state-is_final
	:initform nil
	:initarg :make-final)
   (action_to_take)
   (transitions
    :accessor state-transitions))
)


; Automaton
(defclass Automaton () 
  ((repr
	:initform 
	(lambda (obj) (format nil "Alphabet - ~A~% 
				States~%
				------~%
				~%"
		(slot-value obj 'alphabet) (list-length (slot-value obj 'states)))))
   (alphabet
	:accessor Automaton-alphabet
	:initform 0)
   (states
	:accessor Automaton-states
	:initarg :xstates
	:initform (list ))
   (state
   
    ))
)
	

;;;; MAIN
(defun main ()				;;;	;;;	;;;	;;;	;;;	TODO #1 - Add transition functions
	(setf automata (list 
	  (make-instance 'automaton)
	  (make-instance 'automaton :xstates (list (make-instance 'state) (make-instance 'state))
		)))

	(loop for machine in automata
	  do (what machine)
	  
		 (write '\'\'\')(TERPRI)
		 (if (slot-value machine 'states) (loop for s in (slot-value machine 'states)
			do (what s)))

		 (terpri))
) ; main

(main)