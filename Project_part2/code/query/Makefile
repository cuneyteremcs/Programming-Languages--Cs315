PROG   = query_parser

all1: lexer parser
	g++ y.tab.c lex.yy.c -o query_parser
	
lexer: scan.l
	flex scan.l

parser: query_parse.y
	yacc -d query_parse.y

test: input
	cat input | ./$(PROG)

