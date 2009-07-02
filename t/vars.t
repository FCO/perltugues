#!perl

use Test::More tests => 12;

use perltugues;

my $ret = `$^X -Ilib -Mperltugues -e 'escreva "teste";'`;
chomp $ret;

is($ret, "teste");

inteiro: i;

is(defined $i, 1);

i = 42;

is($i, 42);

eval q|$i->vale("teste")|;

chomp $@;

is($@, q|"teste" Não é Inteiro|);

caracter: c;

is(defined $c, 1);

c = "c";

is($c, "c");

eval q|$c->vale("teste")|;

chomp $@;

is($@, q|"teste" Não é um Caracter|);

real: r;

is(defined $r, 1);

r = 3.14;

is($r, 3.14);

eval q|$r->vale("teste")|;

chomp $@;

is($@, q|"teste" Não é Real!|);

texto: t;

is(defined $t, 1);

t = "Resposta sobre a vida, o universo e tudo mais";

is($t, "Resposta sobre a vida, o universo e tudo mais");



