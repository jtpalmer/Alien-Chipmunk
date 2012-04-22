use strict;
use warnings;

use Alien::Base::ModuleBuild;

my $builder = Alien::Base::ModuleBuild->new(
    module_name        => 'Alien::Chipmunk',
    dist_abstract      => 'Build and install the Chipmunk Physics library',
    license            => 'perl',
    configure_requires => {
        'Module::Build' => 0,
        'Alien::Base'   => 0.000008,
    },
    build_requires => { 'Test::More' => 0 },
    requires       => {
        'perl'        => '5.8.1',
        'Alien::Base' => 0,
    },
    add_to_cleanup => [ 't/src/test.o', 't/src/test' ],
    dist_author    => 'Jeffrey T. Palmer <jtpalmer@cpan.org>',
    meta_merge     => {
        resources => {
            repository => 'https://github.com/jtpalmer/Alien-Chipmunk',
            bugtracker => 'https://github.com/jtpalmer/Alien-Chipmunk/issues',
        },
    },
    alien_name       => 'chipmunk',
    alien_repository => {
        protocol => 'http',
        host     => 'chipmunk-physics.net',
        location => '/release/Chipmunk-6.x',
        pattern  => qr/Chipmunk-([\d\.]+)\.tgz$/,
    },
    alien_build_commands => [
        'cmake -DBUILD_DEMOS=OFF -DBUILD_SHARED=OFF -DINSTALL_SHARED=OFF -DCMAKE_INSTALL_PREFIX=%s',
        'make',
        'make install',
    ],
);
$builder->create_build_script;

