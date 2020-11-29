
isaLink(whale, mammal).
isaLink(dog, mammal).
isaLink(retriever, dog).
isaLink(golden_retriever, retriever).
isaLink(poodle, dog).
isaLink(cat,mammal).
isaLink(tabby, cat).
isaLink(canary, bird).
isaLink(robin, canary).
isaLink(penguin, bird).
isaLink(emperor_penguin, penguin).
isaLink(chicken, bird).
isaLink(shark, fish).

leaf(X):- not(isaLink(Y,X)).
siblings(X,Y):- isaLink(X,Z), isaLink(Y,Z), not(X = Y).
grandParent(X,Y):- not(X = Y), isaLink(X,Z), isaLink(Z,Y), not(Z = Y), not(X = Z).
isa(X,Y):- X = Y.
isa(X,Y):m  n- isaLink(X,Z), is(Z,Y).
mostSpecificSubsumer(X,Y,Z):- isa(X,Z), Z = Y.
mostSpecificSubsumer(X,Y,Z) :- isa(X,Z), isa(Y,Z).
mostSpecificSubsumer(X,Y,Z):- X = Z, isa(Y,Z).
mostSpecificSubsumer(X,Y,Z):- isaLink(X,X1), isaLink(Y,Y1), mostSpecificSubsumer(X1,Y1,Z).