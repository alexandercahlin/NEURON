#include <stdio.h>
#include "hocdec.h"
#define IMPORT extern __declspec(dllimport)
IMPORT int nrnmpi_myid, nrn_nobanner_;

extern void _Nav11_reg();
extern void _vclmp_pl_reg();

modl_reg(){
	//nrn_mswindll_stdio(stdin, stdout, stderr);
    if (!nrn_nobanner_) if (nrnmpi_myid < 1) {
	fprintf(stderr, "Additional mechanisms from files\n");

fprintf(stderr," Nav11.mod");
fprintf(stderr," vclmp_pl.mod");
fprintf(stderr, "\n");
    }
_Nav11_reg();
_vclmp_pl_reg();
}
