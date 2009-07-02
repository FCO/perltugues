#!perl

use Test::More tests => 33;

BEGIN {
        use_ok( 'perltugues' );
}

sub tira_espacos {
   ${$_[0]} =~ s/\s//g;
}

my $ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'escreva "teste";'`;
tira_espacos \$ret;

is($ret, qq|usestrict;print("teste");|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'se 1 == 1 {}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;if(1==1){}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'enquanto 1 == 1 {}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;while(1==1){}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ate que 1 == 1 {}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

SKIP: {
   skip "Não reconhece \"é\"", 1 if "é" =~ /é/;
   $ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'até que 1 == 1 {}'`;
   tira_espacos \$ret;

   is($ret, qq|usestrict;until(1==1){}|);
}

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ateh que 1 == 1 {}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ate q 1 == 1 {}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

SKIP: {
   skip "Não reconhece \"é\"", 1 if "é" =~ /é/;
   $ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'até q 1 == 1 {}'`;
   tira_espacos \$ret;

   is($ret, qq|usestrict;until(1==1){}|);
}

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ateh q 1 == 1 {}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ate 1 == 1 {}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

SKIP: {
   skip "Não reconhece \"é\"", 1 if "é" =~ /é/;
   $ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'até 1 == 1 {}'`;
   tira_espacos \$ret;

   is($ret, qq|usestrict;until(1==1){}|);
}
   
$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ateh 1 == 1 {}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'de 1 a 10;'`;
tira_espacos \$ret;

is($ret, qq|usestrict;1..10;|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'de 1 a 10 a cada 2;'`;
tira_espacos \$ret;

is($ret, qq|usestrict;map({(\$_*2)+1}0..(int(10/2)-(1?1:0)));|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'de 1 a 10 para cada 2;'`;
tira_espacos \$ret;

is($ret, qq|usestrict;map({(\$_*2)+1}0..(int(10/2)-(1?1:0)));|);

TODO: {
   local $TODO = "Algo errado";
   $ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'inteiro: i; para i (de 1 a 10 para cada 2){}'`;
   tira_espacos \$ret;
   
   is($ret, q|useperltugues::inteiro;usestrict;my$i=perltugues::inteiro->new;for(map({($_*2)+1}0..(int(10/2)-(1?1:0)))){$i->vale($_);}|);
}

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'inicio$/fim'`;
tira_espacos \$ret;

is($ret, qq|usestrict;{}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'escreva("teste");'`;
tira_espacos \$ret;

is($ret, qq|usestrict;print("teste");|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'se(1 == 1){}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;if(1==1){}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'enquanto(1 == 1){}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;while(1==1){}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ate que(1 == 1){}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

SKIP: {
   skip "Não reconhece \"é\"", 1 if "é" =~ /é/;
   $ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'até que(1 == 1){}'`;
   tira_espacos \$ret;

   is($ret, qq|usestrict;until(1==1){}|);
}

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ateh que(1 == 1){}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ate q(1 == 1){}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

SKIP: {
   skip "Não reconhece \"é\"", 1 if "é" =~ /é/;
   $ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'até q(1 == 1){}'`;
   tira_espacos \$ret;

   is($ret, qq|usestrict;until(1==1){}|);
}

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ateh q(1 == 1){}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ate(1 == 1){}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

SKIP: {
   skip "Não reconhece \"é\"", 1 if "é" =~ /é/;
   $ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'até(1 == 1){}'`;
   tira_espacos \$ret;

   is($ret, qq|usestrict;until(1==1){}|);
}
   
$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'ateh(1 == 1){}'`;
tira_espacos \$ret;

is($ret, qq|usestrict;until(1==1){}|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e '(de 1 a 10);'`;
tira_espacos \$ret;

is($ret, qq|usestrict;(1..10);|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e '(de 1 a 10 a cada 2);'`;
tira_espacos \$ret;

is($ret, qq|usestrict;(map({(\$_*2)+1}0..(int(10/2)-(1?1:0))));|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e '(de 1 a 10 para cada 2);'`;
tira_espacos \$ret;

is($ret, qq|usestrict;(map({(\$_*2)+1}0..(int(10/2)-(1?1:0))));|);




