%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s);
%}

%token FOR ID NUM RELOP

%%

S   : FOR '(' INIT ';' COND ';' INCR ')'  { printf("\nValid FOR loop syntax\n"); }
    ;

INIT : ID '=' NUM
    ;

COND : ID RELOP NUM
    ;

INCR : ID '++'
     | ID '--'
     | ID '=' ID '+' NUM
     | ID '=' ID '-' NUM
     ;

%%

void yyerror(char *s) {
    printf("\nInvalid FOR loop syntax!\n");
}

int main() {
    printf("Enter FOR loop: ");
    yyparse();
    return 0;
}
