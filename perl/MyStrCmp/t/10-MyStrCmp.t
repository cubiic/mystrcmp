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
my $str_e = q();
my $str_t = q(abcd); # 't' for 'test', a duplicate of 'a' for testing

my @split = $mycmp->mysplit(split_string => $str_a);
is(scalar(@split), 4, q(mysplit split str_a into an array with 4 elements));

@split = $mycmp->mysplit(split_string => $str_b);
is(scalar(@split), 4, q(mysplit split str_b into an array with 4 elements));

@split = $mycmp->mysplit(split_string => $str_e);
is(scalar(@split), 0, q(mysplit was not able to split empty string str_e));

# trap this one in an eval, as it contains a die()
eval { $return = $mycmp->compare(a => $str_a, b => $str_e) };
like($@, qr/'b' argument is an empty string/,
    q|compare() with empty string str_e returns an error|);

is($mycmp->compare(a => $str_a, b => $str_b), -1,
    q|compare() with 'a' less than 'b' returns '-1'|);

is($mycmp->compare(a => $str_b, b => $str_a), 1,
    q|compare() with 'a' greater than 'b' returns '1'|);

is($mycmp->compare(a => $str_a, b => $str_a), 0,
    q|compare() with 'a' equal to 'b' returns '0'|);

done_testing();
