%{
#include <stdio.h>
%}

%%
[a-z]      { printf("%c", yytext[0] - 32); }   /* lowercase → uppercase */
[A-Z]      { printf("%c", yytext[0] + 32); }   /* uppercase → lowercase */
.          { printf("%c", yytext[0]); }        /* print other characters same */
%%

int main() {
    printf("Enter text (Ctrl+D to stop):\n");
    yylex();
    return 0;
}

int yywrap() { return 1; }
