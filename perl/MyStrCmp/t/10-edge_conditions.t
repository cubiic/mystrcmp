#!perl -T

use Test::More tests => 4;

BEGIN {
    use_ok( 'MyStrCmp' ); # make sure the module can be loaded
}

diag( "Testing edge conditions in MyStrCmp $MyStrCmp::VERSION,\nPerl $], $^X" );

my $mycmp = MyStrCmp->new();
eval { $mycmp->compare() };
like($@, qr/^Missing 'a' argument/, q|call compare() with no args fails|);

eval { $mycmp->compare(a => q(abcd)) };
like($@, qr/^Missing 'b' argument/, q|call compare() with only 'a' arg fails|);

eval { $mycmp->compare(b => q(wxyz)) };
like($@, qr/^Missing 'a' argument/, q|call compare() with only 'b' arg fails|);
