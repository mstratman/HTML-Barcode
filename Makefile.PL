use strict;
use warnings;
use inc::Module::Install;

name     'HTML-Barcode';
license  'perl';
all_from 'lib/HTML/Barcode.pm';

requires 'Moo' => '1.000000';


test_requires 'Test::More' => 0;
test_requires 'FindBin'    => 0;
test_requires 'File::Spec' => 0;
tests 't/*.t';

author_tests 'xt';

auto_set_repository;
auto_install;
WriteAll;
