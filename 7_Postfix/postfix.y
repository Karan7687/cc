%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(char *s);

%}

%token NUM

%%

E : E E '+'   { printf("%d\n", $1 + $2); }
  | E E '-'   { printf("%d\n", $1 - $2); }
  | E E '*'   { printf("%d\n", $1 * $2); }
  | E E '/'   { 
        if ($2 == 0) { 
            printf("Error: Division by zero\n"); 
            exit(1); 
        }
        printf("%d\n", $1 / $2); 
    }
  | NUM        { $$ = $1; }
  ;

%%

void yyerror(char *s) {
    printf("Invalid Expression\n");
}

int main() {
    printf("Enter Postfix Expression: ");
    yyparse();
    return 0;
}
