use strict;
use warnings;

package Devel::ChangePackage;

use XSLoader;
use Sub::Exporter -setup => {
    exports => ['change_package'],
    groups  => { default => ['change_package'] },
};

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
