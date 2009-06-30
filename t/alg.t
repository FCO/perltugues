#!perl -T

use Test::More tests => 1;

BEGIN {
        use_ok( 'perltugues' );
        }

use perltugues;

inteiro: i, j;

texto: k;

inteiro: l;

para i (de 1 a 100 a cada 5) {
   escreva i, quebra de linha;
   k = "lalala";
   escreva k, quebra de linha;
   escreva j, quebra de linha;
}

enquanto(i >= j){
   escreva 'i e j => ', i, " >= ", j++, quebra de linha;
}

escreva quebra de linha;

escreva de 0 a 50 a cada 10, quebra de linha;

diag( "Testing perltugues $perltugues::VERSION, Perl $], $^X" );
