use strict;
use warnings;
use inc::Module::Install;

name     'HTML-Barcode';
all_from 'lib/HTML/Barcode.pm';
author   q{Mark A. Stratman <stratman@gmail.com>};
license  'perl';

requires 'Mouse';
requires 'Any::Moose';

recommends 'Barcode::Code128';
recommends 'Text::QRCode';

build_requires 'Test::More';

#auto_install;

resources repository => 'https://github.com/mstratman/HTML-Barcode';

WriteAll;

