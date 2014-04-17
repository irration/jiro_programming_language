CC=gcc
jiroparse: y.tab.o lex.yy.o main.o
	$(CC) y.tab.o lex.yy.o main.o -o $@ -lm
y.tab.h: jr.y file.h
	bison --yacc -dv jr.y
y.tab.c: jr.y file.h
	bison --yacc -dv jr.y
lex.yy.c: y.tab.c
	flex jr.l
y.tab.o: y.tab.c file.h
	$(CC) -c -g $*.c
lex.yy.o: lex.yy.c
	$(CC) -c -g $*.c
main.o: main.c file.h
	$(CC) -c -g $*.c

###########
main.o: main.c file.h
