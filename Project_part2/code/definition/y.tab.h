/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    SPACE = 258,
    ASSIGN = 259,
    PLUS = 260,
    RIGHTARROW = 261,
    LEFTARROW = 262,
    DOUBLEARROW = 263,
    LINE = 264,
    MINUS = 265,
    MUL = 266,
    DIV = 267,
    COMMA = 268,
    DOT = 269,
    LT = 270,
    GT = 271,
    LTE = 272,
    GTE = 273,
    NOT = 274,
    POW = 275,
    LPARAM = 276,
    RPARAM = 277,
    LBRACE = 278,
    RBRACE = 279,
    LBRACKET = 280,
    RBRACKET = 281,
    DIGIT = 282,
    LETTER = 283,
    NEWLINE = 284,
    NONSTAR = 285,
    NONSTARNONDIV = 286,
    NONNEWLINE = 287,
    UNDERSCORE = 288,
    STRING = 289,
    BOOL = 290,
    SET = 291,
    ID = 292,
    INT = 293,
    FLOAT = 294,
    ENDSTMT = 295,
    COMMENT = 296,
    ONEWAYSTREET = 297,
    TWOWAYSTREET = 298,
    POINT = 299,
    ROAD = 300,
    QUESTION = 301,
    AND = 302,
    OR = 303,
    STREETNETWORK = 304,
    STAR = 305
  };
#endif
/* Tokens.  */
#define SPACE 258
#define ASSIGN 259
#define PLUS 260
#define RIGHTARROW 261
#define LEFTARROW 262
#define DOUBLEARROW 263
#define LINE 264
#define MINUS 265
#define MUL 266
#define DIV 267
#define COMMA 268
#define DOT 269
#define LT 270
#define GT 271
#define LTE 272
#define GTE 273
#define NOT 274
#define POW 275
#define LPARAM 276
#define RPARAM 277
#define LBRACE 278
#define RBRACE 279
#define LBRACKET 280
#define RBRACKET 281
#define DIGIT 282
#define LETTER 283
#define NEWLINE 284
#define NONSTAR 285
#define NONSTARNONDIV 286
#define NONNEWLINE 287
#define UNDERSCORE 288
#define STRING 289
#define BOOL 290
#define SET 291
#define ID 292
#define INT 293
#define FLOAT 294
#define ENDSTMT 295
#define COMMENT 296
#define ONEWAYSTREET 297
#define TWOWAYSTREET 298
#define POINT 299
#define ROAD 300
#define QUESTION 301
#define AND 302
#define OR 303
#define STREETNETWORK 304
#define STAR 305

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 56 "definition_parse.y" /* yacc.c:1909  */

  char * string;
  int integer;

#line 159 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
