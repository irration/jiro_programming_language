%{

#include <stdio.h>
#include "y.tab.h"

int yywrap(void){
  return 1;
}

%}

%start SENTENCE

%%

<INITIAL>"「" {
  BEGIN SENTENCE;
  return LP;
}

<SENTENCE>"ヌキ" {
  return NUKI;
}

<SENTENCE>"ヤサイ" {
  return YASAI;
}

<SENTENCE>"ニンニク" {
  return NINNIKU;
}

<SENTENCE>"アブラ" {
  return ABURA;
}

<SENTENCE>"カラメ" {
  return KARAME;
}

<SENTENCE>"」" {
  BEGIN INITIAL;
  return RP;
}

<SENTENCE>"全マシ" {
  return ZENMASHI;
}

<SENTENCE>"小ブタ" {
  return KOBUTA;
}

<SENTENCE>"大ブタ" {
  return OOBUTA;
}

<SENTENCE>"ダブル" {
  return DOUBLE;
}

<SENTENCE>"W" {
  return DOUBLE_I;
}

<SENTENCE>"ニンニク入れますか？" return BEGIN_CALL;

%%
