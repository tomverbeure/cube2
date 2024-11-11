
#include "pacman.h"

#include "pacman_bitmaps.h"

#include "reg.h"
#include "top_defines.h"
#include "hub75_streamer.h"
#include "led_mem.h"

// 4 panels (left, front, right, back), 8x8 for each panel
#define GRID_WIDTH  32
#define GRID_HEIGHT 8
#define GRID_ABOVE  4

#define GRID_WALL       0x00
#define GRID_DOT        0x01
#define GRID_EMPTY      0x02
#define GRID_DOT_LARGE  0x03
#define GRID_IGNORE     0x04

// Each cell is 8x8 pixels -> 8x8 cells per LED Panel
const uint8_t grid1[GRID_HEIGHT+GRID_ABOVE][GRID_WIDTH] = {
    // Left                                             Front                                             Right                                             Back
    { 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04 },
    { 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04 },
    { 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04 },
    { 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,   0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04 },

    { 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,   0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00,   0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00,   0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00,   0x00, 0x00, 0x00, 0x03, 0x01, 0x01, 0x01, 0x00,   0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01 },
    { 0x01, 0x00, 0x00, 0x03, 0x01, 0x01, 0x01, 0x01,   0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00,   0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00,   0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00 },
    { 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01,   0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00,   0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00 },
    { 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,   0x01, 0x01, 0x01, 0x01, 0x03, 0x01, 0x01, 0x01,   0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,   0x01, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01 },
    { 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00,   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,   0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00 }
};

uint8_t active_grid[GRID_HEIGHT+GRID_ABOVE][GRID_WIDTH];

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
    int             dead;
} t_pacman;

