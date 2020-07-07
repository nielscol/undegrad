/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "F:/lab7_og/tb4.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static const char *ng3 = "good seed c = %d$";



static void Initial_49_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 3648U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);

LAB4:    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(52, ng0);

LAB5:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 3456);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB6;

LAB1:    return;
LAB6:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 1768);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB10;

LAB8:    if (*((unsigned int *)t7) == 0)
        goto LAB7;

LAB9:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;

LAB10:    t14 = (t4 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t4) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB12;

LAB11:    t22 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 1768);
    xsi_vlogvar_assign_value(t24, t4, 0, 0, 1);
    goto LAB5;

LAB7:    *((unsigned int *)t4) = 1;
    goto LAB10;

LAB12:    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t4) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB11;

LAB13:    goto LAB1;

}

static void Initial_55_1(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;

LAB0:    t1 = (t0 + 3896U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);

LAB4:    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3704);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(61, ng0);

LAB6:    xsi_set_current_line(61, ng0);

LAB7:    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3704);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 1928);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 3704);
    xsi_process_wait(t2, 500000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 3704);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(73, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2568);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 32);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3704);
    xsi_process_wait(t2, 506000LL);
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB11:    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 3704);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB12:    goto LAB6;

LAB13:    goto LAB1;

}

static void Always_81_2(char *t0)
{
    char t8[8];
    char t26[8];
    char t27[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    int t51;
    int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;

LAB0:    t1 = (t0 + 4144U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 4464);
    *((int *)t2) = 1;
    t3 = (t0 + 4176);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(82, ng0);

LAB5:    xsi_set_current_line(83, ng0);
    t4 = (t0 + 2088);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng2)));
    memset(t8, 0, 8);
    xsi_vlog_signed_equal(t8, 32, t6, 32, t7, 32);
    t9 = (t8 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB6;

LAB7:
LAB8:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 2728);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t8, 0, 8);
    t6 = (t3 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t5);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t6);
    t14 = *((unsigned int *)t7);
    t17 = (t13 ^ t14);
    t18 = (t12 | t17);
    t19 = *((unsigned int *)t6);
    t20 = *((unsigned int *)t7);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB13;

LAB10:    if (t21 != 0)
        goto LAB12;

LAB11:    *((unsigned int *)t8) = 1;

LAB13:    t15 = (t0 + 2568);
    t16 = (t15 + 56U);
    t24 = *((char **)t16);
    t25 = ((char*)((ng2)));
    memset(t26, 0, 8);
    xsi_vlog_signed_equal(t26, 32, t24, 32, t25, 32);
    t28 = *((unsigned int *)t8);
    t29 = *((unsigned int *)t26);
    t30 = (t28 & t29);
    *((unsigned int *)t27) = t30;
    t31 = (t8 + 4);
    t32 = (t26 + 4);
    t33 = (t27 + 4);
    t34 = *((unsigned int *)t31);
    t35 = *((unsigned int *)t32);
    t36 = (t34 | t35);
    *((unsigned int *)t33) = t36;
    t37 = *((unsigned int *)t33);
    t38 = (t37 != 0);
    if (t38 == 1)
        goto LAB14;

LAB15:
LAB16:    t59 = (t27 + 4);
    t60 = *((unsigned int *)t59);
    t61 = (~(t60));
    t62 = *((unsigned int *)t27);
    t63 = (t62 & t61);
    t64 = (t63 != 0);
    if (t64 > 0)
        goto LAB17;

LAB18:
LAB19:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t8, 0, 8);
    xsi_vlog_signed_equal(t8, 32, t4, 32, t5, 32);
    t6 = (t0 + 2408);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t15 = ((char*)((ng1)));
    memset(t26, 0, 8);
    xsi_vlog_signed_equal(t26, 32, t9, 32, t15, 32);
    t10 = *((unsigned int *)t8);
    t11 = *((unsigned int *)t26);
    t12 = (t10 & t11);
    *((unsigned int *)t27) = t12;
    t16 = (t8 + 4);
    t24 = (t26 + 4);
    t25 = (t27 + 4);
    t13 = *((unsigned int *)t16);
    t14 = *((unsigned int *)t24);
    t17 = (t13 | t14);
    *((unsigned int *)t25) = t17;
    t18 = *((unsigned int *)t25);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB20;

LAB21:
LAB22:    t33 = (t27 + 4);
    t45 = *((unsigned int *)t33);
    t46 = (~(t45));
    t47 = *((unsigned int *)t27);
    t48 = (t47 & t46);
    t49 = (t48 != 0);
    if (t49 > 0)
        goto LAB23;

