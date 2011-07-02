use strict;
use warnings;
use inc::Module::Install;

name     'HTML-Barcode';
license  'perl';
all_from 'lib/HTML/Barcode.pm';

requires 'Any::Moose';

test_requires 'Test::More';
tests 't/*.t';
author_tests 'xt';

githubmeta;
auto_include;
auto_install;
WriteAll;
