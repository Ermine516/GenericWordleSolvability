# GenericWordleSovability
ASP encoding of Wordle address the question, given a target word W, 
starting word S, and n guesses, is there a sequence of n-2 additional 
words such that word W followings from the hints.

To run code you need clingo version 5.5.0

Example run:
 clingo wordle_hard.lp word_list/words_fifth.lp -c n=5 -c s=tares -c w=along

s-- The first word of the solution
w-- The target word
n-- The number of guesses allowed minus 1. 
