%{
#include <stdio.h>
%}

%%
.*.com$      { printf("%s\n", yytext); }
.*\n        ;     /* ignore all other lines */
%%

int main() {
    printf("Lines ending with 'com':\n\n");
    yylex();
    return 0;
}

int yywrap() { return 1; }
