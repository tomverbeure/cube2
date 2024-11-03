#ifndef PACMAN_BITMAPS_H
#define PACMAN_BITMAPS_H

#include <stdint-gcc.h>

extern uint16_t pacman_closed[15];

extern uint16_t pacman_open_0[15];
extern uint16_t pacman_open_1[15];

extern uint16_t pacman_wilt_0[15];
extern uint16_t pacman_wilt_1[15];
extern uint16_t pacman_wilt_2[15];
extern uint16_t pacman_wilt_3[15];
extern uint16_t pacman_wilt_4[15];
extern uint16_t pacman_wilt_5[15];
extern uint16_t pacman_wilt_6[15];
extern uint16_t pacman_wilt_7[15];
extern uint16_t pacman_wilt_8[15];
extern uint16_t pacman_wilt_9[15];
extern uint16_t pacman_wilt_10[15];

extern uint32_t ghost_left_0[16];
extern uint32_t ghost_left_1[16];
extern uint32_t ghost_right_0[16];
extern uint32_t ghost_right_1[16];
extern uint32_t ghost_up_0[16];
extern uint32_t ghost_up_1[16];
extern uint32_t ghost_down_0[16];
extern uint32_t ghost_down_1[16];

extern uint32_t ghost_scared_0[16];
extern uint32_t ghost_scared_1[16];

extern uint32_t eyes_right[16];
extern uint32_t eyes_up[16];
extern uint32_t eyes_down[16];

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
extern uint32_t ghost_scared_inv_colors[4];
extern uint32_t ghost_eyes_only_colors[4];
extern uint32_t cherry_colors[4];

extern uint32_t border_color;
extern uint32_t dot_color;

#endif
