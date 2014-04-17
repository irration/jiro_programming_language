#include <stdio.h>

int yyerror(char const *str)
{
  extern char *yytext;
  fprintf(stderr, "parser error near %s\n", yytext);
  return 0;
}

int main(int argc, char* argv[]){

  if( argv[1] ){
    extern int yyparse(void);
    extern FILE *yyin;
    extern FILE *file_output;

    file_output = fopen("jiro.c", "w");
    yyin = fopen(argv[1], "r");

    if( yyparse() ){
      puts("できた");
    } else {
      puts("だめぽ");
    }
    fclose(yyin);
    fclose(file_output);
  }

  return 0;

}
