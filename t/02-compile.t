use strict;
use warnings;
use Test::More;
use Alien::Chipmunk;
use Test::CChecker 0.07;

compile_output_to_note;

compile_with_alien 'Alien::Chipmunk';

my $source = do { local $/; <DATA> };

compile_ok $source, 'basic compile test';

compile_run_ok $source, "basic compile/link/run test";

done_testing();

__DATA__
#include <chipmunk.h>
#include <stdio.h>

int main(int argc, const char *argv[])
{
    cpVect gravity = cpv(0, -100);

    cpSpace *space = cpSpaceNew();
    cpSpaceSetGravity(space, gravity);

    cpSpaceFree(space);

    return 0;
}
