%% qa_db_finder.pl
%% Finds database style list-based algorithms with question answering.

%% Asks "What is the input variable?"
%% Asks "What variable is the input variable linked to?"

%% Asks "What variable is this last variable linked to?"
%% Asks "Is this the final output?"

/**
e.g. orig-trans, trans-bt where orig-bt have same meaning
	a(OT,TB,BO,O,T):-
	member(A1,OT),A1=[O,T],
	member(A2,TB),A2=[T,B],
	member(A3,BO),A3=[B,O].
	
What is the input variable?
|: O
What variable is this last variable linked to?
|: T
Is this the final variable? (y/n)
|: n
What variable is this last variable linked to?
|: B
Is this the final variable? (y/n)
|: n
What variable is this last variable linked to?
|: O
Is this the final variable? (y/n)
|: y
What is the final output variable?
|: T
A = "a(OT,TB,BO,O,T):-member(A1,OT),A1=[O,T],member(A2,TB),A2=[T,B],member(A3,BO),A3=[B,O].".

a(OT,TB,BO,O,T):-member(A1,OT),A1=[O,T],member(A2,TB),A2=[T,B],member(A3,BO),A3=[B,O].
?- a([[a,b]],[[b,a]],[[a,a]],a,T).
T = b.

**/

qa_db_finder(Algorithm) :-
	writeln("What is the input variable?"),
	read_string(user_input, "\n", "\r", _End, I),
	
	writeln("What variable is this last variable linked to?"),
	read_string(user_input, "\n", "\r", _End2, N),

	concat_list(["member(A1,",I,N,"),A1=[",I,",",N,"],"],Algorithm1),
	Vars1=[I,N],
	
	repeat1(2,N,Algorithm1,Algorithm2,Vars1,Vars2),
	
	string_concat(Algorithm3,",",Algorithm2),
	
	writeln("What is the final output variable?"),
	read_string(user_input, "\n", "\r", _End3, O),
	%%trace,
	
	find_header_args1(Vars2,"",HA1),
	%%string_concat(HA2,",",HA1),
	
	concat_list(["a(",HA1,I,",",O,"):-"],Algorithm4),
	concat_list([Algorithm4,Algorithm3,"."],Algorithm).


	
repeat1(M1,N,Algorithm1,Algorithm2,Vars1,Vars2) :-
	writeln("Is this the final variable? (y/n)"),
	read_string(user_input, "\n", "\r", _End, Q),

	(Q="y"->(Algorithm2=Algorithm1,Vars2=Vars1);
	writeln("What variable is this last variable linked to?"),
	read_string(user_input, "\n", "\r", _End2, V),
	
	concat_list(["member(A",M1,",",N,V,"),A",M1,"=[",N,",",V,"],"],Algorithm1a),
	append(Vars1,[V],Vars3),
	M2 is M1+1,
	string_concat(Algorithm1,Algorithm1a,Algorithm1b),
	repeat1(M2,V,Algorithm1b,Algorithm2,Vars3,Vars2)

	).


find_header_args1([_],HA,HA) :- !.
find_header_args1(Vars,HA1,HA2) :-
	Vars=[_|F],
	Vars=[A,B|_],
	concat_list([A,B,","],D),
	string_concat(HA1,D,E),
	find_header_args1(F,E,HA2).

	
concat_list(A1,B):-
	A1=[A|List],
	concat_list(A,List,B),!.

concat_list(A,[],A):-!.
concat_list(A,List,B) :-
	List=[Item|Items],
	string_concat(A,Item,C),
	concat_list(C,Items,B).
