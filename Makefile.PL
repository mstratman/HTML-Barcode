use strict;
use warnings;
use inc::Module::Install;

name     'HTML-Barcode';
all_from 'lib/HTML/Barcode.pm';
author   q{Mark A. Stratman <stratman@gmail.com>};
license  'perl';

requires 'Mouse'      => '0.91';
requires 'Any::Moose' => '0.13';

recommends 'Barcode::Code128' => '2.02';
recommends 'Text::QRCode';

build_requires 'Test::More';

#auto_install;

resources repository => 'https://github.com/mstratman/HTML-Barcode';

WriteAll;