typedef struct s_ghost {
    t_navigation    nav;
    // When ==0: normal mode
    // When >0:  vulnerable mode
    // When <0:  eyes-only mode
    int             vulnerable;
    int             anim_phase;
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

void render_field(int buffer, uint8_t grid[GRID_HEIGHT+GRID_ABOVE][32])
{
    // FIXME: add support for top and bottom
    for(int grid_y=0; grid_y<GRID_HEIGHT;++grid_y){
        for(int grid_x=0; grid_x<GRID_WIDTH;++grid_x){

            int cell = grid[grid_y + GRID_ABOVE][grid_x];
            
            int pos_x = grid_x * 8 + 8;     // middle coordinate of 8x8 cell
            int pos_y = grid_y * 8 + 8;

            //============================================================
            // Render edible small dot
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

            //============================================================
            // Render edible small dot
            //============================================================
            if (cell==GRID_DOT_LARGE){
                if (grid_y==7){
                    continue;
                }
                pos_x -= 4;
                pos_y -= 4;
                render_bitmap_1bpp(dot_large, dot_color, 8, 8, buffer, RING_LFRBa, pos_x, pos_y, 0);
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
                            has_dot = rx==64 ? grid[ry + GRID_ABOVE][ 0] != GRID_WALL : grid[ry + GRID_ABOVE][rx] != GRID_WALL;
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

int nr_dots = 0;
int max_nr_dots = 0;

void pacman_init()
{
    for(int h=0; h<GRID_HEIGHT + GRID_ABOVE; ++h){
        for(int w=0; w<GRID_WIDTH; ++w){
            active_grid[h][w]   = grid1[h][w];

            if (active_grid[h][w] == GRID_DOT || active_grid[h][w] == GRID_DOT_LARGE){
                ++nr_dots;
            }
        }
    }

    max_nr_dots = nr_dots;

    pacman_state.pacman.nav.dir         = RIGHT;
    pacman_state.pacman.nav.pos_x       = 22     * 8;
    pacman_state.pacman.nav.pos_y       = 2      * 8;
    pacman_state.pacman.mouth_open      = 0;
    pacman_state.pacman.dead            = 0;

    pacman_state.ghosts[0].nav.dir      = RIGHT;
    pacman_state.ghosts[0].nav.pos_x    = 20     * 8 + 2;
    pacman_state.ghosts[0].nav.pos_y    = 2      * 8;
    pacman_state.ghosts[0].vulnerable   = 0;
    pacman_state.ghosts[0].anim_phase   = 0;
    pacman_state.ghosts[0].colors       = ghost_pink_colors;

    pacman_state.ghosts[1].nav.dir      = DOWN;
    pacman_state.ghosts[1].nav.pos_x    = 19     * 8;
    pacman_state.ghosts[1].nav.pos_y    = 1      * 8 + 2;
    pacman_state.ghosts[1].vulnerable   = 0;
    pacman_state.ghosts[1].anim_phase   = 0;
    pacman_state.ghosts[1].colors       = ghost_red_colors;

    pacman_state.ghosts[2].nav.dir      = DOWN;
    pacman_state.ghosts[2].nav.pos_x    = 19     * 8;
    pacman_state.ghosts[2].nav.pos_y    = 0      * 8 + 2;
    pacman_state.ghosts[2].vulnerable   = 0;
    pacman_state.ghosts[2].anim_phase   = 0;
    pacman_state.ghosts[2].colors       = ghost_orange_colors;

    pacman_state.ghosts[3].nav.dir      = DOWN;
    pacman_state.ghosts[3].nav.pos_x    = 18     * 8;
    pacman_state.ghosts[3].nav.pos_y    = 0      * 8 + 2;
    pacman_state.ghosts[3].vulnerable   = 0;
    pacman_state.ghosts[3].anim_phase   = 0;
    pacman_state.ghosts[3].colors       = ghost_cyan_colors;
}

void pacman_navigate(t_navigation *nav, int eat_dot)
{
    if ( (nav->pos_x & 7) == 0 && (nav->pos_y & 7) == 0){
        // In the center of a square. Decided where to go next.

        int g_pos_x  = (nav->pos_x >> 3) % GRID_WIDTH;
        int g_pos_y  = (nav->pos_y >> 3) % GRID_HEIGHT;

        int ghost_vulnerable_duration = 200;

        if (eat_dot){
            if (active_grid[g_pos_y + GRID_ABOVE][g_pos_x] == GRID_DOT){
                active_grid[g_pos_y + GRID_ABOVE][g_pos_x] = GRID_EMPTY;
                --nr_dots;
            }

            if (active_grid[g_pos_y + GRID_ABOVE][g_pos_x] == GRID_DOT_LARGE){
                active_grid[g_pos_y + GRID_ABOVE][g_pos_x] = GRID_EMPTY;
                --nr_dots;

                for(int i=0;i<4;++i){
                    if (pacman_state.ghosts[i].vulnerable >= 0){
                        pacman_state.ghosts[i].vulnerable   = ghost_vulnerable_duration;
                    }
                }
            }
        }

        int has_wall[4];
        has_wall[RIGHT]  = active_grid[g_pos_y + GRID_ABOVE][ (g_pos_x+1) % GRID_WIDTH ]     == GRID_WALL;
        has_wall[LEFT]   = active_grid[g_pos_y + GRID_ABOVE][ (g_pos_x-1 + GRID_WIDTH) % GRID_WIDTH ]     == GRID_WALL;
        has_wall[UP]     = g_pos_y == 0             ? 1 : active_grid[ (g_pos_y-1 + GRID_HEIGHT) % GRID_HEIGHT + GRID_ABOVE ][ g_pos_x ] == GRID_WALL;
        has_wall[DOWN]   = g_pos_y == GRID_HEIGHT-2 ? 1 : active_grid[ (g_pos_y+1)               % GRID_HEIGHT + GRID_ABOVE ][ g_pos_x ] == GRID_WALL;

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
    
    // Animate pacman and ghost icons
    if (REG_RD(HUB75S_FRAME_CNTR) % 32 >= 16){
        p->mouth_open   = 0;
    }
    else{
        p->mouth_open   = 1;
    }

    for(int i=0;i<4;++i){
        t_ghost *g = &pacman_state.ghosts[i];

        int eat_distance = 6;

        int diff_x = p->nav.pos_x - g->nav.pos_x;
        int diff_y = p->nav.pos_y - g->nav.pos_y;

        // Pacman eats ghost
        if (g->vulnerable > 0){

            int eyes_only_duration = -120;
    
            if (diff_y == 0){
                if (p->nav.dir == RIGHT){
                    if (diff_x >= 0 && diff_x < eat_distance){
                        g->vulnerable = eyes_only_duration;
                    }
                }
                else if (p->nav.dir == LEFT){
                    if (diff_x <= 0 && diff_x > -eat_distance){
                        g->vulnerable = eyes_only_duration;
                    }
                }
            }
            if (diff_x == 0){
                if (p->nav.dir == DOWN){
                    if (diff_y >= 0 && diff_y < eat_distance){
                        g->vulnerable = eyes_only_duration;
                    }
                }
                else if (p->nav.dir == UP){
                    if (diff_y <= 0 && diff_y > -eat_distance){
                        g->vulnerable = eyes_only_duration;
                    }
                }
            }
        }
        else if (g->vulnerable == 0 && !p->dead){
            if (diff_y == 0){
                if (g->nav.dir == LEFT){
                    if (diff_x >= 0 && diff_x < eat_distance){
                        p->dead         = 1;
                    }
                }
                else if (g->nav.dir == RIGHT){
                    if (diff_x <= 0 && diff_x > -eat_distance){
                        p->dead         = 1;
                    }
                }
            }
            if (diff_x == 0){
                if (g->nav.dir == UP){
                    if (diff_y >= 0 && diff_y < eat_distance){
                        p->dead         = 1;
                    }
                }
                else if (g->nav.dir == DOWN){
                    if (diff_y <= 0 && diff_y > -eat_distance){
                        p->dead         = 1;
                    }
                }
            }
        }
    }

    if (p->dead){
        p->mouth_open   = 0;

        if (p->dead == 50){
            p->dead     = 0;
        }
        else{
            ++p->dead;
        }
    }

    for(int i=0;i<4;++i){
        t_ghost *g = &pacman_state.ghosts[i];
        g->anim_phase   = p->mouth_open;
        if (g->vulnerable > 0){
            --g->vulnerable;
        }
        else if (g->vulnerable < 0){
            ++g->vulnerable;
        }
    }

    if (!p->dead){
        pacman_navigate(&p->nav, 1);
    }

    for (int i=0;i<4;++i){
        t_ghost *g = &pacman_state.ghosts[i];
        pacman_navigate(&g->nav, 0);
        if (g->vulnerable<0){
            pacman_navigate(&g->nav, 0);
            pacman_navigate(&g->nav, 0);
        }
    }

    // Replenish dots
    if (nr_dots < max_nr_dots*2/3){
        int g_pos_x = xorshift32() % GRID_WIDTH;
        int g_pos_y = xorshift32() % GRID_HEIGHT;

        if (active_grid[g_pos_y + GRID_ABOVE][g_pos_x] == GRID_EMPTY){

            if (grid1[g_pos_y + GRID_ABOVE][g_pos_x] == GRID_DOT_LARGE){
                active_grid[g_pos_y + GRID_ABOVE][g_pos_x] = GRID_DOT_LARGE;
            }
            else{
                active_grid[g_pos_y + GRID_ABOVE][g_pos_x] = GRID_DOT;
            }
            ++nr_dots;
        }
    }

}

void pacman_render()
{
    static uint32_t scratch_buf = 0;

    scratch_buf ^= 1;
    led_mem_clear(scratch_buf);

    #if 1
    render_field(scratch_buf,active_grid);


    for(int i=0;i<4;++i){
        t_ghost *g = &pacman_state.ghosts[i];

        uint32_t *current_ghost;
        uint32_t *current_ghost_colors = g->colors;

        int rotation = ROT_0;

        switch(g->nav.dir){
            default:
            case RIGHT:     { current_ghost = g->anim_phase ? ghost_right_0 : ghost_right_1; break; }
            case LEFT:      { current_ghost = g->anim_phase ? ghost_right_0 : ghost_right_1; rotation = ROT_FLIP_Y; break; }
            case UP:        { current_ghost = g->anim_phase ? ghost_up_0    : ghost_up_1;    break; }
            case DOWN:      { current_ghost = g->anim_phase ? ghost_down_0  : ghost_down_1;  break; }
        }

        if (g->vulnerable > 0){
            current_ghost           = g->anim_phase ? ghost_scared_0 : ghost_scared_1;

            if (g->vulnerable < 40){
                current_ghost_colors    = ((g->vulnerable/4) & 1) == 0 ? ghost_scared_colors : ghost_scared_inv_colors;
            }
            else{
                current_ghost_colors    = ghost_scared_colors;
            }
        }
        else if (g->vulnerable < 0){
            current_ghost_colors    = ghost_eyes_only_colors;

            switch(g->nav.dir){
                default:
                case RIGHT:     { current_ghost = eyes_right; break; }
                case LEFT:      { current_ghost = eyes_right; rotation = ROT_FLIP_Y; break; }
                case UP:        { current_ghost = eyes_up;    break; }
                case DOWN:      { current_ghost = eyes_down;  break; }
            }
        }

        render_bitmap_2bpp(current_ghost, current_ghost_colors, 14, 14, scratch_buf, RING_LFRBa, (g->nav.pos_x+1) % (4*HUB75S_SIDE_WIDTH), g->nav.pos_y, rotation);
    }

    t_pacman *p = &pacman_state.pacman;
    uint16_t *current_pac       = p->mouth_open ? pacman_open_0 : pacman_closed;

    if (pacman_state.pacman.dead == 0){
        int rotation = 0;
        int x_offset = 0;
        switch(p->nav.dir){
            case RIGHT: { rotation = ROT_0;   break; }    
            case LEFT:  { rotation = ROT_180; x_offset = -1; break; }    
            case UP:    { rotation = ROT_90;  break; }    
            case DOWN:  { rotation = ROT_270; break; }    
        }
    
        render_bitmap_1bpp(current_pac, pac_color, 15, 15, scratch_buf, RING_LFRBa, (p->nav.pos_x + x_offset) % (4*HUB75S_SIDE_WIDTH), p->nav.pos_y, rotation);
    }
    else{
        const uint16_t * pacman_wilts[11] = {
            pacman_wilt_0, pacman_wilt_1, pacman_wilt_2, pacman_wilt_3, pacman_wilt_4,
            pacman_wilt_5, pacman_wilt_6, pacman_wilt_7, pacman_wilt_8, pacman_wilt_9,
            pacman_wilt_10,
            };

        int wilt_phase = p->dead/2;

        if (wilt_phase < 10){
            render_bitmap_1bpp(pacman_wilts[wilt_phase], pac_color, 16, 16, scratch_buf, RING_LFRBa, p->nav.pos_x % (4*HUB75S_SIDE_WIDTH), p->nav.pos_y, 0);
        }
        else if (wilt_phase == 11 || wilt_phase == 13){
            render_bitmap_1bpp(pacman_wilts[10], pac_color, 16, 16, scratch_buf, RING_LFRBa, p->nav.pos_x % (4*HUB75S_SIDE_WIDTH), p->nav.pos_y-3, 0);
        }
    }
    #endif

    render_bitmap_2bpp(cherry, cherry_colors, 12, 12, scratch_buf, RING_LFRBa, 26+HUB75S_SIDE_WIDTH*0, -16, ROT_0);
    render_bitmap_2bpp(cherry, cherry_colors, 12, 12, scratch_buf, RING_LFRBa, 26+HUB75S_SIDE_WIDTH*1, -16, ROT_0);
    render_bitmap_2bpp(cherry, cherry_colors, 12, 12, scratch_buf, RING_LFRBa, 26+HUB75S_SIDE_WIDTH*2, -16, ROT_0);
    render_bitmap_2bpp(cherry, cherry_colors, 12, 12, scratch_buf, RING_LFRBa, 26+HUB75S_SIDE_WIDTH*3, -16, ROT_0);

    //led_mem_wr(scratch_buf, SIDE_TOP,  63-0, 63-10, 255, 0, 0);
    //led_mem_wr(scratch_buf, SIDE_TOP,  5, 10, 0, 255, 0);
    //led_mem_wr(scratch_buf, SIDE_LEFT, 10, 0, 0, 255, 0);

    REG_WR_FIELD(HUB75S_CONFIG, BUFFER_NR, scratch_buf);
    while(REG_RD_FIELD(HUB75S_STATUS, CUR_BUFFER_NR) != scratch_buf) 
        ;

    uint32_t prev_frame_cntr = REG_RD(HUB75S_FRAME_CNTR);
    while(REG_RD(HUB75S_FRAME_CNTR) < prev_frame_cntr + 7) ;

    //while(1);

}
