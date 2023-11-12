
#include "led_mem.h"

#include "gamma_dim_table.h"

void led_mem_wr_gamma_dim(int buffer_nr, int side, int x, int y, unsigned char r, unsigned char g, unsigned char b)
{
    int addr = hub75s_coord2addr(buffer_nr, side, x, y);
    MEM_WR(LED_MEM, 
            addr,
            gamma_dim_table[r] | 
            (gamma_dim_table[g]<<8) | 
            (gamma_dim_table[b]<<16));
}

void led_mem_wr(int buffer_nr, int side, int x, int y, unsigned char r, unsigned char g, unsigned char b)
{
    int addr = hub75s_coord2addr(buffer_nr, side, x, y);
    MEM_WR(LED_MEM, 
            addr,
            r | (g<<8) | (b<<16));
}

void led_mem_fill(int buffer_nr, unsigned char r, unsigned char g, unsigned char b)
{
    for(int row=0;row<64;++row){
        for(int col=0;col<64;++col){
            led_mem_wr(buffer_nr, 0, col, row, r, g, b);
            led_mem_wr(buffer_nr, 1, col, row, r, g, b);
            led_mem_wr(buffer_nr, 2, col, row, r, g, b);
            led_mem_wr(buffer_nr, 3, col, row, r, g, b);
            led_mem_wr(buffer_nr, 4, col, row, r, g, b);
        }
    }
}

void led_mem_clear(int buffer_nr)
{
    led_mem_fill(buffer_nr, 0, 0, 0);
}

void led_mem_effect(int buffer_nr)
{
    unsigned char r,g,b;

    for(r=0;r<255;++r){
        for(g=0;g<255;++g){
            for(b=0;b<255;++b){
                led_mem_fill(buffer_nr, r,g,b);
            }
        }
    }
}
