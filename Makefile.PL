use strict;
use warnings;
use inc::Module::Install;

name     'HTML-Barcode';
all_from 'lib/HTML/Barcode.pm';
author   q{Mark A. Stratman <stratman@gmail.com>};
license  'perl';

requires 'Class::Accessor'  => '0.34';

recommends 'Barcode::Code128';

build_requires 'Test::More';

#auto_install;

resources repository => 'https://github.com/mstratman/HTML-Barcode';

WriteAll;

