package My::Builder;
use strict;
use warnings;
use parent qw(Alien::Base::ModuleBuild);

sub new {
    my $class = shift;

    $class = ref $class if ref $class;

    return $class->SUPER::new(
        @_,
        add_to_cleanup   => [ 't/src/test.o', 't/src/test' ],
        alien_name       => 'chipmunk',
        alien_repository => {
            protocol => 'http',
            host     => 'chipmunk-physics.net',
            location => '/release/Chipmunk-6.x',
            pattern  => qr/Chipmunk-([\d\.]+)\.tgz$/,
        },
        alien_build_commands => [
            'cmake -DBUILD_DEMOS=OFF -DCMAKE_INSTALL_PREFIX=%s',
            'make', 'make install',
        ],
    );
}

1;

