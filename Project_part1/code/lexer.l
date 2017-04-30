
SPACE [ \t]+
ASSIGN =
PLUS \+
MINUS -
MUL \*
DIV \/
COMMA ,
DOT \.
LT <
GT >
LTE <=
GTE >=
NOT !
POW \^
LPARAM \(
RPARAM \)
LBRACE \{
RBRACE \}
LBRACKET \[
RBRACKET \]
DIGIT [0-9]
LETTER [a-zA-Z]
NEWLINE \n
NONSTAR [^\*]
NONSTARNONDIV [^\*/]
NONNEWLINE [^\n]
UNDERSCORE _
STRING \"([^\\\"]|\\\\|\\\"|\\t|\\n)*\"
BOOL true|false
ID ({LETTER}|{UNDERSCORE})({LETTER}|{DIGIT}|{UNDERSCORE})*
INT ({MINUS}|{PLUS})?{DIGIT}+
FLOAT {INT}"."{DIGIT}+
COMMENT {DIV}{DIV}{NONNEWLINE}*{NEWLINE}|{DIV}\*({NONSTAR}|\*+{NONSTARNONDIV})*\*+{DIV}
QUESTION \?
AND &&
OR \|\|
ENDSTMT ;
RIGHTWAY ->
LEFTWAY <-
TWOWAY <->
LINE ---
ONEWAYSTREET onewayStreet
TWOWAYSTREET twowayStreet
POINT point
STREETNETWORK streetnetwork


%%
{QUESTION} return QUESTION;
{AND} return AND;
{OR} return OR;
{DOT} return DOT;
{SPACE} ;
{COMMENT} ;
{COMMA} return COMMA;
{NEWLINE} ;
{ENDSTMT} return ENDSTMT;
{ASSIGN} return ASSIGN;
{NOT} return NOT;
{LTE} return LTE;
{GTE} return GTE;
{LT} return LT;
{GT} return GT;
{POW} return POW;
{LBRACE} return LBRACE;
{RBRACE} return RBRACE;
{PLUS} return PLUS;
{MINUS} return MINUS;
{MUL} return STAR;
{DIV} return DIV;
{LPARAM} return LPARAM;
{RPARAM} return RPARAM;
{LBRACKET} return LBRACKET;
{RBRACKET} return RBRACKET;
{STRING} return STRING;
{BOOL} return BOOL;
{INT} return INT;
{FLOAT} return FLOAT;
{ID} return ID;
{RIGHTWAY} return RIGHTWAY;
{LEFTWAY} return LEFTWAY;
{TWOWAY} return TWOWAY;
{LINE} return LINE;
{ONEWAYSTREET} return ONEWAYSTREET;
{TWOWAYSTREET} return TWOWAYSTREET;
{POINT} return POINT;
{STREETNETWORK} return STREETNETWORK;
%%

int yywrap()
{
	return 1;
}


