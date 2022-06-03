%{
#include <stdio.h>
void yyerror(char *);
int symbol[26]; //added
%}
%token INTEGER LETTER
%left '+' '-'
%left '*' '/'
%right UnaryMinus 

%%
line:
      line stmt '\n' { }
      | line '\n'
     |
     |error '\n' {yyerror("Reenter prev line"); yyerrok;}
     ;

stmt : expr             { printf("Compilation Successful\n"); printf("The Result: %d\n", $1); }
       | LETTER '=' expr  { symbol[$1] = $3; }
       ;
expr:
	INTEGER { $$ = $1; }
	| LETTER { $$ = symbol[$1];  }
	| expr '+' expr { $$ = $1 + $3; }
	| expr '-' expr { $$ = $1 - $3; } 
	| expr '*' expr { $$ = $1 * $3; }
	| expr '/' expr                             { 
					if($3==0)
						yyerror("divide 0 error!!"); 
					else
						$$ = $1 / $3;
					}

	| '(' expr ')' { $$ = $2; }
	|'-' expr %prec UnaryMinus {$$ = - $2;}
	;
%%
void yyerror(char *s) {
printf("%s\n", s);
}
int main(void) {
printf("Enter the Expression:\n");
yyparse();
return 0;
}
