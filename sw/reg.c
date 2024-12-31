
#include <stdio.h>
#include <stdint.h>

#include "reg.h"

#if PC_COMPILE==1

void pc_reg_wr(int reg_addr, uint32_t wr_data)
{
    printf("reg_wr: %04x = %08x\n", reg_addr, wr_data);
}

uint32_t pc_reg_rd(int reg_addr)
{
    printf("reg_rd: %04x\n", reg_addr);

    return 0x0;
}

void pc_reg_wr_field(int reg_addr, uint32_t field_mask, int field_start, uint32_t wr_data)
{
}

uint32_t pc_reg_rd_field(int reg_addr, uint32_t field_mask, int field_start)
{
    return 0x0;
}

void pc_mem_wr(int mem_addr, int wr_addr, uint32_t wr_data)
{
}

#endif
