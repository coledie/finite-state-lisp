; Define State
(defclass State ()
  ((is_final)
   (action_to_take)
   (transitions))
)

; Define Automaton
(defclass Automaton () 
  ((alphabet)
   (states   ;; Add default value - define constructor!!!
	:accessor Automaton-states
    )
   (state
   
    ))
)

;; automata functions 
; run

;; State functions 
; update state

; have reader function create automata class from file contents


;; pretty printing
; (defmethod print-object ((obj Automaton) stream)
;      (print-unreadable-object (obj stream :type t)
;        (with-accessors ((x x)
;                         (y y))
;            obj
;          (format stream "~a, X: ~a" x y))))



; run on input data 

; constructor
(defun make-automaton (name ss) 
  (setq name (make-instance 'Automaton))
  (setf (Automaton-states name) ss)
  name
  )
  
(defun state-inspector (name)
  (if (slot-value name 'states)
    (loop for state in (slot-value name 'states)
      do (describe state))))

; create a list of automaton
(setf automata (list 
  (make-automaton 'sample '(2 1 2))
  (make-automaton 'sample2 '(3 3 3 3))))

(write '"Inspecting automaton.")

(loop for machine in automata
  do (describe machine)
	 (write "''''''''")
	 (state-inspector machine)
	 (terpri))
