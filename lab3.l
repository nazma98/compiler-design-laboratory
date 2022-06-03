%{
#include<iostream>
using namespace std;
#include<vector>
#include<string>
#include<algorithm>
vector<string> keyword;
vector<string> ID;
vector<string> InvalidToken;

void printTokenTable();

%}

%%

"class" {keyword.push_back(yytext);}
"public" {keyword.push_back(yytext);}
"final" {keyword.push_back(yytext);}
"extends" {keyword.push_back(yytext);}
"implements" {keyword.push_back(yytext);}
"," ;  

[a-zA-Z_][a-zA-Z0-9_]* {ID.push_back(yytext);}

[ \t] ; 
. {InvalidToken.push_back(yytext);}

%%

int yywrap(void) {

return 1;
}

int main() {

FILE *myfile = fopen("/home/nazma/Desktop/compiler/input.data", "r");
//if(!myfile) {
 //   cout<<"The file can't be opened!"<<endl;
//    } else {
    yyin = myfile;
    
    yylex();
    
    fclose(myfile);
 //   }
    
    printTokenTable();
    
    return 0;
 

}


void printTokenTable() {

cout<<"Output of Lexical Analysis....."<<endl;
cout<<".............................."<<endl;

cout<<"List of Keywords : ";

sort(keyword.begin(), keyword.end() );
keyword.erase(unique ( keyword.begin(), keyword.end() ), keyword.end() );

for(int i = 0; i < keyword.size(); i++) {
cout<< keyword[i] << " ";
}
cout<<endl;
cout<<"List of Identifiers : ";

sort(ID.begin(), ID.end() );
ID.erase(unique ( ID.begin(), ID.end() ), ID.end() );

for(int i = 0; i < ID.size(); i++) {
cout<< ID[i] << " ";
}

cout<<endl;
cout<<"List of Invalid Tokens : ";

sort(InvalidToken.begin(), InvalidToken.end() );
InvalidToken.erase(unique ( InvalidToken.begin(), InvalidToken.end() ), InvalidToken.end() );

for(int i = 0; i < InvalidToken.size(); i++) {
cout<< InvalidToken[i] << " ";
}
cout<<endl;

}













