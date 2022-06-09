;1.Aplanar una llista (treure tots els parèntesi de la llista)
;(aplanar '(a (b c (d e) f) g))
(defun aplanar (l)
    (cond
        ((null (cdr l)) l)
        ((listp (car l)) (append (aplanar (car l)) (aplanar (cdr l))))
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
    (cons (ultim l) (delete-last l))
)
;Retona l'ultim element
(defun ultim (l)
    (cond
        ((null (cdr l)) (car l))
        (t (ultim (cdr l)))
    )
)
;Elimina el ultim element de la llista
(defun delete-last (l)
    (cond
        ((null (cdr l)) nil)
        (t (cons (car l) (delete-last (cdr l))))
    )
)

;4.Rotar els elements d'una llista cap a l'esquerra
;(rotaresquerra '(a b c d e f))
;(b c d e f a)
(defun rotaresquerra (l)
    (cons (cdr l) (car l))
)

;5.Sumar tots els elements de les posicions parelles d'una llista
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

;8.Donades dues llistes, escriure els elements de la segona indexats per la primera 
;>(indexa '(1 3 7) '(a b c d e f g h)) 
;(a c g)   ; el primer, tercer i setè elements
(defun indexa (l1 l2)
    (cond 
        ((null l1) nil)
        (t 
            (cons (agafar-n (car l1) l2) (indexa (cdr l1) l2)) ;Para cada numero busca su elemento
        )
    )
)

;9.Eliminar un element d'una llista i de totes les seves subllistes 
;>(borrarl 'a '(b a c (d a (a)) (f a) g))
;(b c (d nil) (f) g)
(defun borrarl (e l)
    (cond
        ((null l) nil)
        ((listp (car l)) (cons (borrarl e (car l)) (borrarl e (cdr l))))
        ((equal e (car l)) (borrarl e (cdr l)))
        (t (cons (car l) (borrarl e (cdr l))))
    )
)

;10.Invertir una llista i totes les subllistes
;(invertirtot '(a (b c) (d e (f g)) h)) 
;(h ((g f) e d) (c b) a)
;Tip: Append junta dos listas
(defun invertirtot (l)
    (cond 
        ((null l) nil)
        ;Sabemos que si entra aqui es porque es una lista, por lo tanto hay que guardar los
        ; resultados obtenidos del "car" en una lista originalmente
        ((listp (car l)) (append (invertirtot (cdr l)) (list (invertirtot (car l)))))
        ;Aqui se hace "list" para poder realizar el "append"
        (t (append (invertirtot (cdr l)) (list (car l))))
    )
)

;11.Comprimir els elements d'una llista 
;>(comprimir '(a a a b b b c d d d d))
;(3 a 3 b 1 c 4 d)
(defun comprimir (l)
    (cond 
        ((null l) nil)
        (t  
            (cons 
                (comptar-repetides (car l) l) ;Numero de veces que aparece
                (cons (car l) (comprimir (jump-diferent l))) ; Letra + la lista restante
            )
        )
    )
)
;Salta a un element diferent
(defun jump-diferent (l)
    (cond 
        ((null l) nil)
        ((equal (car l) (cadr l)) (jump-diferent (cdr l)))
        (t (cdr l))
    )
)
;Compta el numero d'elements repetits dins d'una llista
(defun comptar-repetides (e l)
    (cond 
        ((null l) 0)
        ((equal e (car l)) (+ 1 (comptar-repetides e (cdr l))))
        (t (comptar-repetides e (cdr l)) )
    )
)

;12.Fer una llista amb n vegades un element e 
;>(replicar 4 'a)
;(a a a a) 
(defun replicar (n e)
    (cond 
        ((= n 1) (list e))
        ((cons e (replicar (- n 1) e)))
    )
)

;13.Descomprimir els elements d'una llista 
;>(descomprimir '(3 a 3 b 1 c 4 d)) 
;(a a a b b b c d d d d))
(defun descomprimir (l)
    (cond
        ((null l) nil)
        ((append (replicar (car l) (cadr l)) (descomprimir (cddr l))))
    )
)

;14.Convertir un número binari a decimal
;>(decimal '(1 1 0 1)) 
;13
(defun decimal (l)
    (r-decimal (reverse l))
)

(defun r-decimal (l)
    (cond 
        ((null l) 0)
        (t (+ (car l) (* 2 (r-decimal (cdr l)))))
    )
)

;15.Convertir un número en base 10 a base 2: 
;>(binari 18) 
;(1 0 0 1 0) 
(defun binari (n) 
    (reverse (r-binari n))
)

(defun r-binari (n)
    (cond 
        ((< n 2) (list n))
        (t (cons (mod n 2) (r-binari (/ n 2))))
    )
)

(defun / (x y)
    (cond 
        ((< x y) 0)
        (t (+ 1 (/ (- x y) y)))
    )
)