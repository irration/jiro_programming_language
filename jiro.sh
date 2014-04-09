yacc -dv jr.y
lex jr.l
cc -o jiro y.tab.c lex.yy.c
