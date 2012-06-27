use strict;
use warnings;
use Test::More;
use Alien::Chipmunk;
use Config;

SKIP: {
    skip "This test is broken on cygwin" if ( $^O eq 'cygwin' );

    eval "use ExtUtils::CBuilder 0.2703";
    skip "ExtUtils::CBuilder 0.2703 required for this test" if $@;

    my $alien = Alien::Chipmunk->new;

    my @L = $alien->libs =~ /-L(\S+)/g;
    $ENV{LD_RUN_PATH} = join( $Config::Config{path_sep}, @L );

    my $cb = ExtUtils::CBuilder->new( quiet => 0 );
    my $obj = $cb->compile(
        source               => 't/src/test.c',
        extra_compiler_flags => $alien->cflags,
    );
    is( defined $obj, 1, "Compiling test.c" );
    my $exe = $cb->link_executable(
        objects            => [$obj],
        extra_linker_flags => $alien->libs . ' -lm',
    );
    is( defined $exe, 1, "Linking test.c" );
    my $rv = system($exe);
    is( $rv, 0, "Executing test" );
}

done_testing();

