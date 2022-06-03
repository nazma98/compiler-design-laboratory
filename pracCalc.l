%{
#include<stdlib.h>
#include "y.tab.h"

%}

%%
[0-9]+ {
yylval = atoi(yytext);
return INTEGER;
}

[ \t]+ ;
.|\n {return yytext[0];}
%%

int yywrap() {

return 1;
}
