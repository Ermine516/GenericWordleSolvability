% the target word
target(w).

%characters are numbered 0 to 25 for a through z
char(0..25).

%must be the case
n>1.

% when a character Char occurs in word W
occurs(W,Char):- word(W),char(Char), #count{Pos:wc(W,Pos,Char)}>0.

% when a character Char does not occur in word W
noccurs(W,Char):- word(W),char(Char),#count{Pos:wc(W,Pos,Char)}=0.

% If the character Char at position Pos in X is the same as at position Pos in the target.
hint(X,Pos,0):- wc(X,Pos,Char),target(Y), wc(Y,Pos,Char). 

% If the character Char at position Pos in X is at some position in the target and the number of occurances of the character in X is less than or equal to the target.
hint(X,Pos,1):- wc(X,Pos,Char),target(Y), wc(Y,Pos2,Char),
Pos2!=Pos,#count{P:wc(X,P,Char)}=R,#count{P:wc(Y,P,Char)}=R1, R<=R1. 

% If the character Char at position Pos in X is at some position in the target and occurs once more than the %character occurs in the target. Then every occurence which is not in the right location, except the last, are given hint 1.
hint(X,Pos,1):- not hint(X,Pos,0), wc(X,Pos,Char),target(Y), 
wc(Y,Pos2,Char),Pos2!=Pos, #max{P:not hint(X,P,0),wc(X,P,Char)}=Posmax,
Pos<Posmax, #count{P:wc(X,P,Char)}=R,#count{P:wc(Y,P,Char)}=R1, R=R1+1. 

% If the character Char at position Pos in X is at some position in the target and occurs twice more than the %character occurs in the target. Then every occurence which is not in the right location, except the last two, are given hint 1.
hint(X,Pos,1):- not hint(X,Pos,0), wc(X,Pos,Char),target(Y), wc(Y,Pos2,Char),
Pos2!=Pos, #max{P:not hint(X,P,0),wc(X,P,Char), wc(X,P2,Char),P<P2}=Posmax,
Pos<Posmax,#count{P:wc(X,P,Char)}=R,#count{P:wc(Y,P,Char)}=R1, R=R1+2. 

% If the character at position Pos in X is at no position in the target.
hint(X,Pos,2):- wc(X,Pos,Char),target(Y), noccurs(Y,Char). 

%Setting excess occurances to hint level 2
hint(X,Pos,2):- 
not hint(X,Pos,0), not hint(X,Pos,1),wc(X,Pos,Char),target(Y), wc(Y,Pos2,Char),
Pos2!=Pos, #max{P:not hint(X,P,0),wc(X,P,Char)}=Pos,
#count{P:wc(X,P,Char)}=R,#count{P:wc(Y,P,Char)}=R1, R=R1+1. 

%Setting excess occurances to hint level 2
hint(X,Pos,2):- 
not hint(X,Pos,0), not hint(X,Pos,1), wc(X,Pos,Char),target(Y), wc(Y,Pos2,Char),
Pos2!=Pos, #max{P:not hint(X,P,0),wc(X,P,Char), wc(X,P2,Char),P<P2}=Posmax,
Posmax<=Pos,#count{P:wc(X,P,Char)}=R,#count{P:wc(Y,P,Char)}=R1, R=R1+2. 


%Each word which is not the target may be a solution. At most n solutions. 
1{ sol(X):word(X),X!= Y}n:-target(Y). 

%solution must always be the best word, a chosen seed word
sol(s).


% Covered because the character isn't at that position
cover(X):- word(X),wc(X,Pos,Char), #count{ W: sol(W), 
hint(W,Pos,0), not wc(W,Pos,Char)}>0. 

% Covered because the character isn't at any position
cover(X):- word(X), 
#count{ W: sol(W), hint(W,Pos,1), wc(W,Pos,Char), noccurs(X,Char)}>0.

% Covered because the character is at some position
cover(X):- word(X), 
#count{ W: sol(W), hint(W,Pos,2), wc(W,Pos,Char),occurs(X,Char)}>0.

% Every word ought to be covered
:- target(Y),#count{X: word(X),not cover(X),X!=Y}>0.

% Every other target should be covered

:- target(Y),#count{X: target(X),not cover(X),X!=Y}>0.

% The target should not be covered. 
:- target(X),cover(X). 


% show the solutions
#show sol/1.
#show target/1.
