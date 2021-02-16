wordcount.ml: wordcount.mll
	opam exec -- ocamllex wordcount.mll

wordcount: wordcount.ml
	opam exec -- ocamlc -o wordcount wordcount.ml

wordcount.out: wordcount Makefile
	./wordcount < Makefile > wordcount.out


.PHONY: clean
clean: 
	rm -rf wordcount wordcount.out *.cmi *.cmo wordcount.ml
