
#include <stdlib.h> 

#include "pacman.h"

#include "pacman_bitmaps.h"

#include "reg.h"
#include "top_defines.h"
#include "hub75_streamer.h"
#include "led_mem.h"

// 4 panels (left, front, right, back), 8x8 for each panel
#define GRID_WIDTH  32
#define GRID_HEIGHT 8

#define GRID_WALL   0x00
#define GRID_DOT    0x01
#define GRID_EMPTY  0x02

// Each cell is 8x8 pixels -> 8x8 cells per LED Panel
const uint8_t grid1[GRID_HEIGHT][GRID_WIDTH] = {
    // 0x00     -> location has nothing but characters can still walk there
    // 0x01     -> location with regular dot. The dot is rendered in the middle of the 8x8 cell.

    // Left                                             Front                                             Right                                             Back
    { 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,   0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00,   0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00,   0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00,   0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00,   0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01 },
    { 0x01, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01,   0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00,   0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00,   0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00,   0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00 },
    { 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,   0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,   0x01, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01 },
    { 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,   0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00 }
};

uint8_t active_grid[GRID_HEIGHT][GRID_WIDTH];

typedef enum e_direction {
    // RIGHT == LEFT ^3, DOWN = UP ^ 3
    RIGHT   = 0,
    DOWN    = 1,
    UP      = 2,
    LEFT    = 3,
} t_direction;

typedef struct s_pacman {
    t_direction     dir;
    int             pos_x;
    int             pos_y;
    int             mouth_open;
    
} t_pacman;

typedef struct s_pacman_state {
    t_pacman        pacman;
} t_pacman_state;

t_pacman_state  pacman_state;


