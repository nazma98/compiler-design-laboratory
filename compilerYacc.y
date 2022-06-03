%{ 
#include<stdio.h> 
   void yyerror(char *);
  
%} 
%token ALPHA AND OR NOT TRUE FALSE BOOLEAN 
%left AND OR 
%right NOT
%%
program:bexpr '\n'{
                         if ($1 >= 1)
			    { printf("TRUE");} 
                        else
			    { printf("FALSE");}
                       }  
	   | error '\n' {yyerror("Reenter previous line"); yyerrok;}
	   |
	   ;
bexpr: bexpr OR bterm { $$ = $1 || $3; } 
| bterm { $$ = $1; } ;
bterm: bterm AND bfactor { $$ = $1 && $3; } 
| bfactor { $$ = $1; } ;
bfactor: NOT bfactor { $$ = ! $2; } 
| '(' bexpr ')' { $$ = $2; } 
| TRUE { $$ = $1; } 
| FALSE {$$ = $1; }
| BOOLEAN { $$ = $1; } 
;
%%
void yyerror(char *s)
{
printf("%s\n", s);
}
int main(void)
{ 
printf("Enter your truth statement\n");
yyparse();
return 0; }
