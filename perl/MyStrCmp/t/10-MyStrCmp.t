#!perl -T

#use Test::More tests => 1;
use Test::More;

BEGIN {
    use_ok( 'MyStrCmp' ); # make sure the module can be loaded
}

diag( qq(Testing the MyStrCmp module $MyStrCmp::VERSION,\n));
diag( qq(Perl $], $^X) );

my $mycmp = MyStrCmp->new();

my $str_a = q(abcd);
my $str_b = q(wxyz);
my $str_t = q(abcd); # 't' for 'test', a duplicate of 'a' for testing

my @split = $mycmp->mysplit($str_a);
is(scalar(@split), 4, q(mysplit split str_a into an array with 4 elements));

@split = $mycmp->mysplit($str_b);
is(scalar(@split), 4, q(mysplit split str_b into an array with 4 elements));

my $return = $mycmp->compare(a => $str_a, b => $str_b);
is($return, 0, q(compare with identical arguments returns '0'));

done_testing();
