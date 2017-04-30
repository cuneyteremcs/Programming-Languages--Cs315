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

program :
	definition_list

definition_list:
	definition definition_list |

definition:
	twowaystreet_definition | onewaystreet_definition | ID LBRACE ud_graph RBRACE {yyerror("Specify the type of graph: onewaystreet or twowaystreet");}

twowaystreet_definition:
    TWOWAYSTREET ID LBRACE ud_graph RBRACE | TWOWAYSTREET ID LBRACE ud_graph {yyerror("There is an unmatched brace");}

onewaystreet_definition:
	ONEWAYSTREET ID LBRACE d_graph RBRACE | ONEWAYSTREET ID LBRACE d_graph {yyerror("There is an unmatched brace");}
	
ud_graph:
	ud_unit_list
	
d_graph:
	d_unit_list 

ud_unit_list:
	ud_unit ud_unit_list | 
	
d_unit_list:
	d_unit d_unit_list |

ud_unit:
	pre_ud_unit ENDSTMT | pre_ud_unit {yyerror("expected ';'");} |  point_definition

pre_ud_unit:
	POINT id_list | road_definition | point_road_property_addition 
	
d_unit:
	pre_d_unit ENDSTMT | pre_d_unit {yyerror("expected ';'");} |  point_definition

pre_d_unit:
	POINT id_list  | road_definition | point_road_property_addition 

point_road_property_addition:
	ID DOT STRING ASSIGN expr  | LPARAM ID arrow ID RPARAM DOT STRING ASSIGN expr 



road_definition:
	ROAD ID LBRACE property_list RBRACE | ROAD id_list  | ROAD ID ASSIGN ID LINE ID  | ID id_tail | ID ASSIGN ID LINE ID  | ID ASSIGN ID arrow ID 

id_tail:
	LINE ID id_tail | 
	
point_definition:
		POINT ID LBRACE property_list RBRACE | ID LBRACE property_list RBRACE {yyerror("You have to specify the type of definition: road or point");} 

id_list:
	ID id_list_tail 

id_list_tail:
	COMMA ID id_list_tail  |

property_list:
	property property_list |

property:
		STRING ASSIGN expr ENDSTMT | ID ASSIGN expr ENDSTMT {yyerror("String is expected as property name");} 



arrow:
		LEFTARROW | RIGHTARROW | DOUBLEARROW
		

	
expr:
	ID | STRING | INT | FLOAT | BOOL | SET LBRACKET set_elements RBRACKET

set_elements:
	expr set_elements_tails

set_elements_tails:
	COMMA expr set_elements_tails |

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

