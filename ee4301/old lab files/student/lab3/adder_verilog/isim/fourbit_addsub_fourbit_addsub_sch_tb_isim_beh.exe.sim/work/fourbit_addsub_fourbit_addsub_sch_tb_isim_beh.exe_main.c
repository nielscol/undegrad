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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    unisims_ver_m_00000000003510477262_2316096324_init();
    unisims_ver_m_00000000001162476414_1323117156_init();
    unisims_ver_m_00000000004258808807_3443532839_init();
    work_m_00000000000722408202_4220236965_init();
    unisims_ver_m_00000000000924517765_3125220529_init();
    unisims_ver_m_00000000003266096158_0690727491_init();
    work_m_00000000000645858121_3907539148_init();
    work_m_00000000002161933796_4043434303_init();
    work_m_00000000004093713498_2073120511_init();


    xsi_register_tops("work_m_00000000002161933796_4043434303");
    xsi_register_tops("work_m_00000000004093713498_2073120511");


    return xsi_run_simulation(argc, argv);

}
