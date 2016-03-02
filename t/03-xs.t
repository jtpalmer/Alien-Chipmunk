use Test::Stream -V1;
use Test::Alien;
use Alien::Chipmunk;

alien_ok 'Alien::Chipmunk';

my $xs = do { local $/; <DATA> };

xs_ok { xs => $xs, verbose => 1 };
done_testing();

xs_ok { xs => $xs, verbose => 1 }, with_subtest {
    my $space = My::Chipmunk::space_new();
    ok $space, 'Created space';
    My::Chipmunk::space_destroy($space);
    pass 'did not crash';
};

done_testing();

__DATA__
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <chipmunk.h>

MODULE = My::Chipmunk PACKAGE = My::Chipmunk

void *
space_new()
    CODE:
        RETVAL = (void *)cpSpaceNew();
    OUTPUT:
        RETVAL

void
space_destroy(space)
        void *space
    CODE:
        cpSpaceFree((cpSpace *)space);
