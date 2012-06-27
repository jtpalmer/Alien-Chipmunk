use strict;
use warnings;
use Test::More;
use Alien::Chipmunk;

diag( 'NAME=' . Alien::Chipmunk->config('name') );
diag( 'VERSION=' . Alien::Chipmunk->config('version') );

my $alien = Alien::Chipmunk->new;

diag( 'CFLAGS=' . $alien->cflags );
diag( 'LIBS=' . $alien->libs );

like( $alien->cflags, qr/-I/ );
like( $alien->libs,   qr/-L/ );

done_testing();

