; Helper
(defmethod what (obj)
	(write (slot-value obj 'repr))(terpri))

; State
(defclass State ()
  ((repr 
	:initform "Automaton state.")
   (is_final
	:accessor state-is_final
	:initform nil
	:initarg :make-final)
   (action_to_take)
   (transitions
    :accessor state-transitions))
)
(defmethod print-state (obj)  ;; TODO - Make into repr w/ generic reading print func
	(write (type-of obj))
	(format T "is final: ~A~%"
		(slot-value obj 'state-is_final)))


; Automaton
(defclass Automaton () 
  ((repr
	:initform "Basic automaton.")
   (alphabet
	:accessor Automaton-alphabet
	:initform '0)
   (states
	:accessor Automaton-states
	:initarg :xstates)
   (state
   
    ))
)
(defmethod print-automaton (obj)  ;; TODO - Make into repr
	(format t "Alphabet - ~A~% 
				States~%
				------~%
				~A~%"
		(slot-value obj 'alphabet) (slot-value obj 'states))
	)

;;;; MAIN
(defun main ()				;;;	;;;	;;;	;;;	;;;	TODO #1 - Add transition functions
	(setf automata (list 
	  (make-instance 'automaton :xstates (list ))
	  (make-instance 'automaton :xstates (list (make-instance 'automaton) (make-instance 'automaton))
		)))

	(loop for machine in automata
	  do (print-automaton machine);(describe machine)
	  
		 (write '\'\'\')(TERPRI)
		 
		 (loop for s in (slot-value machine 'states)
			do (what s));(print-state s))

		 (terpri))
) ; main

(main)