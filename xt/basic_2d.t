use strict;
use Test::More;
use File::Spec;
use FindBin qw($Bin);

BEGIN { use lib File::Spec->catfile($Bin, 'lib') }
use basic_2d;

my $bc = basic_2d->new(text => 'Hello, World');
my $html = $bc->render;
ok(defined $html && length $html, 'rendered something'); 
#diag($html);

done_testing;
