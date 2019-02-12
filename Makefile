#test.o: rpn.ml tokenize.ml main.ml
#	ocamlfind ocamlc -o test.o -package ounit -linkpkg -g rpn.ml test.ml
main.o: rpn.ml tokenize.ml main.ml
	ocamlopt -o main.o str.cmxa tokenize.ml rpn.ml main.ml

