use strict;
use warnings;

package Devel::ChangePackage;
# ABSTRACT: Change the package core is currently being compiled in

use XSLoader;
use Sub::Exporter -setup => {
    exports => ['change_package'],
    groups  => { default => ['change_package'] },
};

=head1 SYNOPSIS

    package Foo;

    use Devel::ChangePackage;

    BEGIN { change_package 'Bar' }

    warn __PACKAGE__; # Bar

=func change_package

    my $previous_package = change_package $new_package;

Changes the package code is being compiled in to C<$new_package>. The name of
the package things were compiled in before is returned.

=cut

XSLoader::load(
    __PACKAGE__,
    # we need to be careful not to touch $VERSION at compile time, otherwise
    # DynaLoader will assume it's set and check against it, which will cause
    # fail when being run in the checkout without dzil having set the actual
    # $VERSION
    exists $Devel::ChangePackage::{VERSION}
        ? ${ $Devel::ChangePackage::{VERSION} } : (),
);

1;