LAB24:
LAB25:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t8, 0, 8);
    xsi_vlog_signed_equal(t8, 32, t4, 32, t5, 32);
    t6 = (t0 + 2408);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t15 = ((char*)((ng2)));
    memset(t26, 0, 8);
    xsi_vlog_signed_equal(t26, 32, t9, 32, t15, 32);
    t10 = *((unsigned int *)t8);
    t11 = *((unsigned int *)t26);
    t12 = (t10 & t11);
    *((unsigned int *)t27) = t12;
    t16 = (t8 + 4);
    t24 = (t26 + 4);
    t25 = (t27 + 4);
    t13 = *((unsigned int *)t16);
    t14 = *((unsigned int *)t24);
    t17 = (t13 | t14);
    *((unsigned int *)t25) = t17;
    t18 = *((unsigned int *)t25);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB27;

LAB28:
LAB29:    t33 = (t27 + 4);
    t45 = *((unsigned int *)t33);
    t46 = (~(t45));
    t47 = *((unsigned int *)t27);
    t48 = (t47 & t46);
    t49 = (t48 != 0);
    if (t49 > 0)
        goto LAB30;

LAB31:
LAB32:    goto LAB2;

LAB6:    xsi_set_current_line(84, ng0);

LAB9:    xsi_set_current_line(85, ng0);
    t15 = ((char*)((ng1)));
    t16 = (t0 + 2088);
    xsi_vlogvar_assign_value(t16, t15, 0, 0, 32);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memcpy(t8, t3, 8);
    t2 = (t0 + 2728);
    xsi_vlogvar_assign_value(t2, t8, 0, 0, 32);
    goto LAB8;

LAB12:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB13;

LAB14:    t39 = *((unsigned int *)t27);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t27) = (t39 | t40);
    t41 = (t8 + 4);
    t42 = (t26 + 4);
    t43 = *((unsigned int *)t8);
    t44 = (~(t43));
    t45 = *((unsigned int *)t41);
    t46 = (~(t45));
    t47 = *((unsigned int *)t26);
    t48 = (~(t47));
    t49 = *((unsigned int *)t42);
    t50 = (~(t49));
    t51 = (t44 & t46);
    t52 = (t48 & t50);
    t53 = (~(t51));
    t54 = (~(t52));
    t55 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t55 & t53);
    t56 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t56 & t54);
    t57 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t57 & t53);
    t58 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t58 & t54);
    goto LAB16;

LAB17:    xsi_set_current_line(89, ng0);
    t65 = ((char*)((ng2)));
    t66 = (t0 + 2408);
    xsi_vlogvar_assign_value(t66, t65, 0, 0, 32);
    goto LAB19;

LAB20:    t20 = *((unsigned int *)t27);
    t21 = *((unsigned int *)t25);
    *((unsigned int *)t27) = (t20 | t21);
    t31 = (t8 + 4);
    t32 = (t26 + 4);
    t22 = *((unsigned int *)t8);
    t23 = (~(t22));
    t28 = *((unsigned int *)t31);
    t29 = (~(t28));
    t30 = *((unsigned int *)t26);
    t34 = (~(t30));
    t35 = *((unsigned int *)t32);
    t36 = (~(t35));
    t51 = (t23 & t29);
    t52 = (t34 & t36);
    t37 = (~(t51));
    t38 = (~(t52));
    t39 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t39 & t37);
    t40 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t40 & t38);
    t43 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t43 & t37);
    t44 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t44 & t38);
    goto LAB22;

LAB23:    xsi_set_current_line(91, ng0);

LAB26:    xsi_set_current_line(92, ng0);
    t41 = (t0 + 1448);
    t42 = (t41 + 56U);
    t59 = *((char **)t42);
    xsi_vlogfile_write(1, 0, 0, ng3, 2, t0, (char)118, t59, 8);
    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB25;

LAB27:    t20 = *((unsigned int *)t27);
    t21 = *((unsigned int *)t25);
    *((unsigned int *)t27) = (t20 | t21);
    t31 = (t8 + 4);
    t32 = (t26 + 4);
    t22 = *((unsigned int *)t8);
    t23 = (~(t22));
    t28 = *((unsigned int *)t31);
    t29 = (~(t28));
    t30 = *((unsigned int *)t26);
    t34 = (~(t30));
    t35 = *((unsigned int *)t32);
    t36 = (~(t35));
    t51 = (t23 & t29);
    t52 = (t34 & t36);
    t37 = (~(t51));
    t38 = (~(t52));
    t39 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t39 & t37);
    t40 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t40 & t38);
    t43 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t43 & t37);
    t44 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t44 & t38);
    goto LAB29;

LAB30:    xsi_set_current_line(97, ng0);

LAB33:    xsi_set_current_line(98, ng0);
    t41 = ((char*)((ng1)));
    t42 = (t0 + 2408);
    xsi_vlogvar_assign_value(t42, t41, 0, 0, 32);
    xsi_set_current_line(99, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB32;

}


extern void work_m_00000000001942255752_0666993477_init()
{
	static char *pe[] = {(void *)Initial_49_0,(void *)Initial_55_1,(void *)Always_81_2};
	xsi_register_didat("work_m_00000000001942255752_0666993477", "isim/tb4_isim_beh.exe.sim/work/m_00000000001942255752_0666993477.didat");
	xsi_register_executes(pe);
}
