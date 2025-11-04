%{
#include <stdio.h>

void toHex(int n) {
    char hex[20];
    int i = 0, rem;
    if(n == 0){ printf("0"); return; }
    while(n > 0) {
        rem = n % 16;
        if(rem < 10) hex[i] = rem + '0';
        else hex[i] = rem - 10 + 'A';
        n /= 16;
        i++;
    }
    while(i--) printf("%c", hex[i]);
}
%}

%%
[0-9]+    {
             int num = 0, i = 0;
             while(yytext[i] != '\0') {
                 num = num*10 + (yytext[i] - '0');
                 i++;
             }
             printf("0x");
             toHex(num);
          }

.         { printf("%c", yytext[0]); }

%%

int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }
