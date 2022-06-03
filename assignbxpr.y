%{ 
#include<stdio.h> 
#include<stdlib.h> 
int yylex(); 
%} 
%token ALPHA AND OR NOT TRUE FALSE boolean 
%left "&" "|" 
%right '!' 
%% 

program: bexpr 'n' {if ($1 >= 1)
                        printf("TRUEn"); exit(0); 
                     else printf("FALSEn"); exit(0); } 
        | 
        ; 
bexpr: bexpr "|""|" bterm { $$ = $1 || $3; } 
     | bterm { $$ = $1; } 
     ; 
bterm: bterm "&""&" bfactor { $$ = $1 && $3; } 
     | bfactor { $$ = $1; } 
     ; 
bfactor: '!' bfactor { $$ = ! $2; } 
        | '(' bexpr ')' { $$ = $2; } 
        | TRUE { $$ = $1; } 
        | FALSE {$$ = $1; } 
        | boolean { $$ = $1; } 
        ; 
%% 

int main() 
{ 
printf("Enter your truth statementn"); 
yyparse(); 
return 0; 
}
