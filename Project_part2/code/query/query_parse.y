// Define the tokens


%token SPACE
%token ASSIGN
%token PLUS
%token RIGHTARROW
%token LEFTARROW
%token DOUBLEARROW
%token LINE
%token MINUS
%token MUL
%token DIV
%token COMMA
%token DOT
%token LT
%token GT
%token LTE
%token GTE
%token NOT
%token POW
%token LPARAM
%token RPARAM
%token LBRACE
%token RBRACE
%token LBRACKET
%token RBRACKET
%token DIGIT
%token LETTER
%token NEWLINE
%token NONSTAR
%token NONSTARNONDIV
%token NONNEWLINE
%token UNDERSCORE
%token STRING
%token BOOL
%token SET
%token ID
%token INT
%token FLOAT
%token ENDSTMT
%token COMMENT
%token ONEWAYSTREET
%token TWOWAYSTREET
%token POINT
%token ROAD
%token QUESTION
%token AND
%token OR
%token CONSTANT
%token STREETNETWORK


// Define the union that can hold different values for the tokens
 
%union 
{
  char * string;
  int integer;
}

// Define the token value types

%type <string> ID
// define associativity of operations

%left PLUS MINUS // the order defines precedence, 
%left STAR DIV // so * and / has higher precedence than + and -

%{ 
  #include <iostream> 
  #include <string>
  using namespace std;
  // forward declarations
  extern int yylineno;
  void yyerror(string);
  int yylex(void);
  int numoferr;
  
%}

%%

program:
	query_list

query_list:
	ID query query_list | assignments query_list | ID ASSIGN query_unit_list ENDSTMT query_list | ID ASSIGN query_expression ENDSTMT query_list | query {yyerror("Specify the network name to query");} |

query: 
	QUESTION query_unit_list ENDSTMT |  QUESTION query_expression ENDSTMT  |  error_ query_unit_list ENDSTMT {yyerror("Use \"?\" to query a path");}

query_unit_list:
	query_unit query_unit_list | 

query_unit:
	road_query | point_query | property_checking {yyerror("Specify your query with \"<>\" or \"[]\"");}
	
road_query:
	LT property_checking GT
	
point_query:
	LBRACKET property_checking RBRACKET

query_expression:
	ID | ID ID | ID OR ID

property_checking:
	conditional operator expr | BOOL | ID operator expr {yyerror("Property names should be in \" \"");}

conditional:
	STRING | ID LPARAM STRING RPARAM
expr:
	STRING | INT | FLOAT | ID arithmetic ID | ID | CONSTANT ID
	
operator:
	ASSIGN ASSIGN | LT | GT | LTE | GTE | arithmetic {yyerror("Boolean expression is expected for queries");}

arithmetic:
	PLUS | MINUS | DIV | MUL 

assignments:
	ID ASSIGN INT ENDSTMT;
	
error_:
	NOT | AND | OR 
%%

// report errors
extern int yylineno;
void yyerror(string s) 
{
	numoferr++;
	cout << "error at line " << yylineno << ": " << s << endl;
}
int main()
{
	numoferr=0;
	yyparse();
	if(numoferr>0) {
		cout << "Parsing completed with " << numoferr << " errors" <<endl;
	} else {
		cout << "Successfully parsed" <<endl;
	}
	return 0;
}

