; State
(defclass State ()
  ((is_final
	:accessor State-is_final)
   (action_to_take)
   (transitions))
)
(defun make-state (name) 
	(setq name (make-instance 'State))
	(setf (State-is_final name) t)
	name)
(defmethod print-state (obj)  ;; TODO - Make into repr
	(write (type-of obj))
	(format t "is final: ~A~%"
		(slot-value obj 'is_final)))


; Automaton
(defclass Automaton () 
  ((alphabet
	:accessor Automaton-alphabet)
   (states   ;; Add default value - define constructor!!!
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
(defun main ()
	(setf automata (list 
	  (make-automaton 'sample '())
	  (make-automaton 'sample2 (list (make-state 'test_state) (make-state 'test_state2)))))

	(loop for machine in automata
	  do (print-automaton machine);(describe machine)
	  
		 (write '\'\'\')(TERPRI)
		 
		 (loop for s in (slot-value machine 'states)
			do (print-state s))

		 (terpri))
) ; main

(main)