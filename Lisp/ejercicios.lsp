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
;(defun rotardreta (l)
;    (cond
;        
;    )
;)

;Agafar l'ultim element de una llista

;Agafar tota la llista menys el darrer
;(defun rdc (l)
;    (cond
;        ((null (cdr l)) nil)
;        (t (cons (car l) (rdr (cdr l))))
;    )
;)

;4

;6.Sumar tots els elements de les posicions parelles d'una llista
;(sumarparells '(1 2 3 4 5 6 7 8 9)) -> 20
(defun sumarparells (l)
    (cond 
        ((null (cdr l)) 0) ;Va de +2 posiciones por eso cdr
        ((+ (cadr l) (sumarparells (cddr l))))
    )
)

;6.Sumar tots els elements de les posicions senas d'una llista
;(sumarsenars '(1 2 3 4 5 6 7 8 9)) -> 25
(defun sumarsenars (l)
    (cond 
        ((null l) 0)    ;Va de +1 posiciones por eso no hay cdr
        ((+ (car l) (sumarsenars (cddr l))))
    )
)

;7.Mirar a quina posició d'una llista està un element'
;(posicio 'a '(t 2 b c a f g))
(defun posicio (e l)
    (cond 
        ((null l) nil)
        ((equal e (car l)) 1 )
        (t (+ 1 (posicio e (cdr l))))
    )
)

;Donades dues llistes, escriure els elements de la segona indexats per la primera 
;>(indexa '(1 3 7) '(a b c d e f g h)) 
;(a c g)   ; el primer, tercer i setè elements 