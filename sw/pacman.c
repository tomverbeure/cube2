
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

typedef struct s_navigation {
    t_direction     dir;
    int             pos_x;
    int             pos_y;
} t_navigation;

typedef struct s_pacman {
    t_navigation    nav;
    int             mouth_open;
} t_pacman;

typedef struct s_ghost {
    t_navigation    nav;
    int             phase;
    uint32_t *      colors;
} t_ghost;

typedef struct s_pacman_state {
    t_pacman        pacman;
    t_ghost         ghosts[4];
} t_pacman_state;

t_pacman_state  pacman_state;

uint32_t xorshift32() 
{
    // XORShift algorithm for 32-bit values
    static uint32_t x = 1;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    return x;
}

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
                render_bitmap_1bpp(dot_small, dot_color, 2, 2, buffer, RING_LFRBa, pos_x, pos_y, 0);
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
                        render_bitmap_1bpp(corner_left_top, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                    }
                    else if (neighbor_has_dot[0+1][1+1]){    // right
                        render_bitmap_1bpp(corner_right_top, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                    }
                    else{
                        render_bitmap_1bpp(border_top, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                    }
                }
                else if (neighbor_has_dot[1+1][0+1]){        // below
                    if (neighbor_has_dot[0+1][-1+1]){        // left
                        render_bitmap_1bpp(corner_left_bottom, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                    }
                    else if (neighbor_has_dot[0+1][1+1]){    // right
                        render_bitmap_1bpp(corner_right_bottom, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                    }
                    else{
                        render_bitmap_1bpp(border_bottom, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                    }
                }
                else if (neighbor_has_dot[0+1][-1+1]){       // left
                    render_bitmap_1bpp(border_left, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                }
                else if (neighbor_has_dot[0+1][1+1]){       // right
                    render_bitmap_1bpp(border_right, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                }
    
                else if (neighbor_has_dot[-1+1][1+1]){        // above-right
                    render_bitmap_1bpp(corner_left_bottom, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                }
                else if (neighbor_has_dot[-1+1][-1+1]){        // above-left
                    render_bitmap_1bpp(corner_right_bottom, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                }
                else if (neighbor_has_dot[1+1][1+1]){        // below-right
                    render_bitmap_1bpp(corner_left_top, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
                }
                else if (neighbor_has_dot[1+1][-1+1]){        // below-left
                    render_bitmap_1bpp(corner_right_top, border_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
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

    pacman_state.pacman.nav.dir         = RIGHT;
    pacman_state.pacman.nav.pos_x       = 22     * 8;
    pacman_state.pacman.nav.pos_y       = 2      * 8;
    pacman_state.pacman.mouth_open      = 0;

    pacman_state.ghosts[0].nav.dir      = RIGHT;
    pacman_state.ghosts[0].nav.pos_x    = 20     * 8 + 2;
    pacman_state.ghosts[0].nav.pos_y    = 2      * 8;
    pacman_state.ghosts[0].phase        = 0;
    pacman_state.ghosts[0].colors       = ghost_pink_colors;

    pacman_state.ghosts[1].nav.dir      = DOWN;
    pacman_state.ghosts[1].nav.pos_x    = 19     * 8;
    pacman_state.ghosts[1].nav.pos_y    = 1      * 8 + 2;
    pacman_state.ghosts[1].phase        = 0;
    pacman_state.ghosts[1].colors       = ghost_red_colors;

    pacman_state.ghosts[2].nav.dir      = DOWN;
    pacman_state.ghosts[2].nav.pos_x    = 19     * 8;
    pacman_state.ghosts[2].nav.pos_y    = 0      * 8 + 2;
    pacman_state.ghosts[2].phase        = 0;
    pacman_state.ghosts[2].colors       = ghost_orange_colors;

    pacman_state.ghosts[3].nav.dir      = DOWN;
    pacman_state.ghosts[3].nav.pos_x    = 18     * 8;
    pacman_state.ghosts[3].nav.pos_y    = 0      * 8 + 2;
    pacman_state.ghosts[3].phase        = 0;
    pacman_state.ghosts[3].colors       = ghost_cyan_colors;
}

void pacman_navigate(t_navigation *nav, int eat_dot)
{
    if ( (nav->pos_x & 7) == 0 && (nav->pos_y & 7) == 0){
        // In the center of a square. Decided where to go next.

        int g_pos_x  = (nav->pos_x >> 3) % GRID_WIDTH;
        int g_pos_y  = (nav->pos_y >> 3) % GRID_HEIGHT;

        if (eat_dot){
            if (active_grid[g_pos_y][g_pos_x] == GRID_DOT){
                active_grid[g_pos_y][g_pos_x] = GRID_EMPTY;
            }
        }

        int has_wall[4];
        has_wall[RIGHT]  = active_grid[g_pos_y][ (g_pos_x+1) % GRID_WIDTH ]     == GRID_WALL;
        has_wall[LEFT]   = active_grid[g_pos_y][ (g_pos_x-1 + GRID_WIDTH) % GRID_WIDTH ]     == GRID_WALL;
        has_wall[UP]     = g_pos_y == 0             ? 1 : active_grid[ (g_pos_y-1 + GRID_HEIGHT) % GRID_HEIGHT ][ g_pos_x ] == GRID_WALL;
        has_wall[DOWN]   = g_pos_y == GRID_HEIGHT-2 ? 1 : active_grid[ (g_pos_y+1) % GRID_HEIGHT ][ g_pos_x ] == GRID_WALL;

        // Don't go the inverse direction
        has_wall[nav->dir ^ 3]    = 1;

        int r = xorshift32() & 3;

        while(has_wall[r]){
            r = (r + 1)&3;
        }
        nav->dir  = r;
    }

    if (nav->dir == RIGHT){
        nav->pos_x    = (nav->pos_x + 1) % (4*HUB75S_SIDE_WIDTH);
    }
    else if (nav->dir == LEFT){
        nav->pos_x    = (nav->pos_x - 1 + 4*HUB75S_SIDE_WIDTH) % (4*HUB75S_SIDE_WIDTH);
    }

    if (nav->dir == UP){
        nav->pos_y    = (nav->pos_y - 1 + 4*HUB75S_SIDE_HEIGHT) % (1*HUB75S_SIDE_HEIGHT);
    }
    else if (nav->dir == DOWN){
        nav->pos_y    = (nav->pos_y + 1) % (1*HUB75S_SIDE_HEIGHT);
    }
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

    pacman_navigate(&p->nav, 1);
    pacman_navigate(&pacman_state.ghosts[0].nav, 0);
    pacman_navigate(&pacman_state.ghosts[1].nav, 0);
    pacman_navigate(&pacman_state.ghosts[2].nav, 0);
    pacman_navigate(&pacman_state.ghosts[3].nav, 0);

}

void pacman_render()
{
    static uint32_t scratch_buf = 0;

    static int pos_x = 0;
    static int pos_y = 24;

    scratch_buf ^= 1;
    led_mem_clear(scratch_buf);
    render_field(scratch_buf,active_grid);

    uint32_t *current_ghost_scared  = ghost_scared_0;
    
    if (REG_RD(HUB75S_FRAME_CNTR) % 32 >= 16){
        current_ghost_scared    = ghost_scared_1;
    }

    uint16_t *current_pac       = pacman_state.pacman.mouth_open ? pacman_open : pacman_closed;

    int rotation = 0;
    switch(pacman_state.pacman.nav.dir){
        case RIGHT: { rotation = ROT_0;   break; }    
        case LEFT:  { rotation = ROT_180; break; }    
        case UP:    { rotation = ROT_90;  break; }    
        case DOWN:  { rotation = ROT_270; break; }    
    }

    render_bitmap_1bpp(current_pac, pac_color, 15, 15, scratch_buf, RING_LFRBa, (pacman_state.pacman.nav.pos_x) % (4*HUB75S_SIDE_WIDTH), pacman_state.pacman.nav.pos_y, rotation);

    int chase_dist = 20;
    int ghost_delta = 12;

    for(int i=0;i<4;++i){
        t_ghost *g = &pacman_state.ghosts[i];
        uint32_t *current_ghost         = ghost_left_0;
        int rotation = ROT_0;

        switch(g->nav.dir){
            default:
            case RIGHT:     { current_ghost = ghost_right_0; break; }
            case LEFT:      { current_ghost = ghost_right_0; rotation = ROT_FLIP_Y; break; }
            case UP:        { current_ghost = ghost_up_0;    break; }
            case DOWN:      { current_ghost = ghost_down_0;  break; }
        }

        render_bitmap_2bpp(current_ghost, g->colors, 14, 14, scratch_buf, RING_LFRBa, (g->nav.pos_x+1) % (4*HUB75S_SIDE_WIDTH), g->nav.pos_y, rotation);
    }

    /*
    render_bitmap_2bpp(current_ghost,   ghost_pink_colors,    14, 14, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 0 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);
    render_bitmap_2bpp(current_ghost,   ghost_red_colors,     14, 14, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 1 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);
    render_bitmap_2bpp(current_ghost,   ghost_orange_colors,  14, 14, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 2 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);
    render_bitmap_2bpp(current_ghost,   ghost_cyan_colors,    14, 14, scratch_buf, RING_LFRBa, (pos_x - chase_dist - 3 * ghost_delta) % (4*HUB75S_SIDE_WIDTH), pos_y);

    render_bitmap_2bpp(current_ghost_scared, ghost_scared_colors,  14, 14, scratch_buf, RING_LFRBa, (pos_x + 30) % (4*HUB75S_SIDE_WIDTH), pos_y, 0);
    */

    render_bitmap_2bpp(cherry, cherry_colors, 12, 12, scratch_buf, RING_LFRBa, 10 + HUB75S_SIDE_WIDTH, 10-HUB75S_SIDE_WIDTH, 0);

    pos_x = (pos_x + 1) % (4 * HUB75S_SIDE_WIDTH);

    REG_WR_FIELD(HUB75S_CONFIG, BUFFER_NR, scratch_buf);
    while(REG_RD_FIELD(HUB75S_STATUS, CUR_BUFFER_NR) != scratch_buf) 
        ;

    uint32_t prev_frame_cntr = REG_RD(HUB75S_FRAME_CNTR);
    while(REG_RD(HUB75S_FRAME_CNTR) < prev_frame_cntr + 15) ;

}
