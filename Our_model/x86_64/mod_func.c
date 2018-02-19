#include <stdio.h>
#include "hocdec.h"
extern int nrnmpi_myid;
extern int nrn_nobanner_;

extern void _Nav11_reg(void);
extern void _vclmp_pl_reg(void);

void modl_reg(){
  if (!nrn_nobanner_) if (nrnmpi_myid < 1) {
    fprintf(stderr, "Additional mechanisms from files\n");

    fprintf(stderr," Nav11.mod");
    fprintf(stderr," vclmp_pl.mod");
    fprintf(stderr, "\n");
  }
  _Nav11_reg();
  _vclmp_pl_reg();
}
