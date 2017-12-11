domains
  W = string*
  S = string
  int = integer


predicates
  match(W, int, S)
  word(W)
  say(S, S)
  start	
 

clauses
  match([H|_],0,H) :-!.
  match([_|T],N,H) :-
    N > 0, %add for loop prevention
    M = N-1, 
    match(T,M,H).

  start:-
	nl, write("Ask me one of the questions:"),
	nl, write("How are you?"),
	nl, writef("Are you alive?"),
	nl, writef("You have friends?"),
	nl, writef("Your favorite color?"),
	nl, writef("Can we have a drink?"),
	nl, nl,writef("Enter question: "),
	readln(B),
	upper_lower(B,K),
	say(K, L),
	write("Answer: ", L),
	nl,nl, write("Do you want to continue the conversation?"),nl,
	readln(X),
	X = "Yes",
	write("________________________"),
	start.

  say(X, L):-
	word(K),
	X = "how are you?", 
	match(K,0,L). 
  say(X, L):-
	word(K),
	X = "are you alive?",
	match(K,1,L).
  say(X, L):-
	word(K),
	X = "you have friends?",
	match(K,2,L). 
  say(X, L):-
	word(K),
	X = "your favorite color?",
	match(K,3,L).
  say(X, L):-
	word(K),
	X = "can we have a drink?",
	match(K,4,L).
 
  word(["I'm fine, how are You?", "I do not think", "It seems to me that we are communicating well.", "Green, he calms me down :)", "But I'm a robot..."]).


goal
	nl, write("Hi, I am Jarvis, an artificial intelligence."),
	start.


