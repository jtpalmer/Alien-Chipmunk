#!perl -T
use strict;
use warnings;
use Test::More;
use Alien::Chipmunk;

my $alien = Alien::Chipmunk->new;

like( $alien->libs,   qr/-L/ );
like( $alien->cflags, qr/-I/ );

done_testing();

