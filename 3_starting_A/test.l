%{
#include <stdio.h>
int count = 0;
%}

%%
[Aa][A-Za-z]*    { printf("%s\n", yytext); count++; }
[ \t\n]+         ;      /* ignore whitespace */
.                ;      /* ignore everything else */
%%

int main() {
    printf("Words starting with A/a:\n");
    yylex();
    printf("\nTotal words starting with A/a = %d\n", count);
    return 0;
}

int yywrap() { return 1; }
