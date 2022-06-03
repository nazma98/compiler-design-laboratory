%{
#include <stdio.h>
void yyerror(char *);
int symbol[26]; //added
%}
%token INTEGER LETTER

%%
line:
      line stmt '\n' {  }
      | line '\n'
     |
     |error '\n' {yyerror("Reenter prev line"); yyerrok;}
     ;

stmt : expr             {printf("Compilation Successful\n"); printf("The Result is: %d\n", $1);}
      | LETTER '=' expr  { symbol[$1] = $3; }
      ;

expr : expr '+' term {$$ = $1 + $3;}
     | expr '-' term {$$ = $1 - $3;}
     | term
     ;

term : term '*' factor {$$ = $1 * $3;}
      | term '/' factor   { 
			   if($3==0)
				yyerror("divide 0 error!!"); 
			    else
				$$ = $1 / $3;
			   }
     | factor
     ;

factor : '(' expr ')' {$$ = $2;}
        |'-' factor {$$ = - $2;}
        | INTEGER { $$ = $1; }
        | LETTER { $$ = symbol[$1];  }
        ;

%%
void yyerror(char *s) {
printf("%s\n", s);
}
int main(void) {
yyparse();
return 0;
}
