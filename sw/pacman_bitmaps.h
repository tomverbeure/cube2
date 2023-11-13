#ifndef PACMAN_BITMAPS_H
#define PACMAN_BITMAPS_H

#include <stdint-gcc.h>

extern uint16_t pacman_closed1[11];
extern uint16_t pacman_open1[11];
extern uint16_t pacman_closed[16];
extern uint16_t pacman_open[16];
extern uint16_t pacman_test[11];
extern uint32_t ghost_left_0[16];
extern uint32_t ghost_left_1[16];
extern uint32_t ghost_up_0[16];
extern uint32_t ghost_up_1[16];
extern uint32_t ghost_down_0[16];
extern uint32_t ghost_down_1[16];
extern uint32_t ghost_scared_0[16];
extern uint32_t ghost_scared_1[16];
extern uint32_t cherry[12];
extern uint16_t dot_small[2];
extern uint16_t dot_large[8];

extern uint16_t corner_right_top[8];
extern uint16_t corner_left_top[8];
extern uint16_t corner_right_bottom[8];
extern uint16_t corner_left_bottom[8];
extern uint16_t border_top[8];
extern uint16_t border_bottom[8];
extern uint16_t border_left[8];
extern uint16_t border_right[8];

extern uint32_t pac_color;
extern uint32_t ghost_pink_colors[4];
extern uint32_t ghost_cyan_colors[4];
extern uint32_t ghost_red_colors[4];
extern uint32_t ghost_orange_colors[4];
extern uint32_t ghost_scared_colors[4];
extern uint32_t cherry_colors[4];

extern uint32_t border_color;
extern uint32_t dot_color;

#endif
