padrede('Oscar','Camilo').
padrede('Oscar','Lukas').
padrede('Oscar','Laura').
padrede('Ponio','Oscar').
padrede('Marcos','Diana').
padrede('Marcos','Pily').
padrede('Marcos','Claudia').
padrede('Marcos','Samuel').
padrede('Camilo','Coraline').
padrede('Diana','Lukas').
padrede('Diana','Camilo').
padrede('Diana','Laura').
padrede('Lukas','Catalina').


hijode(A,B) :- padrede(B,A).

abuelode(A,B) :- padrede(A,C), padrede(C,B).
nietode(A,B):- padrede(C,A),padrede(B,C).
	
hermanode(A,B) :- padrede(C,A), padrede(C,B), A \== B.
tiode(A,B):- hermanode(A,C),padrede(C,B).
sobrinode(A,B):- hermanode(C,B),padrede(C,A).	
primode(A,B):- padrede(C,A),hermanode(C,D),padrede(D,B).
bisabuelode(A,B):-hijode(B,C),hijode(C,D),hijode(D,A).
bisnietode(A,B):-padrede(C,A),padrede(D,C),padrede(B,D).

esposode(A,B):- padrede(A,C),padrede(B,C), A \== B.
suegrode(A,B):- esposode(A,C),padrede(B,C).
cuñadode(A,B):- esposode(A,C),hermanode(C,B). 
yernode(A,B):- suegrode(B,A).
esfeliz(A) :-  not(esposode(A,_)). 

familiarde(A,B) :- padrede(A,B).
familiarde(A,B) :- hijode(A,B).
familiarde(A,B) :- abuelode(A,B).
familiarde(A,B) :- hermanode(A,B).
familiarde(A,B) :- tiode(A,B).
familiarde(A,B) :- sobrinode(A,B).
familiarde(A,B) :- bisabuelode(A,B).
familiarde(A,B) :- bisnietode(A,B).
familiarde(A,B) :- primode(A,B).
familiarde(A,B) :- nietode(A,B).