
# rpn: tokenize.cmx rpn.cmx
#	ocamlopt -o rpn tokenize.cmx rpn.cmx str.cma
#tokenize.cmx: tokenize.ml
#	ocamlopt -c tokenize.ml
#rpn.cmx: rpn.ml
#	ocamlopt -c rpn.ml

main.o: rpn.ml tokenize.ml main.ml
	ocamlopt -o main.o str.cmxa tokenize.ml rpn.ml main.ml
rpn: rpn.ml tokenize.ml
	ocamlopt -o rpn str.cmxa tokenize.ml rpn.ml
