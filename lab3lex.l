%{
#include<stdlib.h>
#include "y.tab.h"
%}
%%

"class" {return CLASS;}
"public" {return PUBLIC; }
"final" {return FINAL;}
"extends" {return EXTENDS;}
"implements" {return IMPLEMENTS;}
"," {return COMMA;}

[a-zA-Z_][a-zA-Z0-9_]* { return ID;}

[ \t] ; 
.|\n {return yytext[0];}
%%

int yywrap() {
return 1;
}


