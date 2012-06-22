package basic_2d;
use Moo;
extends 'HTML::Barcode::2D';

sub barcode_data {
    return [
        [ 0,1,0 ],
        [ 1,0,1 ],
        [ 0,1,0 ],
    ];
}

1;
