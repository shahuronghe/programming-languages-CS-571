

all:
	flex -l calc.l
	bison -dv calc.y
	gcc -o calc calc.tab.c lex.yy.c -lfl

clean:
	rm calc
	rm calc.output
	rm calc.tab.*
	rm lex.yy.c
