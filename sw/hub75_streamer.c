
#include <stddef.h>
#include <stdint-gcc.h>

#include "top_defines.h"
#include "reg.h"
#include "hub75_streamer.h"


const int panel_rows        = 64;
const int panel_cols        = 64;
int pixels_per_panel;

typedef enum {
    ORIENT_X_Y          = 0,
    ORIENT_X_INV_Y      = 1,
    ORIENT_INV_X_Y      = 2,
    ORIENT_INV_X_INV_Y  = 3,

    ORIENT_Y_X          = 4,
    ORIENT_Y_INV_X      = 5,
    ORIENT_INV_Y_X      = 6,
    ORIENT_INV_Y_INV_X  = 7
} e_orient;


// The last 3 numbers are filled in at runtime by hub75s_config()
t_panel_info panels[] = {
    { -1, 1, 1,  0 /* left   */,   90,    1,-1, 0,  0,0,0 },   // Buffer 0 
    { -1, 1, 1,  1 /* front  */,  270,    1,-1, 0,  0,0,0 },   // Buffer 1
    { -1, 1, 1,  2 /* right  */,   90,    1,-1, 0,  0,0,0 },   // Buffer 2
    { -1, 1, 1,  3 /* back   */,   90,    1,-1, 0,  0,0,0 },   // Buffer 3
    { -1, 1, 1,  4 /* bottom */,  180,    1,-1, 0,  0,0,0 },   // Buffer 4
    {  1, 1, 1,  5 /* top */,     180,    1,-1, 0,  0,0,0 },   // Buffer 5
};

void hub75s_config(void)
{
    pixels_per_panel  = panel_rows * panel_cols;

    for(int i=0; i<(int)(sizeof(panels)/sizeof(t_panel_info));++i){
        t_panel_info *pi = &panels[i];

        int memAddrStartPh0     = 2 * pi->side * pixels_per_panel;
        //int memAddrStartPh1     = 2 * pi->side * pixels_per_panel;
        int memAddrColMul       = 1;
        int memAddrRowMul       = 1;

        if (pi->sideRotation == 0){
            //memAddrStartPh1     = memAddrStartPh0 + panel_rows/2 * panel_cols;

            memAddrColMul       = 1;
            memAddrRowMul       = panel_cols;
        }
        else if (pi->sideRotation == 90) {
            memAddrStartPh0     += panel_cols -1;
            //memAddrStartPh1     = memAddrStartPh0 - panel_rows/2;

            memAddrColMul       = panel_cols;
            memAddrRowMul       = -1;
        }
        else if (pi->sideRotation == 180){
            memAddrStartPh0     += panel_rows * panel_cols - 1;
            //memAddrStartPh1     = memAddrStartPh0 - (panel_rows/2 * panel_cols);

            memAddrColMul       = -1;
            memAddrRowMul       = -panel_cols;
        }
        else{
            memAddrStartPh0     += (panel_rows-1) * panel_cols;
            //memAddrStartPh1     = memAddrStartPh0 - (panel_rows/2 * panel_cols);

            memAddrColMul       = -panel_cols;
            memAddrRowMul       = 1;
        }

        pi->memAddrStartPh0 = memAddrStartPh0;
        //pi->memAddrStartPh1 = memAddrStartPh1;
        pi->memAddrColMul   = memAddrColMul;
        pi->memAddrRowMul   = memAddrRowMul;

#if 0
        HUB75S_PI_REG_WR(i, MEM_ADDR_START_PH0, memAddrStartPh0);
        HUB75S_PI_REG_WR(i, MEM_ADDR_START_PH1, memAddrStartPh1);
        HUB75S_PI_REG_WR(i, MEM_ADDR_COL_MUL, memAddrColMul);
        HUB75S_PI_REG_WR(i, MEM_ADDR_ROW_MUL, memAddrRowMul);
#endif
    }
}


void hub75s_start(void)
{
    REG_WR_FIELD(HUB75S_CONFIG, ENABLE, 1);
    REG_WR_FIELD(HUB75S_CONFIG, START, 1);
    REG_WR_FIELD(HUB75S_CONFIG, AUTO_RESTART, 1);
    REG_WR_FIELD(HUB75S_CONFIG, BUFFER_NR, 0);
}

void hub75s_dim(unsigned char r_dim, unsigned char g_dim, unsigned char b_dim)
{
    REG_WR(HUB75S_RGB_DIM, (b_dim << 16) | (g_dim << 8) | r_dim);
}

int hub75s_get_scratch_buffer(void)
{
    int row;
    do{
        row = REG_RD_FIELD(HUB75S_STATUS, CUR_ROW_NR);
    }
    while(row != 1);

    return !REG_RD_FIELD(HUB75S_STATUS, CUR_BUFFER_NR);
}

// The panels are arranged as follows:
// 
// Left, Front, Right Back
//
// +-+-+-+-+-+-+-+-+
// |L|F|R|B|L|F|R|B|
// +-+-+-+-+-+-+-+-+
//
// (0,0) is the left/top of the Left panel. 
// The x axis is horizontal, the y axis is vertical.
// When X is larger than 4 panels, it simply wraps around the ring.
// When Y is less than 0 or larger than the panel height, it
// spills over to the top and bottom.

