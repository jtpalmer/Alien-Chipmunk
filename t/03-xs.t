use strict;
use warnings;
use Test::Stream -V1;
use Test::Alien;
use Alien::Chipmunk;

plan 3;

alien_ok 'Alien::Chipmunk';

my $xs = do { local $/; <DATA> };

xs_ok $xs, with_subtest {
    my ($module) = @_;

    plan 2;
    my $space = $module->space_new();
    ok $space, 'Created space';
    $module->space_destroy($space);
    pass 'Space destroyed';
};

__DATA__

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <chipmunk.h>

MODULE = TA_MODULE PACKAGE = TA_MODULE PREFIX = my_

void *
my_space_new(CLASS)
        char *CLASS
    CODE:
        RETVAL = (void *)cpSpaceNew();
    OUTPUT:
        RETVAL

void
my_space_destroy(CLASS, space)
        char *CLASS
        void *space
    CODE:
        cpSpaceFree((cpSpace *)space);

