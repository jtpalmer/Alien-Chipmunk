#!perl -T
use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok 'Alien::Chipmunk' or BAIL_OUT('Load failed!');
}

diag "Testing Alien::Chipmunk $Alien::Chipmunk::VERSION, Perl $], $^X";

done_testing();

