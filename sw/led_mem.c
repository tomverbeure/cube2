
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

void render_bitmap_1bpp(uint16_t *bitmap, uint32_t color, int size_x, int size_y, int buffer_nr, e_hub75_ring ring, int pos_x, int pos_y, int rotation)
{
    for(int ry=0; ry<size_y;++ry){
        for(int rx=0; rx<size_x;++rx){
                uint32_t bit = (bitmap[ry] >> (rx)) & 1;
                if (!bit)
                    continue;

                int x;
                int y;

                switch(rotation){
                    default:
                    case ROT_0: {
                        x = pos_x + rx;
                        y = pos_y + ry;
                        break;
                    }
                    case ROT_90: {
                        x = pos_x + ry;
                        y = pos_y + size_x - rx -1;
                        break;
                    }
                    case ROT_180: {
                        x = pos_x + size_x - rx;
                        y = pos_y + size_y - ry -1;
                        break;
                    }
                    case ROT_270: {
                        x = pos_x + size_y - ry -1;
                        y = pos_y + rx;
                        break;
                    }
                    case ROT_FLIP_X: {
                        x = pos_x + rx;
                        y = pos_y + size_y - ry -1;
                        break;
                    }
                    case ROT_FLIP_Y: {
                        x = pos_x + size_x - rx -1;
                        y = pos_y + ry;
                        break;
                    }
                }

                // FIXME: currently no support for top and bottom sides
                if (pos_y+ry>=64){
                    continue;
                }
                int phys_addr = hub75s_ring_coord2addr(buffer_nr, 0, x, y);
                MEM_WR(LED_MEM, phys_addr, color);
        }
    }
}

void render_bitmap_2bpp(uint32_t *bitmap, uint32_t *colors, int size_x, int size_y, int buffer_nr, e_hub75_ring ring, int pos_x, int pos_y, int rotation)
{
    for(int ry=0; ry<size_y;++ry){
        for(int rx=0; rx<size_x;++rx){
                uint32_t bits = (bitmap[ry] >> (2*size_x-2 - 2*rx)) & 3;
                if (!bits)
                    continue;

                uint32_t color = colors[bits];

                int x;
                int y;

                switch(rotation){
                    default:
                    case ROT_0: {
                        x = pos_x + rx;
                        y = pos_y + ry;
                        break;
                    }
                    case ROT_90: {
                        x = pos_x + ry;
                        y = pos_y + size_x - rx -1;
                        break;
                    }
                    case ROT_180: {
                        x = pos_x + size_x - rx;
                        y = pos_y + size_y - ry -1;
                        break;
                    }
                    case ROT_270: {
                        x = pos_x + size_y - ry -1;
                        y = pos_y + rx;
                        break;
                    }
                    case ROT_FLIP_X: {
                        x = pos_x + rx;
                        y = pos_y + size_y - ry -1;
                        break;
                    }
                    case ROT_FLIP_Y: {
                        x = pos_x + size_x - rx -1;
                        y = pos_y + ry;
                        break;
                    }
                }

                // FIXME: currently no support for top and bottom sides
                if (pos_y+ry>=64){
                    continue;
                }
                int phys_addr = hub75s_ring_coord2addr(buffer_nr, 0, x, y);
                MEM_WR(LED_MEM, phys_addr, color);
        }
    }

#if 0
    for(int y=0; y<size_y;++y){
        for(int x=0; x<size_x;++x){
                uint32_t bits = (bitmap[y] >> (2*size_x-2 - 2*x)) & 3;
                if (bits == 0)
                    continue;

                uint32_t color = colors[bits];

                int phys_addr = hub75s_ring_coord2addr(buffer_nr, 0, pos_x+x, pos_y+y);
                MEM_WR(LED_MEM, phys_addr, color);
        }
    }
#endif
}
