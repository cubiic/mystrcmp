#!perl -T

#use Test::More tests => 1;
use Test::More;

BEGIN {
    use_ok( 'MyStrCmp' ); # make sure the module can be loaded
}

diag( qq(Testing comparing strings in MyStrCmp $MyStrCmp::VERSION,\n));
diag( qq(Perl $], $^X) );

my $mycmp = MyStrCmp->new();

my $return = $mycmp->compare(a => q(abcd), b => q(abcd));
is($return, 0, q(compare with identical arguments returns '0'));

done_testing();
