%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s);
%}

%token NUM

%%
input:
      /* empty */
    | input line
    ;

line:
      expr '\n'      { printf("= %d\n", $1); }
    | error '\n'     { printf("Syntax Error! Skipping line...\n"); yyerrok; }
    ;

expr:
      expr '+' expr  { $$ = $1 + $3; }
    | expr '-' expr  { $$ = $1 - $3; }
    | expr '*' expr  { $$ = $1 * $3; }
    | expr '/' expr  {
            if ($3 == 0) {
                printf("Error: Division by zero!\n");
                $$ = 0;
            } else $$ = $1 / $3;
        }
    | '(' expr ')'   { $$ = $2; }
    | NUM            { $$ = $1; }
    ;

%%

void yyerror(char *s) {
    printf("Invalid expression!\n");
}

int main() {
    printf("Enter expressions (Ctrl+C to exit)\n");
    yyparse();
    return 0;
}
