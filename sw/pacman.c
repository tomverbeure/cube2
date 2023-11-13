
#include "pacman.h"

#include "pacman_bitmaps.h"

#include "reg.h"
#include "top_defines.h"
#include "hub75_streamer.h"
#include "led_mem.h"

// Each cell is 8x8 pixels -> 8x8 cells per LED Panel
uint8_t grid[8][64] = {
    // 0x01     -> channel with regular dot
    //          the dot is rendered in the middle of the 8x8 cell

    // Left                                             Front                                             Right                                             Back
    { 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00,   0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00,   0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01,   0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x01,   0x00, 0x00, 0x01, 0x01, 0x00, 0x09, 0x01, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,   0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x01,   0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }
};


void render_field(int buffer)
{
    // FIXME: add support for top and bottom
    for(int grid_y=0; grid_y<8;++grid_y){
        for(int grid_x=0; grid_x<64;++grid_x){
            int cell = grid[grid_y][grid_x];
            
            int pos_x = grid_x * 8 + 7;
            int pos_y = grid_y * 8 + 7;

            if (cell==0x01){
                // -width/2
                pos_x -= 1;
                // -height/2
                pos_y -= 1;
                render_bitmap_1bpp(dot_small, dot_color, 2, 2, buffer, RING_LFRBa, pos_x, pos_y);
                continue;
            }

            // -width/2
            pos_x -= 4;
            // -height/2
            pos_y -= 4;

            // Current cell doesn't have a dot...

            uint8_t neighbor_has_dot[3][3];
            for(int hd_y=-1; hd_y<=1;++hd_y){
                int ry = grid_y+hd_y;
                for(int hd_x=-1; hd_x<=1;++hd_x){
                    int rx=grid_x+hd_x;
                    int has_dot;
                    if (ry<0){
                        has_dot = 0;
                    }
                    else if (ry>=64){
                        has_dot = 0;
                    }
                    else{
                        has_dot = rx==64 ? grid[ry][ 0] == 0x01 : grid[ry][rx] == 0x01;
                    }

                    neighbor_has_dot[hd_y+1][hd_x+1] = has_dot;
                }
            }

            if (neighbor_has_dot[-1+1][0+1]){            // above
                if (neighbor_has_dot[0+1][-1+1]){        // left
                    render_bitmap_1bpp(corner_left_top, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
                }
                else if (neighbor_has_dot[0+1][1+1]){    // right
                    render_bitmap_1bpp(corner_right_top, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
                }
                else{
                    render_bitmap_1bpp(border_top, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
                }
            }
            else if (neighbor_has_dot[1+1][0+1]){        // below
                if (neighbor_has_dot[0+1][-1+1]){        // left
                    render_bitmap_1bpp(corner_left_bottom, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
                }
                else if (neighbor_has_dot[0+1][1+1]){    // right
                    render_bitmap_1bpp(corner_right_bottom, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
                }
                else{
                    render_bitmap_1bpp(border_bottom, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
                }
            }
            else if (neighbor_has_dot[0+1][-1+1]){       // left
                render_bitmap_1bpp(border_left, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
            }
            else if (neighbor_has_dot[0+1][1+1]){       // right
                render_bitmap_1bpp(border_right, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
            }

            else if (neighbor_has_dot[-1+1][1+1]){        // above-right
                render_bitmap_1bpp(corner_left_bottom, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
            }
            else if (neighbor_has_dot[-1+1][-1+1]){        // above-left
                render_bitmap_1bpp(corner_right_bottom, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
            }
            else if (neighbor_has_dot[1+1][1+1]){        // below-right
                render_bitmap_1bpp(corner_left_top, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
            }
            else if (neighbor_has_dot[1+1][-1+1]){        // below-left
                render_bitmap_1bpp(corner_right_top, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y);
            }

        }
    }
}


void play_pacman(int nr_loops)
{
    uint32_t scratch_buf = 1;

    int pos_x = 0;
    int pos_y = 10;

    //uint32_t start_frame = REG_RD(HUB75S_FRAME_CNTR);

    for(int i=0;i<nr_loops;++i){
        for(int j=0;j<HUB75S_SIDE_WIDTH*4;++i){
            led_mem_clear(scratch_buf);

#if 0
            render_bitmap_1bpp(dot_small, dot_color, 2, 2, scratch_buf, RING_LFRBa, -1, 7);
            render_bitmap_1bpp(dot_small, dot_color, 2, 2, scratch_buf, RING_LFRBa, 7, 7);
            render_bitmap_1bpp(dot_small, dot_color, 2, 2, scratch_buf, RING_LFRBa, 15, 7);
            render_bitmap_1bpp(dot_small, dot_color, 2, 2, scratch_buf, RING_LFRBa, 15, -1);
#endif
            render_field(scratch_buf);
    
            uint32_t *current_ghost         = ghost_left_0;
            uint32_t *current_ghost_scared  = ghost_scared_0;
            uint16_t *current_pac           = pacman_open;
            
            if (REG_RD(HUB75S_FRAME_CNTR) % 30 > 15){
                current_ghost           = ghost_left_1;
                current_ghost_scared    = ghost_scared_1;
                current_pac             = pacman_closed;
            }
    
            //render_bitmap_1bpp(current_pac, pac_color, 11, 11, scratch_buf, RING_LFRBa, (pos_x) % (4*HUB75S_SIDE_WIDTH), pos_y);
            render_bitmap_1bpp(current_pac, pac_color, 16, 16, scratch_buf, RING_LFRBa, (pos_x) % (4*HUB75S_SIDE_WIDTH), pos_y);

            int chase_dist = 20;
            int ghost_delta = 12;
    
            render_bitmap_2bpp(current_ghost,   ghost_pink_colors,    16, 16, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 0 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);
            render_bitmap_2bpp(current_ghost,   ghost_red_colors,     16, 16, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 1 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);
            render_bitmap_2bpp(current_ghost,   ghost_orange_colors,  16, 16, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 2 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);
            render_bitmap_2bpp(current_ghost,   ghost_cyan_colors,    16, 16, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 3 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);
    
            render_bitmap_2bpp(current_ghost_scared, ghost_scared_colors,  16, 16, scratch_buf, RING_LFRBa, (pos_x + 30) % (4*HUB75S_SIDE_WIDTH), pos_y);
    
            render_bitmap_2bpp(cherry, cherry_colors, 12, 12, scratch_buf, RING_LFRBa, 10 + HUB75S_SIDE_WIDTH, 10-HUB75S_SIDE_WIDTH);
    
            pos_x = (pos_x + 1) % (4 * HUB75S_SIDE_WIDTH);
    
            uint32_t prev_frame_cntr = REG_RD(HUB75S_FRAME_CNTR);
            while(REG_RD(HUB75S_FRAME_CNTR) < prev_frame_cntr + 15) ;
    
            REG_WR_FIELD(HUB75S_CONFIG, BUFFER_NR, scratch_buf);
            while(REG_RD_FIELD(HUB75S_STATUS, CUR_BUFFER_NR) != scratch_buf) 
                ;
    
            scratch_buf ^= 1;
        }
    }
}
