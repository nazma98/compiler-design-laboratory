%{
#include<stdio.h>
void yyerror(char *s);
%}

%token INTEGER
%left '+' '-'
%left '*' '/' '%'
%right UnaryMinus

%%

line : 
      line expr '\n' {printf("%d\n",$2);}
      |line '\n'
      |
      | error '\n'  {yyerror("Re-enter the line\n"); yyerrok;}
      ;
      
expr : expr '+' expr { $$ = $1 + $3;}
      | expr '-' expr {$$ = $1 - $3;}
      | expr '*' expr {$$ = $1 * $3;}
      | expr '/' expr  {if ($3 ==0) 
                          yyerror("Can't be divided by 0\n");
                       else 
                           $$ = $1 / $3;}
      |'(' expr ')' {$$ = $2;}
      | '-' expr %prec UnaryMinus {$$ = -$2;}
      | INTEGER {$$ = $1;}
      ; 
%%    
 void yyerror(char *s) {
 printf( "%s\n",s); 
 }
 
 
int main() {
 yyparse();
   return 0; }
