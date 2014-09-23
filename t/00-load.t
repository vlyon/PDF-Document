#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok 'PDF::Document' or print "Bail out!\n";
}

diag "Testing PDF::Document $PDF::Document::VERSION, Perl $], $^X";
