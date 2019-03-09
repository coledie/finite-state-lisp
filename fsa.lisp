; Helper
(defmethod what (obj)
	(write (slot-value obj 'repr))(terpri))

; State
(defclass State ()
  ((repr 
	:initform "Automaton state.")
   (is_final
	:accessor state-is_final)
   (action_to_take)
   (transitions
    :accessor state-transitions))
)
(defun make-state (name) 
	(setq name (make-instance 'State))
	(setf (state-is_final name) t)
	name)
(defmethod print-state (obj)  ;; TODO - Make into repr w/ generic reading print func
	(write (type-of obj))
	(format T "is final: ~A~%"
		(slot-value obj 'state-is_final)))


; Automaton
(defclass Automaton () 
  ((repr
	:initform "Basic automaton.")
   (alphabet
	:accessor Automaton-alphabet)
   (states
	:accessor Automaton-states)
   (state
   
    ))
)
(defun make-automaton (name ss) 
  (setq name (make-instance 'Automaton))
  (setf (Automaton-alphabet name) '0)
  (setf (Automaton-states name) ss)
  name)
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
	  (make-automaton 'sample '())
	  (make-automaton 'sample2 (list (make-state 'test_state) (make-state 'test_state2)))))

	(loop for machine in automata
	  do (print-automaton machine);(describe machine)
	  
		 (write '\'\'\')(TERPRI)
		 
		 (loop for s in (slot-value machine 'states)
			do (what s));(print-state s))

		 (terpri))
) ; main

(main)