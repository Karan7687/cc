%{
#include "y.tab.h"
%}

FOR        [Ff][Oo][Rr]
ID         [a-zA-Z_][a-zA-Z0-9_]*
NUM        [0-9]+
RELOP      "<"|">"|"=="|"<="|">="|"!="

%%

{FOR}              { return FOR; }
{ID}               { yylval = 0; return ID; }
{NUM}              { return NUM; }
{RELOP}            { return RELOP; }
"++"               { return yytext[0]; }
"--"               { return yytext[0]; }
"="                { return yytext[0]; }
"("                { return yytext[0]; }
")"                { return yytext[0]; }
";"                { return yytext[0]; }
"{"|"}"            { return yytext[0]; }

[ \t\n]            ;   /* ignore whitespace */

.                  { return yytext[0]; }

%%

int yywrap() { return 1; }
