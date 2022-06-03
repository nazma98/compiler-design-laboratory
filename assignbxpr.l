%{ 
#include "y.tab.h" 
%}
AND [Aa][Nn][Dd]
OR [Oo][Rr] 
NOT [Nn][Oo][Tt] 
op '&' | '|' | "!" 
%% 
[a-zA-Z] {return ALPHA;} 
[t]+ ; 
[n] {return 'n';} 
{AND} { return (AND); } 
{OR} { return (OR); } 
{NOT} { return (NOT); } 
[Tt][Rr][Uu][Ee] { yylval = 1; return (boolean); } 
[Ff][Aa][Ll][Ss][Ee] { yylval = 0; return (boolean); } 
. {();} 
%%

