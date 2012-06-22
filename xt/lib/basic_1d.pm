package basic_1d;
use Moo;
extends 'HTML::Barcode::1D';

sub barcode_data {
    return [ 0,1,0 ];
}

1;
