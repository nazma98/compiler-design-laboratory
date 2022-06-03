%{
	#include<stdio.h>
	void yyerror(char *);
%}


%token INTEGER
%left '+' '-'
%left '*' '/'
%right UnaryMinus

%% 
line: line expr '\n' {printf("%d\n",$2);}
      | line '\n'
      |
      | error '\n' {yyerror("Reenter previous line"); yyerrok;}
      ;

expr: expr '+' expr {$$ = $1 + $3;}
      |expr '-' expr {$$ = $1 - $3;}
      |expr '*' expr {$$ = $1 * $3;}
      |expr '/' expr {if($3==0)
                       yyerror("divide 0 error!!");
		      else
		       $$ = $1 / $3;
		       }
      |'(' expr ')' expr {$$ = $2;}
      |'-' expr %prec UnaryMinus {$$ = -$2;}
      |INTEGER {$$ = $1;}
      ;



%%
void yyerror(char *s)
{
printf("%s\n", s);
}
int main(void)
{
yyparse();
return 0;
}
