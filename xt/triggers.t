use strict;
use Test::More;
use HTML::Barcode;

my $bc = HTML::Barcode->new(
    css_class => 'old',
);
is($bc->css_class, 'old');
is($bc->td_on_class, 'old_on');
is($bc->td_off_class, 'old_off');

$bc->css_class('new');
is($bc->td_on_class, 'new_on');
is($bc->td_off_class, 'new_off');

done_testing;
