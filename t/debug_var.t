#!perl

use Test::More tests => 9;

BEGIN {
        use_ok( 'perltugues' );
}

sub tira_espacos {
   ${$_[0]} =~ s/\s//g;
}

my $ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e ''`;
tira_espacos \$ret;

is($ret, "usestrict;");

my @types = qw/real inteiro caracter texto/;

for my $tipo (@types){

   $ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e '$tipo: i;'`;
   tira_espacos \$ret;

   is($ret, qq|useperltugues::$tipo;usestrict;my\$i=perltugues::$tipo->new;|);
}

my $nome = "a";

my $code = qq|$^X -Ilib -M"perltugues DEBUG => 1" -e '|;

$code .= join "; ", map {"$_: " . $nome++} @types;

$code .= ";'";

diag($code);

$ret = `$code`;

tira_espacos \$ret;

my $ex = 
q|useperltugues::real;useperltugues::caracter;useperltugues::inteiro;useperltugues::texto;usestrict;my$a=perltugues::real->new;my$b=perltugues::inteiro->new;my$c=perltugues::caracter->new;my$d=perltugues::texto->new;|;

is($ret, $ex);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'inteiro: i, j;'`;
tira_espacos \$ret;

is($ret,qq|useperltugues::inteiro;usestrict;my\$i=perltugues::inteiro->new;my\$j=perltugues::inteiro->new;|);

$ret = `$^X -Ilib -M"perltugues DEBUG => 1" -e 'inteiro: i;$/i = 2;'`;
tira_espacos \$ret;

is($ret,qq|useperltugues::inteiro;usestrict;my\$i=perltugues::inteiro->new;\$i->vale(2);|);



