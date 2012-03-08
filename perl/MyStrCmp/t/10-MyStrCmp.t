#!perl -T

#use Test::More tests => 1;
use Test::More;

BEGIN {
    use_ok( 'MyStrCmp' ); # make sure the module can be loaded
}

diag( qq(Testing the MyStrCmp module $MyStrCmp::VERSION,\n));
diag( qq(Perl $], $^X) );

my $mycmp = MyStrCmp->new();

my $str_a = q(abcdef);
my $str_b = q(uvwxyz);
my $str_e = q();

my @split = $mycmp->mysplit(split_string => $str_a);
is(scalar(@split), 6, q(mysplit split str_a into an array));

@split = $mycmp->mysplit(split_string => $str_b);
is(scalar(@split), 6, q(mysplit split str_b into an array));

@split = $mycmp->mysplit(split_string => $str_e);
is(scalar(@split), 0, q(mysplit shouldn't split an empty string));

# trap this one in an eval, as it contains a die()
eval { $return = $mycmp->compare(a => $str_a, b => $str_e) };
like($@, qr/'b' argument is an empty string/,
    q|compare() with empty string str_e returns an error|);

# inverting strings
my $invert_a = q(abcdef);
my $invert_b = q(uvwxyz);
my $short_b = q(wxyz);

is($mycmp->invert(invert_string => $invert_a), q(fedcba),
    q|calling invert() returns the inverted string|);

is($mycmp->zipper(a => $invert_a, b => $invert_b), q(aubvcwdxeyfz),
    q|calling zipper() returns the combined string|);

is($mycmp->zipper(a => $invert_a, b => $short_b), q(awbxcydzef),
    q|calling zipper() returns the combined string with a short b arg|);

is($mycmp->zipper(
    a => $mycmp->invert(invert_string => $invert_a),
    b => $mycmp->invert(invert_string => $invert_b)),
    q(fzeydxcwbvau),
    q|calling zipper() on inverted strings returns the combined |
    . q|inverted strings|
);

# comparing strings
is($mycmp->compare(a => $str_a, b => $str_b), -1,
    q|compare() with 'a' less than 'b' returns '-1'|);

is($mycmp->compare(a => $str_a, b => $str_a), 0,
    q|compare() with 'a' equal to 'b' returns '0'|);

is($mycmp->compare(a => $str_b, b => $str_a), 1,
    q|compare() with 'a' greater than 'b' returns '1'|);

done_testing(12);
