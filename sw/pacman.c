
#include "pacman.h"

#include "pacman_bitmaps.h"

#include "reg.h"
#include "top_defines.h"
#include "hub75_streamer.h"
#include "led_mem.h"

void play_pacman(int nr_loops)
{
    uint32_t scratch_buf = 1;

    int pos_x = 0;
    int pos_y = 10;

    //uint32_t start_frame = REG_RD(HUB75S_FRAME_CNTR);

    for(int i=0;i<nr_loops;++i){
        for(int j=0;j<HUB75S_SIDE_WIDTH*4;++i){
            led_mem_clear(scratch_buf);
    
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
