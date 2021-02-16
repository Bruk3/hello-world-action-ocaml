wordcount.ml: wordcount.mll
	ocamllex wordcount.mll

wordcount: wordcount.ml
	ocamlc -o wordcount wordcount.ml

wordcount.out: wordcount Makefile
	./wordcount < Makefile > wordcount.out


.PHONY: clean
clean: 
	rm -rf wordcount wordcount.out *.cmi *.cmo wordcount.ml
