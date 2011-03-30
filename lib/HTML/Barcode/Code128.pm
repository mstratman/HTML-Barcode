package HTML::Barcode::Code128;
use Mouse;
extends 'HTML::Barcode::1D';
use Barcode::Code128;

has '_code128' => (
    is      => 'ro',
    default => sub { Barcode::Code128->new },
);

sub render_barcode { 'todo' }

1;
