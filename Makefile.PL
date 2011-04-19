use strict;
use warnings;
use inc::Module::Install;

name     'HTML-Barcode';
all_from 'lib/HTML/Barcode.pm';
author   q{Mark A. Stratman <stratman@gmail.com>};
license  'perl';

requires 'Mouse';
requires 'Any::Moose';
requires 'Barcode::Code93'; # Required, since i know it will install cleanly everywhere.

features(
    'Code 128 support' => [
        -default => 0,     # Optional, since its tests fail.
        'Barcode::Code128' => 0,
    ],
    'QR code support' => [
        -default => 0,    # Optional, since it requires libqrencode
        'Text::QRCode' => 0,
    ],
);

build_requires 'Test::More';

auto_install;

resources repository => 'https://github.com/mstratman/HTML-Barcode';

WriteAll;

