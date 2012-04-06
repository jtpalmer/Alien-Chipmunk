use strict;
use warnings;

use Alien::Base::ModuleBuild;

my $builder = Alien::Base::ModuleBuild->new(
    module_name        => 'Alien::Chipmunk',
    dist_abstract      => 'Build and install the Chipmunk Physics library',
    license            => 'perl',
    configure_requires => { 'Alien::Base' => 0, },
    requires           => {
        'perl'        => '5.8.1',
        'Alien::Base' => 0,
    },
    dist_author      => 'Jeffrey T. Palmer <jtpalmer AT cpan DOT org>',
    alien_name       => 'chipmunk',
    alien_repository => {
        protocol => 'http',
        host     => 'chipmunk-physics.net',
        location => '/release/Chipmunk-6.x',
        pattern  => qr/Chipmunk-([\d\.]+)\.tgz$/,
    },
    alien_build_commands => [
        'CMAKE_INSTALL_PREFIX=%s cmake .',
        'make',
        'make install'
    ],
);
$builder->create_build_script;

