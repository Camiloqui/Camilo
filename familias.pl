Padrede('Oscar','Camilo').
padrede('Marco','Oscar').
padrede('Marco','Diana').
padrede('Camilo','Coraline').

hijode(A,B) :- padrede(B,A).

abuelode(A,B) :- padrede(A,C), padrede(C,B).
	
hermanode(A,B) :- padrede(C,A), padrede(C,B), A \== B.
	
familiarde(A,B) :- padrede(A,B).
familiarde(A,B) :- abuelode(A,B).
familiarde(A,B) :- hermanode(A,B).
