#!perl
use utf8;
use Test::More tests => 24;

use perltugues;

my $ret = `$^X -Ilib -Mperltugues -e 'escreva "teste";'`;
chomp $ret;

is("teste", $ret);

se 1 == 1 {
   ok(1);
}

se 1 == 1 {
   ok(1);
}senao{
   ok(0);
}

se 1 == 0 {
   ok(0);
}senao{
   ok(1);
}

para(de 1 a 10){
   ok(1, "test para $_");
}

inteiro: i;

i = 1;

enquanto i <= 10 {
   ok(1, "teste enquanto $i");
   i++;
}
