# GenericWordleSovability
ASP encoding of Wordle addressing the following question:

given a target word W, starting word S, and n guesses, is there a sequence of n-1 words, where s is the first word in the sequence, such that the only logic choice, based on the hints, for the nth word is W.

written using clingo version 5.5.0

Example run:
 clingo wordle_hard.lp word_list/words_fifth.lp -c n=5 -c s=tares -c w=along

s-- The first word of the solution
w-- The target word
n-- The number of guesses allowed minus 1. 
