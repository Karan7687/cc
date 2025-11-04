%{
#include "y.tab.h"
#include <string.h>
%}

ID      [a-zA-Z][a-zA-Z0-9]*
NUM     [0-9]+

%%

{ID}            { yylval.str = strdup(yytext); return ID; }
{NUM}           { yylval.str = strdup(yytext); return NUM; }
[+\-*/=() ]     { return yytext[0]; }
[\n]            { return '\n'; }
[ \t]           ;
.               { return yytext[0]; }

%%

int yywrap() { return 1; }
