# GenericWordleSolvability
ASP encoding of Wordle addressing the following question:

given a target word W, starting word S, and n guesses, is there a sequence of n-1 words, where s is the first word in the sequence, such that the only logic choice, based on the hints, for the nth word is W.

written using clingo version 5.5.0

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
		clingo wordle_hard.lp word_list/words_Fourth.lp -c n=4 -c w=tares -c s=gayal
  clingo version 5.5.0
  Reading from wordle_hard.lp ...
  Solving...
  UNSATISFIABLE
 
  Models       : 0
  Calls        : 1
  Time         : 229.411s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
  CPU Time     : 229.380s
	```
