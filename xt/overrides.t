use strict;
use Test::More;
use HTML::Barcode::2D;
use HTML::Barcode::1D;

my $bc1d = HTML::Barcode::1D->new;
my $bc2d = HTML::Barcode::2D->new;

cmp_ok($bc2d->bar_width, 'eq', $bc2d->bar_height);
cmp_ok($bc1d->bar_width, 'ne', $bc1d->bar_height);

done_testing;
