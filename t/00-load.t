#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'HTML::Barcode' ) || print "Bail out!
";
}

diag( "Testing HTML::Barcode $HTML::Barcode::VERSION, Perl $], $^X" );
