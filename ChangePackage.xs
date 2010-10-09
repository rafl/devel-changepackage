#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Devel::ChangePackage  PACKAGE = Devel::ChangePackage

SV *
change_package (package)
    SV *package
  CODE:
    RETVAL = newSVsv(PL_curstname);
    PL_curstash = gv_stashsv(package, GV_ADD);
    sv_setsv(PL_curstname, package);
  OUTPUT:
    RETVAL
