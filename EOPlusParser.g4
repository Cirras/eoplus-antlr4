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
    |   hiddenAttribute
    |   hiddenEndAttribute
    |   disabledAttribute
    ;

nameAttribute
    :   QUESTNAME StringLiteral
    ;

versionAttribute
    :   VERSION version
    ;

hiddenAttribute
    :   HIDDEN_
    ;

hiddenEndAttribute
    :   HIDDEN_END
    ;

disabledAttribute
    :   DISABLED
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
    |   if
    |   elseif
    |   else
    |   rule
    |   goal
    ;

desc
    :   DESC StringLiteral
    ;

action
    :   ACTION expression
    ;

rule
    :   RULE guard=expression expression
    ;

goal
    :   GOAL guard=expression expression
    ;

if
    :   IF guard=expression expression
    ;

elseif
    :   (ELSEIF | ELIF) guard=expression expression
    ;

else
    :   ELSE expression
    ;

argumentList
    :   LPAREN arguments? RPAREN
    ;

arguments
    :   argumentExpression (COMMA argumentExpression)*
    ;

expression
    :   invocationExpression
    |   gotoExpression
    ;

invocationExpression
    :   scopes? Identifier argumentList
    ;

gotoExpression
    :   scopes? GOTO Identifier
    ;

scopes
    :   (scope DOT)+
    ;

scope
    :   CHARACTER
    |   NPC
    |   MAP
    |   WORLD
    ;

argumentExpression
    :   literal
    ;

literal
    :   IntegerLiteral
    |   StringLiteral
    ;