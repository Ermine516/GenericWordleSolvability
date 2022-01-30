import sys
from functools import reduce

# Computes the score where xc is from the guess list
# and wc is from the answers list
def score(xc,wc,F,N,M,i):
	return 10-(F+min(M,N)) if i<0 else score(xc,wc,F+(1 if xc[i] == wc[i] else 0),N+(1 if wc[i] in xc else 0),M+(1 if xc[i] in wc else 0),i-1)
	
# sum the scores of each guess list word relative to 
# the entire answer list or the entire list. Saves to results.csv
# the smallest value in results.csv is the best first choice.
# when argument join is used the answer is tares, otherwise soare.
with open("wordle_allowed_guesses.txt", 'r') as f, open("wordle_answers_alphabetical.txt", 'r') as f3, open("results.csv", "w") as f2:
		lw = [x[0:len(x)-1] if x[len(x)-1]=='\n' else x for x in f]
		lans = [x[0:len(x)-1] if x[len(x)-1]=='\n' else x for x in f3]
		lboth=  lw+lans if len(sys.argv)==2 and sys.argv[1] == "join" else lans
		for x in lw: 
			f2.write(str(x)+";"+str(reduce(lambda a,b: a+score(x,b,0,0,0,4), lboth,0))+"\n") 
