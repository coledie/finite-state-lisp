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
   (transitions                 ; Make into {state: '(lambda lambda ...)}
    :accessor state-transitions
	:initarg :make-transitions
	:initform (list ))))


(defun run (machine tape)
   (format t tape)(TERPRI)
   
   (write '-------------)(TERPRI)
   
   (what machine)

	(write '-------------)(TERPRI)

	(if (slot-value machine 'states) 
		(loop for s in (slot-value machine 'states)
			do (what s)))

	(terpri)
	
	;; make sure every item in letter is in alphabet
	(setq states (list 'X)) 
	(setq new_states (list )) 
	
	;; use collect
	
	;; Progress through tape
	(loop for letter across tape do 
		(loop for s in states do (format t "S ~A" s)(TERPRI))
		
		(TERPRI)
		(format t "L ~A" letter)(TERPRI)
		
		(loop for s in states do
			(dolist (func (slot-value machine 'transitions))
				(setq new_states (append new_states (list (funcall func s letter))))))
		
		;; add one of each state to states
		(setq states (list ))
			
		(dolist (item new_states)
			(if (null (member item states :test #'string-equal)) (setq states (append states (list item)))))
			
		;(setq states new_states)
		(setq new_states (list )))
		
	new_states)


(defun main () 

	(setq tape "abc")

	(setq automata 
		(make-instance 'automaton 
		:make-states (list (make-instance 'state) (make-instance 'state))
		:make-transitions (list 
			(lambda (state letter) (format nil (if (string-equal letter "a") "B" "C") state))
			(lambda (state letter) (format nil "~A" state))
			)))

	(run automata tape))

(main)