package HTML::Barcode::Code93;
use Any::Moose;
extends 'HTML::Barcode::1D';

sub barcode_data {
    my ($self) = @_;
    return $self->_barcode(uc $self->text);
}

=head1 NAME

HTML::Barcode::Code93 - Generate HTML representations of Code 93 barcodes

=head1 SYNOPSIS

  my $code = HTML::Barcode::Code93->new(text => 'MONKEY');
  print $code->render;

=head1 DESCRIPTION

This class allows you easily create HTML representations of Code 93 barcodes.

=begin html

<p>Here is an example of a Code 93 barcode rendered with this module:</p>
<style type="text/css">table.hbc{border-width:0;border-spacing:0;}table.hbc{border-width:0;border-spacing:0;}table.hbc tr, table.hbc td{border:0;margin:0;padding:0;}table.hbc td{text-align:center;}table.hbc td.hbc_on,table.hbc td.hbc_off{width:2px;height:100px;}table.hbc td.hbc_on{background-color:#000;color:inherit;}table.hbc td.hbc_off{background-color:#fff;color:inherit;}</style><table class="hbc"><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td colspan="91">MONKEY</td></tr></table>

=end html

You can read more about Code 93 online (e.g. L<http://en.wikipedia.org/wiki/Code_93>).

=head1 METHODS

=head2 new (%attributes)

Instantiate a new HTML::Barcode::Code93 object. The C<%attributes> hash
requires the L</text> attribute, and can take any of the other
L<attributes|/ATTRIBUTES> listed below.

=head2 render

This is a convenience routine which returns C<< <style>...</style> >> tags
and the rendered barcode.

If you are printing multiple barcodes or want to ensure your C<style> tags
are in your HTML headers, then you probably want to output the barcode
and style separately with L</render_barcode> and
L</css>.

=head2 render_barcode

Returns only the rendered barcode.  You will need to provide stylesheets
separately, either writing them yourself or using the output of L</css>.

=head2 css

Returns CSS needed to properly display your rendered barcode.  This is
only necessary if you are using L</render_barcode> instead of the
easier L</render> method.

=head1 ATTRIBUTES

These attributes can be passed to L<new|/"new (%attributes)">, or used
as accessors.

=head2 text

B<Required> - The information to put into the barcode.

=head2 foreground_color

A CSS color value (e.g. '#000' or 'black') for the foreground. Default is '#000'.

=head2 background_color

A CSS color value background. Default is '#fff'.

=head2 bar_width

A CSS value for the width of an individual bar. Default is '2px'.

=head2 bar_height

A CSS value for the height of an individual bar. Default is '100px'.

=head2 show_text

Boolean, default true. Indicates whether or not to render the text
below the barcode.

=head2 css_class

The value for the C<class> attribute applied to any container tags
in the HTML (e.g. C<table> or C<div>).
C<td> tags within the table will have either css_class_on or css_class_off
classes applied to them.

For example, if css_class is "barcode", you will get C<< <table class="barcode"> >> and its cells will be either C<< <td class="barcode_on"> >> or
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

no Any::Moose;
1; # End of HTML::Barcode
