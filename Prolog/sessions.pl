%1.Aplanar una llista (treure tots els parèntesi de la llista)
%?-aplanar([a,[b,c,[d,e],f],g], L).
%L=[a,b,c,d,e,f,g]
aplanar([],[]).
aplanar([X|Y],R):-
    is_list(X),
    aplanar(X,R1),
    aplanar(Y,R2),
    append(R1,R2,R),!.
aplanar([X|Y],R):-
    not(is_list(X)),
    aplanar(Y,R1),
    R=[X|R1].

%2.Agafar l'enèsim element d'una llista.
%?-agafar(3,[a,b,c,d,e,f],E).
%E=c
agafar(1,[X|_],X):-!.
agafar(N,[_|L],R):-
    N1 is N-1,
    agafar(N1,L,R),!.

%3.Rotar els elements d'una llista cap a la dreta
%?-rotardreta([a,b,c,d,e,f], L).
%L=[f,a,b,c,d,e]
rotardreta(L, R):-
    last(L,D),
    reverse(L,[_|L1]),
    reverse(L1,T),
    R=[D|T].

%4.Rotar els elements d'una llista cap a l'esquerra
%?- rotaresquerra([a,b,c,d,e,f], L).
%L=[b,c,d,e,f,a]
rotaresquerra([X|L],R):-
    append(L,[X],R).

%5.Sumar tots els elements de les posicions parelles d'una llista
%?- sumarparells([1,2,3,4,5,6,7,8,9], S).
%S=20
sumarparells([],0).
sumarparells([_],0).
sumarparells([_,P|L],S):-
    sumarparells(L,R),
    S is P+R.

%6.Sumar tots els elements de les posicions senas d'una llista
%sumarsenars ([1,2,3,4,5,6,7,8,9], S).
%S=25
sumarsenars([],0).
sumarsenars([X],X):-!.
sumarsenars([X,_|L],S):-
    sumarsenars(L,R),
    S is X+R.

%7.Mirar a quina posició d'una llista està un element
%posicio(a, [t,2,b,c,a,f,g],P).
%P=5
posicio(_,[],0).
posicio(E,[E|_],1):-!.
posicio(E,[_|L],S):-
    posicio(E,L,R),
    S is R + 1,!.
    
%8.Donades dues llistes, escriure els elements de la segona indexats per la primera 
%?-indexa([1,3,7], [a,b,c,d,e,f,g,h], L).
%L=[a,c,g]
indexa([], [], []).
indexa([], _, []).
indexa([X|L1], L2, S):-
    nth1(X,L2,R1),
    indexa(L1,L2,P),
	append([R1],P,S).

%9.Eliminar un element d'una llista i de totes les seves subllistes
%borrarl(a, [b,a,c,[d,a,[a]],[f,a],g], L).
%L=[b,c,[d,[]],[f] g]
borrarl(_,[],[]).
borrarl(E,[X|Y],L):-
    is_list(X),
    borrarl(E,X,L1),
    borrarl(E,Y,L2),
    append([L1],L2,L),!.
borrarl(E,[E|Y],L):-
    borrarl(E,Y,L),!.
borrarl(E,[X|Y],L):-
    borrarl(E,Y,L1),
    append([X],L1,L),!.

%10.Invertir una llista i totes les subllistes
%?-invertirtot([a,[b,c],[d,e,[f,g]],h], L).
%L=[h,[[g,f],e,d],[c,b],a]
invertirtot([],[]).
invertirtot([X|L],R):-
    is_list(X),
    invertirtot(X,R1),
    invertirtot(L,R2),
    append(R2,[R1],R),!.
invertirtot([X|L],R):-
	invertirtot(L,R1),
    append(R1,[X],R),!.
    
%11.Comprimir els elements d'una llista
%?-comprimir([a,a,a,b,b,b,c,d,d,d,d], L).
%L=[3,a,3,b,1,c,4,d]
comprimir([],[]).
comprimir([X|L],RL):-
    comptarReperides(X,[X|L],R),
    COMB = [R,X],
    botar([X|L],SELM),
    comprimir(SELM,RSEL),
    append(COMB,RSEL,RL),!.

%Botar seguent element
botar([X|[X|L]],R):-
    botar([X|L],R).
botar([_|L],L).
    
%Compta l'element E a la llista
comptarReperides(_,[],0):-!.
comptarReperides(E,[E|L],R):-
    comptarReperides(E,L,R1),
    R is R1 + 1,!.
comptarReperides(E,[_|L],R):-
    comptarReperides(E,L,R).

%12.Fer una llista amb n vegades un element e 
%?-
%L=[a,a,a,a]
replicar(0, _, []).
replicar(1, X, [X]).
replicar(N, E, R):-
    M is N-1,
    replicar(M, E, S),
    append(S,[E],R),!.

%13.Descomprimir els elements d'una llista
%?- descomprimir([3,a,3,b,1,c,4,d], L).
%L=[a,a,a,b,b,b,c,d,d,d,d]
descomprimir([],[]).
descomprimir([X|[Y|L]],R):-
	replicar(X,Y,T),
    descomprimir(L,W),
    append(T,W,R),!.

%14.Convertir un número binari a decimal
%?- decimal([1,1,0,1], N).
%N=13
decimal(L,N):-
    reverse(L,L1),
    aDecimal(L1,N).
aDecimal([],0).
aDecimal([X|L],N):-
    aDecimal(L,N1),
    N is N1*2+X.

%15.Convertir un número en base 10 a base 2:
%?-binari(18, B).
%B=[1,0,0,1,0]
binari(1,[1]):-!.
binari(0,[0]):-!.
binari(X,B):-
    R is mod(X,2),
    Q is X//2,
    binari(Q,B1),
    append(B1,[R],B),!.