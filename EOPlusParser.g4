parser grammar EOPlusParser;

options {
    tokenVocab=EOPlusLexer;
}

file
    :   block* EOF
    ;

block
    :   mainBlock
    |   stateBlock
    ;

mainBlock
    :   MAIN LBRACE mainAttribute* RBRACE
    ;

mainAttribute
    :   nameAttribute
    |   versionAttribute
    ;

nameAttribute
    :   QUESTNAME StringLiteral
    ;

versionAttribute
    :   VERSION version
    ;

version
    :   IntegerLiteral (DOT IntegerLiteral)*
    ;

stateBlock
    :   STATE Identifier LBRACE (statement | SEMI)* RBRACE
    ;

statement
    :   desc
    |   action
    |   rule
    ;

desc
    :   DESC StringLiteral
    ;

action
    :   ACTION Identifier argumentList
    ;

rule
    :   RULE Identifier argumentList GOTO Identifier
    ;

argumentList
    :   LPAREN arguments? RPAREN
    ;

arguments
    :   expression (COMMA expression)*
    ;

expression
    :   literal
    ;

literal
    :	IntegerLiteral
    |	StringLiteral
    ;