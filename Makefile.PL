use strict;
use warnings;
use inc::Module::Install;

name     'HTML-Barcode';
all_from 'lib/HTML/Barcode.pm';
author   q{Mark A. Stratman <stratman@gmail.com>};
license  'perl';

requires 'Mouse';
requires 'Any::Moose';
requires 'Barcode::Code93';

recommends 'Barcode::Code128'; # We will require this once 2.02 is out, fixing the broken tests.
recommends 'Text::QRCode'; # we don't want to require this, since it needs libqrencode

build_requires 'Test::More';

#auto_install;

resources repository => 'https://github.com/mstratman/HTML-Barcode';

WriteAll;

