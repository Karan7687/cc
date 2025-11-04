%{
#include <stdio.h>
#include <string.h>
int line = 0, space = 0, word = 0, comment = 0, identifier = 0, keyword = 0;

char* keywords[] = {
    "int", "float", "char", "if", "else", "while", "for", "do", "return",
    "break", "continue", "void", "static", "struct", "double", "long", "short",
    "switch", "case", "default", "const", "unsigned", "signed", "enum", "goto", "sizeof"
};

int is_keyword(char* str) {
    for (int i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if (strcmp(str, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%

"/"([^]|\+[^/])\+"/"     { comment++; }
"//".*                        { comment++; }
[ \t]+                       { space += yyleng; }
\n                           { line++; }
[A-Za-z_][A-Za-z0-9_]*       {
                                word++;
                                if (is_keyword(yytext))
                                    keyword++;
                                else
                                    identifier++;
                             }
.                            { /* Ignore other char */ }

%%

int main() {
    yylex();
    printf("Lines      = %d\n", line);
    printf("Words      = %d\n", word);
    printf("Spaces     = %d\n", space);
    printf("Comments   = %d\n", comment);
    printf("Keywords   = %d\n", keyword);
    printf("Identifiers= %d\n", identifier);
    return 0;
}

int yywrap() { return 1; }