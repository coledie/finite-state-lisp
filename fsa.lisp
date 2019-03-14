;;; Helper
(defmethod what (obj)
	;; Make so can take just string or will evaluate lambda
	(format t (funcall (slot-value obj 'repr) obj))(terpri))


;;; State
(defclass State ()
  ((repr 
	:initform 
	(lambda (obj) (format nil "is final: ~A~%" (slot-value obj 'is_final))))
   (is_final
	:accessor state-is_final
	:initarg :make-final
	:initform nil)
   (transitions
    :accessor state-transitions
	:initarg :make-transitions
	:initform (list )))
)


;;; Automaton
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
   (curr_state
	:accessor Automaton-curr_state
	:initarg :make-curr_state
	:initform nil
    ))
)


; TODO #1 - Read from file
; alphabet = (X,X,X,X)
; state = (name,is_final,transitions...)

;;;; MAIN
(defun main () 
	(setf automata (list 
	  (make-instance 'automaton)
	  (make-instance 'automaton :make-states (list (make-instance 'state) (make-instance 'state))
		)))

	(loop for machine in automata
	  do (what machine)
	  
		 (write '-------------)(TERPRI)
		 (if (slot-value machine 'states) 
		   (loop for s in (slot-value machine 'states)
			 do (what s)))

		 (terpri))
)

(main)