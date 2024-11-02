#ifndef LED_MEM_H
#define LED_MEM_H

#include "reg.h"
#include "top_defines.h"
#include "hub75_streamer.h"

typedef enum e_rotation {
    ROT_0       = 0,
    ROT_90      = 1,
    ROT_180     = 2,
    ROT_270     = 3,
    ROT_FLIP_X  = 4,
    ROT_FLIP_Y  = 5,
} t_rotation; 

void led_mem_wr_gamma_dim(int buffer_nr, int side, int x, int y, unsigned char r, unsigned char g, unsigned char b);
void led_mem_wr(int buffer_nr, int side, int x, int y, unsigned char r, unsigned char g, unsigned char b);
void led_mem_clear(int buffer_nr);
void led_mem_effect(int buffer_nr);

void render_bitmap_1bpp(uint16_t *bitmap, uint32_t color, int size_x, int size_y, int buffer_nr, e_hub75_ring ring, int pos_x, int pos_y, int rotation);
void render_bitmap_2bpp(uint32_t *bitmap, uint32_t *colors, int size_x, int size_y, int buffer_nr, e_hub75_ring ring, int pos_x, int pos_y, int rotation);

#endif