uint32_t hub75s_ring_coord2addr(int buffer_nr, int ring_nr, int x, int y)
{
    const uint8_t side_nr_lut[3][3][4] = {
        // Ring 0: | L | F | R | Ba
        {
            { SIDE_TOP,     SIDE_TOP,      SIDE_TOP,      SIDE_TOP      },
            { SIDE_LEFT,    SIDE_FRONT,    SIDE_RIGHT,    SIDE_BACK     },
            { SIDE_BOTTOM,  SIDE_BOTTOM,   SIDE_BOTTOM,   SIDE_BOTTOM   }
        }
    };

    if (x<0){
        x += 4*HUB75S_SIDE_WIDTH;
    }

    // FIXME: deal with y being larger than 2*HUB75S_SIDE_HEIGHT
    int vert_strip_nr   = (y<0)                   ? 0 :  
                          (y>HUB75S_SIDE_HEIGHT)  ? 2 :
                                                    1 ;

    int horiz_panel_nr  = (x / HUB75S_SIDE_WIDTH) % 4;
    int side_nr     = side_nr_lut[ring_nr][vert_strip_nr][horiz_panel_nr];


    x = x % HUB75S_SIDE_WIDTH;
    y = y % HUB75S_SIDE_HEIGHT;     // FIXME: this is totally wrong for <0 and >= HUB75S_SIDE_HEIGHT 

    int addr = hub75s_coord2addr(buffer_nr, side_nr, x, y);
    return addr;
}

/*
uint32_t hub75s_calc_phys_addr(int buffer, int log_addr)
{
    return log_addr; 

    const uint32_t side_width  = HUB75S_SIDE_WIDTH;
    const uint32_t side_height = HUB75S_SIDE_HEIGHT;
    const uint32_t side_size   = HUB75S_SIDE_SIZE;

    const uint32_t strip_width = HUB75S_STRIP_WIDTH;
    const uint32_t strip_width = HUB75S_STRIP_WIDTH;
    const uint32_t strip_size  = HUB75S_STRIP_SIZE;

    const uint32_t ring_size   = HUB75S_RING_SIZE;

    uint32_t cur_ring_nr     = log_addr / ring_size;
    log_addr = log_addr % ring_size;

    uint32_t cur_strip_y_nr = log_addr  / strip_size;
    uint32_t cur_strip_x_nr = (log_addr / side_width) & 3;

    uint32_t y = (log_addr / strip_width) % side_height;
    uint32_t x = log_addr % side_width;

    const uint8_t side_nr_lut[3][3][4] = {
        // Ring 0: | L | F | R | Ba
        {
            { SIDE_TOP,     SIDE_TOP,      SIDE_TOP,      SIDE_TOP      },
            { SIDE_LEFT,    SIDE_FRONT,    SIDE_RIGHT,    SIDE_BACK     },
            { SIDE_BOTTOM,  SIDE_BOTTOM,   SIDE_BOTTOM,   SIDE_BOTTOM   }
        }
    };

    const uint8_t orient_class_lut[3][3][4] = {
        // Ring 0: | L | F | R | Ba| 
        {
            // 
            { ORIENT_INV_Y_X,   ORIENT_X_Y,    ORIENT_Y_INV_X,      ORIENT_INV_X_INV_Y     },
            { ORIENT_X_Y,       ORIENT_X_Y,    ORIENT_X_Y,          ORIENT_X_Y             },
            { ORIENT_Y_INV_X,   ORIENT_X_Y,    ORIENT_INV_Y_X,      ORIENT_INV_X_INV_Y     }
        }
    };

    uint32_t cur_side_nr      = side_nr_lut     [cur_ring_nr][cur_strip_y_nr][cur_strip_x_nr];
    uint32_t cur_orient_class = orient_class_lut[cur_ring_nr][cur_strip_y_nr][cur_strip_x_nr];

    uint32_t cur_x            = (cur_orient_class == ORIENT_X_Y     || cur_orient_class == ORIENT_X_INV_Y)     ? x    :
                                (cur_orient_class == ORIENT_INV_X_Y || cur_orient_class == ORIENT_INV_X_INV_Y) ? 31-x :
                                (cur_orient_class == ORIENT_Y_X     || cur_orient_class == ORIENT_Y_INV_X)     ? y    :
                                                                                                                 31-y ;

    uint32_t cur_y            = (cur_orient_class == ORIENT_X_Y     || cur_orient_class == ORIENT_INV_X_Y)     ? y    :
                                (cur_orient_class == ORIENT_X_INV_Y || cur_orient_class == ORIENT_INV_X_INV_Y) ? 31-y :
                                (cur_orient_class == ORIENT_Y_X     || cur_orient_class == ORIENT_INV_Y_X)     ? x    :
                                                                                                                 31-x ;

    uint32_t phys_addr = cur_side_nr * side_size + (cur_y * 32) + cur_x;
    phys_addr += buffer * 6 * side_size;

    return phys_addr;
}
*/



