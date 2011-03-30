package HTML::Barcode::Code93;
use Mouse;
extends 'HTML::Barcode::1D';

sub barcode_data {
    my ($self) = @_;
    return $self->_barcode(uc $self->text);
}

=head1 NAME

HTML::Barcode::Code93 - Generate HTML representations of Code 93 barcodes

=head1 SYNOPSIS

  # TODO...

=head1 DESCRIPTION

TODO...

=head2 Known Types

Here are some of the types of barcodes you can scan with the modules in 
this distribution.  Others may exist, so try searching CPAN.

=over 4

=item L<HTML::Barcode::QRCode> - Two dimensional QR codes.

=item L<HTML::Barcode::Code93> - Code 93 barcodes.

=item L<HTML::Barcode::Code128> - Code 128 barcodes.

=back

=head2 Subclassing

To add a new type of barcode, create a subclass of either L<HTML::Barcode::1D|HTML::Barcode::1D/Subclassing>
for traditional barcodes, L<HTML::Barcode::2D|HTML::Barcode::2D/Subclassing> for 2-dimensional bar codes,
or L<HTML::Barcode> if neither of those suit your needs.

Use one of the L<existing modules|/"Known Types"> as a starting point.

In order for custom stylesheets to be as reusable as possible, please
try to use the same generated HTML as the existing modules. Specifically:

  <table class="table_class">
    <tr>
      <td class="table_class_on"></td>
      <td class="table_class_off"></td>
    </tr>
  </table>

where "table_class" is the value of C<< $self->table_class >>.

=head1 METHODS

=head2 new (%attributes)

Default constructor provided by L<Mouse>, which can take values for
any of the L<attributes|/ATTRIBUTES>.

=head1 ATTRIBUTES

These attributes can be passed to L<new|/"new (%attributes)">, or used
as accessors.

=head2 foreground_color

A CSS color value (e.g. '#000' or 'black') for the foreground. Default is '#000'.

=head2 background_color

A CSS color value background. Default is '#fff'.

=head2 bar_width

A CSS value for the width of an individual bar. Default is '2px'.

=head2 bar_height

A CSS value for the height of an individual bar. Default is '100px'.

=head2 table_class

The value for the C<class> attribute applied to the C<table> tag.
C<td> tags within the table will have either table_class_on or table_class_off
classes applied to them.

For example, if table_class is "barcode", you will get C<< <table class="barcode"> >> and its cells will be either C<< <td class="barcode_on"> >> or
C<< <td class="barcode_off"> >>.

=head1 AUTHOR

Mark A. Stratman, C<< <stratman@gmail.com> >>

=head1 SOURCE REPOSITORY

L<http://github.com/mstratman/HTML-Barcode>

=head1 ACKNOWLEDGEMENTS

The calculation code is from L<GD::Barcode::Code93> by Chris DiMartino.

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Mark A. Stratman.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut



#------------------------------------------------------------------------------
# barcode (for GD::Barcode::Code93)
#------------------------------------------------------------------------------
sub _barcode {
    my $self = shift;
    my $text = shift;

    my $code93bar = {
        0   =>'100010100',
        1   =>'101001000',
        2   =>'101000100',
        3   =>'101000010',
        4   =>'100101000',
        5   =>'100100100',
        6   =>'100100010',
        7   =>'101010000',
        8   =>'100010010',
        9   =>'100001010',
        A   =>'110101000',
        B   =>'110100100',
        C   =>'110100010',
        D   =>'110010100',
        E   =>'110010010',
        F   =>'110001010',
        G   =>'101101000',
        H   =>'101100100',
        I   =>'101100010',
        J   =>'100110100',
        K   =>'100011010',
        L   =>'101011000',
        M   =>'101001100',
        N   =>'101000110',
        O   =>'100101100',
        P   =>'100010110',
        Q   =>'110110100',
        R   =>'110110010',
        S   =>'110101100',
        T   =>'110100110',
        U   =>'110010110',
        V   =>'110011010',
        W   =>'101101100',
        X   =>'101100110',
        Y   =>'100110110',
        Z   =>'100111010',
       ' '  =>'111010010',
       '$'  =>'111001010',
       '%'  =>'110101110',
       '($)'=>'100100110',
       '(%)'=>'111011010',
       '(+)'=>'100110010',
       '(/)'=>'111010110',
       '+'  =>'101110110',
       '-'  =>'100101110',
       '.'  =>'111010100',
       '/'  =>'101101110',
       '*'  =>'101011110',  ##Start/Stop
    };

    my @sum_text = ('*', $self->_calculateSums($text), '*');

    my @rv = map { split //, $code93bar->{$_} } @sum_text;
    push @rv, 1;
    return \@rv;
}


#-----------------------------------------------------------------------------
# calculateSums (for GD::Barcode::Code93)
#-----------------------------------------------------------------------------
sub _calculateSums {
    my $self = shift;
    my $text = shift;
    my @array = split(//, scalar reverse $text);

    my %code93values = (
        '0'    =>'0',
        '1'    =>'1',
        '2'    =>'2',
        '3'    =>'3',
        '4'    =>'4',
        '5'    =>'5',
        '6'    =>'6',
        '7'    =>'7',
        '8'    =>'8',
        '9'    =>'9',
        'A'    =>'10',
        'B'    =>'11',
        'C'    =>'12',
        'D'    =>'13',
        'E'    =>'14',
        'F'    =>'15',
        'G'    =>'16',
        'H'    =>'17',
        'I'    =>'18',
        'J'    =>'19',
        'K'    =>'20',
        'L'    =>'21',
        'M'    =>'22',
        'N'    =>'23',
        'O'    =>'24',
        'P'    =>'25',
        'Q'    =>'26',
        'R'    =>'27',
        'S'    =>'28',
        'T'    =>'29',
        'U'    =>'30',
        'V'    =>'31',
        'W'    =>'32',
        'X'    =>'33',
        'Y'    =>'34',
        'Z'    =>'35',
        '-'    =>'36',
        '.'    =>'37',
        ' '    =>'38',
        '$'    =>'39',
        '/'    =>'40',
        '+'    =>'41',
        '%'    =>'42',
        '($)'    =>'43',
        '(%)'    =>'44',
        '(/)'    =>'45',
        '(+)'    =>'46',
        '*'        => '',
    );

    my %invCode93Values = reverse %code93values;
    my $weighted_sum;

    foreach my $counter ( qw/4 3/ ) {
        for (my $i = 0, my $x = 1; $i <= $#array; $i++, $x++) {
            my $letter  = $array[$i];

            if ($x > ($counter * 5)) { $x = 1 }
            $weighted_sum += ($code93values{$letter} * $x);
        }

        my $check = $invCode93Values{($weighted_sum % 47)};
        unshift @array, $check;
        $weighted_sum = ();
    }

    return reverse @array;
}

1; # End of HTML::Barcode
