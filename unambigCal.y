%{
#include<stdio.h>
void yyerror(char *s);

%}

%token INTEGER ID
%left '+' '-'
%left '*' '/' 
%left UnaryMinus

%%

line : line expr '\n' {printf("%d\n", $2);}
      | line '\n'
      | 
      |error '\n' {yyerror("Re-enter prev. line \n"); yyerrok;}
      ;
      
expr : expr '+' term {$$ = $1 + $3;}
     | expr '-' term {$$ = $1 - $3;}
     |term
     ;
     
term : term '*' factor {$$ = $1 * $3;}
     | term '/' factor {if($3==0) 
                           printf("Can't be divided by 0\n"); 
                         else 
                            $$ = $1 / $3; }
     | factor
     ;
factor :   ID 
        | INTEGER
        | '(' expr ')'    {$$ = $2;}
        ;  

%%

void yyerror(char *s) {
     printf("%s\n", s);
     }
     
int main(){
yyparse();
return 0; }
