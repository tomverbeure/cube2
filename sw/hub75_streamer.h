#ifndef HUB75_STREAMER_H
#define HUB75_STREAMER_H

#include <stdint-gcc.h>

typedef struct {
    int topLeftCoordX;
    int topLeftCoordY;
    int topLeftCoordZ;

    int side;
    int sideRotation;

    int xIncr;
    int yIncr;
    int zIncr;

    int memAddrStartPh0;
    //int memAddrStartPh1;
    int memAddrColMul;
    int memAddrRowMul;
} t_panel_info;

extern t_panel_info panels[];

typedef enum {
    RING_LFRBa      = 0,
    RING_FBoBaT     = 1,
    RING_LBoRT      = 2,
} e_hub75_ring;

#define HUB75S_SIDE_HEIGHT   64
#define HUB75S_SIDE_WIDTH    64
#define HUB75S_SIDE_SIZE     (HUB75S_SIDE_HEIGHT * HUB75S_SIDE_WIDTH)

//#define HUB75S_STRIP_HEIGHT  HUB75S_SIDE_HEIGHT
//#define HUB75S_STRIP_WIDTH   (HUB75S_SIDE_WIDTH * 8)
//#define HUB75S_STRIP_SIZE    (HUB75S_STRIP_WIDTH * HUB75S_STRIP_HEIGHT)

//#define HUB75S_RING_WIDTH    (HUB75S_STRIP_WIDTH)
//#define HUB75S_RING_HEIGHT   (HUB75S_STRIP_HEIGHT * 4)
//#define HUB75S_RING_SIZE     (HUB75S_RING_WIDTH * HUB75S_RING_HEIGHT)

void hub75s_config(void);
void hub75s_start(void);
int hub75s_get_scratch_buffer(void);
void hub75s_dim(unsigned char r_dim, unsigned char g_dim, unsigned char b_dim);
uint32_t hub75s_calc_phys_addr(int buffer, int log_addr);

inline int hub75s_coord2addr(int buffer_nr, int side, int x, int y)
{
    int addr;

    addr    = buffer_nr * HUB75S_SIDE_SIZE;
    addr    += panels[side].memAddrStartPh0;
    addr    += y * panels[side].memAddrRowMul;
    addr    += x * panels[side].memAddrColMul;

    return addr;
}

uint32_t hub75s_ring_coord2addr(int buffer, int ring_nr, int x, int y);

#endif
