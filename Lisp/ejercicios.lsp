;1.Aplanar una llista (treure tots els parèntesi de la llista)
;(aplanar '(a (b c (d e) f) g))
(defun aplanar (l)
    (cond
        ((null (cdr l)) l)
        ((listp (car l)) (aplanar (car l)) (aplanar (cdr l)))
        (t (cons (car l) (aplanar (cdr l))))
    )
)

;2.Agafar l'enèsim element d'una llista
;(agafar-n 3 '(a b c d e f))
(defun agafar-n (n l)
    (cond 
        ((null l) nil)
        ((= n 1) (car l))
        (t (agafar-n (- n 1) (cdr l)))
    )
)

;3.Rotar els elements d'una llista cap a la dreta
;(rotardreta '(a b c d e f))
;(f a b c d e)
(defun rotardreta (l)
    (cond
        
    )
)

;Agafar l'ultim element de una llista

;Agafar tota la llista menys el darrer
(defun rdc (l)
    (cond
        ((null (cdr l)) nil)
        (t (cons (car l) (rdr (cdr l))))
    )
)