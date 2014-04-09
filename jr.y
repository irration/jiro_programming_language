%{

#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1

%}

%union {
  int hexval;
  char ch;
}

%token LP RP NUKI YASAI NINNIKU ABURA KARAME BEGIN_CALL
%type <hexval> call_inner term factor
%type <ch> rot dealer call_list call

%%

rot
  : dealer call_list {
    $$ = $2;
  }
  ;

dealer
  : LP BEGIN_CALL RP {
    $$ = '\n';
  }
  ;

call_list
  : call_list call {
    // 暫定
    $$ = $1;
  }
  | call
  ;

call
  : call_inner call_inner {
    $$ = (char)(($1 * 16) + $2);
    putchar($$);
  }
  ;

call_inner
  : LP term RP {
    $$ = $2;
  }
  ;

term
  : term factor {
    $$ = $1 + $2;
  }
  | factor
  ;

factor
  : YASAI {
    $$ = 1;
  }
  | NINNIKU {
    $$ = 2;
  }
  | ABURA {
    $$ = 4;
  }
  | KARAME {
    $$ = 8;
  }
  ;

%%

int yyerror(){
  extern char *yytext;
  fprintf(stderr, "perser error near %s\n", yytext);
  return 0;
}

int main(void){
  extern int yyparse(void);
  extern FILE *yyin;

  yyin = stdin;
  if( yyparse() ){
    exit(1);
  }
}
