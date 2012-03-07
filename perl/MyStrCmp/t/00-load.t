#!perl -T

use Test::More tests => 2;

BEGIN {
    use_ok( 'MyStrCmp' );
}

diag( "Testing edge conditions in MyStrCmp $MyStrCmp::VERSION,\nPerl $], $^X" );

my $mycmp = MyStrCmp->new();
isa_ok($mycmp, q(MyStrCmp));
