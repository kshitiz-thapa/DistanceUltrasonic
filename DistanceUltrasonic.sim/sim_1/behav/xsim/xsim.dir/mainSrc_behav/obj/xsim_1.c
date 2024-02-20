/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_74(char*, char *);
extern void execute_75(char*, char *);
extern void execute_76(char*, char *);
extern void execute_77(char*, char *);
extern void execute_53(char*, char *);
extern void execute_58(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_60(char*, char *);
extern void execute_64(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_66(char*, char *);
extern void execute_72(char*, char *);
extern void execute_73(char*, char *);
extern void execute_69(char*, char *);
extern void execute_71(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_60(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[20] = {(funcp)execute_74, (funcp)execute_75, (funcp)execute_76, (funcp)execute_77, (funcp)execute_53, (funcp)execute_58, (funcp)execute_56, (funcp)execute_57, (funcp)execute_60, (funcp)execute_64, (funcp)execute_62, (funcp)execute_63, (funcp)execute_66, (funcp)execute_72, (funcp)execute_73, (funcp)execute_69, (funcp)execute_71, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_2, (funcp)transaction_60};
const int NumRelocateId= 20;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/mainSrc_behav/xsim.reloc",  (void **)funcTab, 20);
	iki_vhdl_file_variable_register(dp + 14328);
	iki_vhdl_file_variable_register(dp + 14384);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/mainSrc_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/mainSrc_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstantiate();

extern void implicit_HDL_SCcleanup();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/mainSrc_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/mainSrc_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/mainSrc_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
