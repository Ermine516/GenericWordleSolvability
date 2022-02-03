# GenericWordleSolvability
ASP encoding of Wordle addressing the following question:

given a target word W, starting word S, and n guesses, is there a sequence of n-1 words, where s is the first word in the sequence, such that the only logic choice, based on the hints, for the nth word is W.

written using clingo version 5.5.0

Additionally, in the directory NP-Completeness, one will find a reduction from the set cover to deciding if a wordle task is solvable in n+1 steps. By solvable we mean there exists a set of words of size at most n whose hints exclude every word but the answer. Note this result concerns a generalization of the problem. 

How to Run:
  ```
  clingo wordle_hard.lp word_list/words_fifth.lp -c n=5 -c s=tares -c w=along

  s-- The first word of the solution
  w-- The target word
  n-- The number of guesses allowed minus 1. 
```
Example One:
  ```
  clingo wordle_hard.lp word_list/words_fifth.lp -c n=5 -c s=tares -c w=along
  clingo version 5.5.0
  Reading from wordle_hard.lp ...

  Solving...
  Answer: 1
  target(along) sol(tares,1) sol(blank,4) sol(umiaq,2) sol(hypha,3)
  SATISFIABLE

  Models       : 1+
  Calls        : 1
  Time         : 243.042s (Solving: 0.01s 1st Model: 0.01s Unsat: 0.00s)
  CPU Time     : 243.005s
```
Example Two:
  ```
  clingo wordle_hard.lp word_list/words_fourth.lp -c n=4 -c w=tares -c s=gayal
  clingo version 5.5.0
  Reading from wordle_hard.lp ...
  Solving...
  UNSATISFIABLE
 
  Models       : 0
  Calls        : 1
  Time         : 229.411s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
  CPU Time     : 229.380s
	```
Best_First_Word:
	Code finds the best word to play first by summing up the score for each guess against either the answer set or both the answer set and the guess set together. A CSV is constructed with can be sorted to provide the answer. The smaller the sum the better. 
	
	Running 'python Best_First.py join' results in 'soare' being the best word, i.e. comparision to the answer set alone. 
	Running 'python Best_First.py' results in 'tares' being the best word, i.e. comparision to the answer set together with the guess set. 
	
The latter is closer to the real setting under which wordle is played as the only information you can get is whether your word is acceptable or not, not if it is answer set or not. 
