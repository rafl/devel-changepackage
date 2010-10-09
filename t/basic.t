use strict;
use warnings;
use Test::More;

use Devel::ChangePackage;

BEGIN { change_package 'Foo::Bar' }

::is __PACKAGE__, 'Foo::Bar';

::done_testing;
