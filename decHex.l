digit [0-9]
hex [A-F] 
%%
{digit}+|{digit}+[.]{digit}+ {printf("Decimal Number.");}
{digit}*{hex}*{digit}* {printf("Hexadecimal Number."); }
%%
int main(int argc, char** argv) {
yylex();
return 0;
}
