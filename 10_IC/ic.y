%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(char *s);

int tempCount = 1;
char temp[10];

char *newtemp() {
    sprintf(temp, "t%d", tempCount++);
    return strdup(temp);
}
%}

%union {
    char *str;
}

%token <str> ID NUM
%type <str> E

%left '+' '-'
%left '*' '/'
%right '='

%start S

%%

S   : E '\n'      { printf("\nIntermediate Code Generated Successfully\n"); }
    ;

E   : ID '=' E    { printf("%s = %s\n", $1, $3); $$ = $1; }
    | E '+' E     { char *t = newtemp(); printf("%s = %s + %s\n", t, $1, $3); $$ = t; }
    | E '-' E     { char *t = newtemp(); printf("%s = %s - %s\n", t, $1, $3); $$ = t; }
    | E '*' E     { char *t = newtemp(); printf("%s = %s * %s\n", t, $1, $3); $$ = t; }
    | E '/' E     { char *t = newtemp(); printf("%s = %s / %s\n", t, $1, $3); $$ = t; }
    | '(' E ')'   { $$ = $2; }
    | ID          { $$ = $1; }
    | NUM         { $$ = $1; }
    ;

%%

void yyerror(char *s) {
    printf("Invalid Expression!\n");
}

int main() {
    printf("Enter expression: ");
    yyparse();
    return 0;
}