void render_field(int buffer, uint8_t grid[8][32])
{
    // FIXME: add support for top and bottom
    for(int grid_y=0; grid_y<8;++grid_y){
        for(int grid_x=0; grid_x<32;++grid_x){
            int cell = grid[grid_y][grid_x];
            
            int pos_x = grid_x * 8 + 8;     // middle coordinate of 8x8 cell
            int pos_y = grid_y * 8 + 8;

            //============================================================
            // Render edible dot
            //============================================================
            if (cell==GRID_DOT){
                // FIXME: currently looks better this way when not supporting top and bottom
                if (grid_y==7){
                    continue;
                }
                pos_x -= 1;     // dot width (2) /2
                pos_y -= 1;
                render_bitmap_1bpp(dot_small, dot_color, 2, 2, buffer, RING_LFRBa, pos_x, pos_y);
                continue;
            }

            // -width/2
            pos_x -= 4;
            // -height/2
            pos_y -= 4;

            //============================================================
            // Render wall
            //============================================================
            if (cell==GRID_WALL){

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
                            has_dot = rx==64 ? grid[ry][ 0] != GRID_WALL : grid[ry][rx] != GRID_WALL;
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
}

void pacman_init()
{
    for(int h=0; h<GRID_HEIGHT; ++h){
        for(int w=0; w<GRID_WIDTH; ++w){
            active_grid[h][w]   = grid1[h][w];
        }
    }

    pacman_state.pacman.dir         = RIGHT;
    pacman_state.pacman.pos_x       = 0     * 8;
    pacman_state.pacman.pos_x       = 16    * 8;
    pacman_state.pacman.mouth_open  = 0;
}

void pacman_update()
{
    t_pacman *p  = &pacman_state.pacman;

    if (REG_RD(HUB75S_FRAME_CNTR) % 32 >= 16){
        p->mouth_open   = 0;
    }
    else{
        p->mouth_open   = 1;
    }

    if ( (p->pos_x & 7) == 0 && (p->pos_y & 7) == 0){
        // In the center of a square. Decided where to go next.

        int g_pos_x  = p->pos_x >> 3;
        int g_pos_y  = p->pos_y >> 3;

        if (active_grid[g_pos_y][g_pos_x] == GRID_DOT){
            active_grid[g_pos_y][g_pos_x] = GRID_EMPTY;
        }

        int has_wall[4];
        has_wall[RIGHT]  = active_grid[g_pos_y][ (g_pos_x+1) % GRID_WIDTH ]     == GRID_WALL;
        has_wall[LEFT]   = active_grid[g_pos_y][ (g_pos_x-1) % GRID_WIDTH ]     == GRID_WALL;
        has_wall[UP]     = g_pos_y == 0             ? 1 : active_grid[ (g_pos_y-1) % GRID_HEIGHT ][ g_pos_x ] == GRID_WALL;
        has_wall[DOWN]   = g_pos_y == GRID_HEIGHT-2 ? 1 : active_grid[ (g_pos_y+1) % GRID_HEIGHT ][ g_pos_x ] == GRID_WALL;

        // Don't go the inverse direction
        has_wall[p->dir ^ 3]    = 1;

        int r = random() & 3;
        while(has_wall[r]){
            r = (r + 1)&3;
        }
        p->dir  = r;
    }

    if (p->dir == RIGHT){
        p->pos_x    = (p->pos_x + 1) % (4*HUB75S_SIDE_WIDTH);
    }
    else if (p->dir == LEFT){
        p->pos_x    = (p->pos_x - 1) % (4*HUB75S_SIDE_WIDTH);
    }

    if (p->dir == UP){
        p->pos_y    = (p->pos_y - 1) % (1*HUB75S_SIDE_WIDTH);
    }
    else if (p->dir == DOWN){
        p->pos_y    = (p->pos_y + 1) % (1*HUB75S_SIDE_WIDTH);
    }
}

void pacman_render()
{
    static uint32_t scratch_buf = 0;

    static int pos_x = 0;
    static int pos_y = 24;

    scratch_buf ^= 1;
    led_mem_clear(scratch_buf);
    render_field(scratch_buf,active_grid);

    uint32_t *current_ghost         = ghost_left_0;
    uint32_t *current_ghost_scared  = ghost_scared_0;
    
    if (REG_RD(HUB75S_FRAME_CNTR) % 32 >= 16){
        current_ghost           = ghost_left_1;
        current_ghost_scared    = ghost_scared_1;
    }

    uint16_t *current_pac       = pacman_state.pacman.mouth_open ? pacman_open : pacman_closed;

    render_bitmap_1bpp(current_pac, pac_color, 16, 16, scratch_buf, RING_LFRBa, (pacman_state.pacman.pos_x) % (4*HUB75S_SIDE_WIDTH), pacman_state.pacman.pos_y);

    int chase_dist = 20;
    int ghost_delta = 12;

    render_bitmap_2bpp(current_ghost,   ghost_pink_colors,    14, 14, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 0 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);
    render_bitmap_2bpp(current_ghost,   ghost_red_colors,     14, 14, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 1 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);
    render_bitmap_2bpp(current_ghost,   ghost_orange_colors,  14, 14, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 2 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);
    render_bitmap_2bpp(current_ghost,   ghost_cyan_colors,    14, 14, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 3 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);

    render_bitmap_2bpp(current_ghost_scared, ghost_scared_colors,  14, 14, scratch_buf, RING_LFRBa, (pos_x + 30) % (4*HUB75S_SIDE_WIDTH), pos_y);

    render_bitmap_2bpp(cherry, cherry_colors, 12, 12, scratch_buf, RING_LFRBa, 10 + HUB75S_SIDE_WIDTH, 10-HUB75S_SIDE_WIDTH);

    pos_x = (pos_x + 1) % (4 * HUB75S_SIDE_WIDTH);

    REG_WR_FIELD(HUB75S_CONFIG, BUFFER_NR, scratch_buf);
    while(REG_RD_FIELD(HUB75S_STATUS, CUR_BUFFER_NR) != scratch_buf) 
        ;

    uint32_t prev_frame_cntr = REG_RD(HUB75S_FRAME_CNTR);
    while(REG_RD(HUB75S_FRAME_CNTR) < prev_frame_cntr + 15) ;

}
