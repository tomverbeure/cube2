#ifndef LED_MEM_H
#define LED_MEM_H

#include "reg.h"
#include "top_defines.h"
#include "hub75_streamer.h"

void led_mem_wr_gamma_dim(int buffer_nr, int side, int x, int y, unsigned char r, unsigned char g, unsigned char b);
void led_mem_wr(int buffer_nr, int side, int x, int y, unsigned char r, unsigned char g, unsigned char b);
void led_mem_clear(int buffer_nr);
void led_mem_effect(int buffer_nr);

#endif
