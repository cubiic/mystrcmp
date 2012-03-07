#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'MyStrCmp' );
}

diag( "Testing MyStrCmp $MyStrCmp::VERSION, Perl $], $^X" );
