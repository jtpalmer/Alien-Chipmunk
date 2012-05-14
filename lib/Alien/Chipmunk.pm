package Alien::Chipmunk;

use strict;
use warnings;

our $VERSION = '0.000001';
$VERSION = eval $VERSION;

use parent 'Alien::Base';

1;

__END__

=head1 NAME

Alien::Chipmunk - Alien package for the Chipmunk Physics library

=head1 SYNOPSIS

    use Module::Build;
    use Alien::Chipmunk;

    my $alien = Alien::Chipmunk->new;

    my $builder = Module::Build->new(
        module_name => 'Some::Library::Chipmunk',
        # ...
        configure_requires => {
            'Alien::Chipmunk' => 0,
            # ...
        },
        build_requires => {
            'Alien::Chipmunk' => 0
            # ...
        },
        extra_compiler_flags => $alien->cflags,
        extra_linker_flags   => $alien->libs . ' -lm',
    );

    $builder->create_build_script();

=head1 DESCRIPTION

L<Alien::Chipmunk> installs and downloads the Chipmunk Physics library.

=head1 SEE ALSO

=over

=item *

L<Alien>

=item *

L<Alien::Base>

=item *

L<Chipmunk>

=back

=head1 AUTHOR

Jeffrey T. Palmer, E<lt>jtpalmer@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Jeffrey T. Palmer.

This is free software, licensed under:

    The MIT License

=cut

