#include <stdio.h>
#include "hocdec.h"
#define IMPORT extern __declspec(dllimport)
IMPORT int nrnmpi_myid, nrn_nobanner_;

extern void _Nav11_a_reg();
extern void _Nav12_a_reg();
extern void _Nav13_a_reg();
extern void _Nav14_a_reg();
extern void _Nav15_a_reg();
extern void _Nav16_a_reg();
extern void _Nav17_a_reg();
extern void _Nav18_a_reg();
extern void _Nav19_a_reg();
extern void _vclmp_pl_reg();

modl_reg(){
	//nrn_mswindll_stdio(stdin, stdout, stderr);
    if (!nrn_nobanner_) if (nrnmpi_myid < 1) {
	fprintf(stderr, "Additional mechanisms from files\n");

fprintf(stderr," Nav11_a.mod");
fprintf(stderr," Nav12_a.mod");
fprintf(stderr," Nav13_a.mod");
fprintf(stderr," Nav14_a.mod");
fprintf(stderr," Nav15_a.mod");
fprintf(stderr," Nav16_a.mod");
fprintf(stderr," Nav17_a.mod");
fprintf(stderr," Nav18_a.mod");
fprintf(stderr," Nav19_a.mod");
fprintf(stderr," vclmp_pl.mod");
fprintf(stderr, "\n");
    }
_Nav11_a_reg();
_Nav12_a_reg();
_Nav13_a_reg();
_Nav14_a_reg();
_Nav15_a_reg();
_Nav16_a_reg();
_Nav17_a_reg();
_Nav18_a_reg();
_Nav19_a_reg();
_vclmp_pl_reg();
}
