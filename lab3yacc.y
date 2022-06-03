%{
#include<stdio.h>
void yyerror(char *);
extern FILE *yyin;

%}

%token ID PUBLIC CLASS FINAL EXTENDS IMPLEMENTS COMMA
%%
line:
      line C '\n' {printf("Compilation Successful \n");}
       | line '\n'
       |
       |error '\n' {yyerrok;}
       ;
       
C: P F CLASS ID X Y
   ;
P: PUBLIC  |
   ;
 F: FINAL |
      ;
X:  EXTENDS ID |
   ;
   
   Y: IMPLEMENTS I |
    ;
 I: ID J
 ;
 J : COMMA I  |
 ;
 
%%
 
 void yyerror(char *s) {
 printf("%s\n", s);
 }
 
 int main() {
 
 printf("OUTPUT of Syntax Analyzer \n");
 
 FILE *myfile = fopen("input.data","r");
 
 if(!myfile) {
 printf("File can't be opened");
 } else {
 yyin = myfile;
 yyparse();
 fclose(myfile);
 }
 
 return 0;
 
 }
 
