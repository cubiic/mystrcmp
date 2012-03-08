#!perl -T

#use Test::More tests => 1;
use Test::More;

BEGIN {
    use_ok( 'MyStrCmp' ); # make sure the module can be loaded
}

diag( qq(Testing comparing strings in MyStrCmp $MyStrCmp::VERSION,\n));
diag( qq(Perl $], $^X) );

my $mycmp = MyStrCmp->new();

my $str_a = q(abcd);
my $str_a_longer = q(abcdefgh);
my $str_b = q(wxyz);
my $str_b_shorter = q(wx);
my $str_e = q();

is($mycmp->compare(a => $str_a, b => $str_b), -1,
    q|compare() with 'a' less than 'b' returns '-1'|);

is($mycmp->compare(a => $str_a_longer, b => $str_b_shorter), -1,
    q|compare() with longer 'a' less than shorter 'b' returns '-1'|);

is($mycmp->compare(a => $str_b_shorter, b => $str_b), -1,
    q|compare() with shorter 'b' less than 'b' returns '-1'|);

isnt($mycmp->compare(a => $str_b_shorter, b => $str_b), 1,
    q|compare() with shorter 'b' less than 'b' doesn't return '1'|);

is($mycmp->compare(a => $str_b, b => $str_a), 1,
    q|compare() with 'a' greater than 'b' returns '1'|);

is($mycmp->compare(a => $str_a_longer, b => $str_a), 1,
    q|compare() with longer 'a' greater than 'a' returns '1'|);

is($mycmp->compare(a => $str_b, b => $str_b_shorter), 1,
    q|compare() with 'b' greater than shorter 'b' returns '1'|);


is($mycmp->compare(a => $str_a, b => $str_a), 0,
    q|compare() with 'a' equal to 'b' returns '0'|);

done_testing();
