#include <stdint-gcc.h>

#include "reg.h"
#include "top_defines.h"
#include "hub75_streamer.h"
#include "led_mem.h"
#include "pacman.h"

#include "../movie/palette.h"
#include "../movie/ricks_compr.h"

static inline uint32_t rdcycle(void) {
    uint32_t cycle;
    asm volatile ("rdcycle %0" : "=r"(cycle));
    return cycle;
}

static inline int nop(void) {
    asm volatile ("addi x0, x0, 0");
    return 0;
}

void wait(int cycles)
{
#if 1
    volatile int cnt = 0;

    for(int i=0;i<cycles/20;++i){
        ++cnt;
    }
#else
    int start;

    start = rdcycle();
    while ((rdcycle() - start) <= cycles);
#endif
}

#include "mario.h"

#define WAIT_CYCLES 4000000

void led_mem_stripes(int buffer_nr)
{
    for(int side = 0; side < 5; ++side){
	    for(int row=0;row<32;++row){
	        for(int col=0;col<32;++col){
	            led_mem_wr(buffer_nr, side, col, row, 
	                            (col % 3) == 0 ? 255 : 0, 
	                            (col % 3) == 1 ? 255 : 0, 
	                            (col % 3) == 2 ? 255 : 0);
	        }
	    }
    }
}

void led_mem_stripes_rick()
{

    for(int frame_nr = 0; frame_nr < 16; ++frame_nr){

        unsigned char *ptr = ricks_compr_bin + frame_nr * 32 * 23;

        for(int row=0; row<23; ++row){
            for(int col=0;col<32;col+=2){
                if (col == frame_nr*2){
                    ptr[row * 32 + col] = 10;
                }
                else{
                    ptr[row * 32 + col] = 0;
                }
            }
        }
    }
}

void led_mem_rows(int buffer_nr)
{
    for(int side=0; side<5; side++){
	    for(int row=0;row<32;++row){
	        for(int col=0;col<32;++col){
	            if (col<10){
	                led_mem_wr(buffer_nr, side, col, row, row*7, 0, 0);
	            } 
	            else if (col<20){
	                led_mem_wr(buffer_nr, side, col, row, 0, row*7, 0);
	            }
	            else if (col<30){
	                led_mem_wr(buffer_nr, side, col, row, 0, 0, row*7);
	            }
	            else{
	                led_mem_wr(buffer_nr, side, col, row, 0, row*7, row*7);
	            }
	        }
	    }
    }
}

void led_mem_rick(int buffer_nr, int frame_nr)
{

    for(int side = 0; side < 5; ++side){

        int frame_nr_adj = (frame_nr + side) % 16;
        unsigned char *ptr = ricks_compr_bin + frame_nr_adj * (32/2) * 23;

	    for(int row=0; row<32; ++row){
	        for(int col=0;col<32;col+=2){
	            if (row < 4 || row >= 27){
	                //led_mem_wr(buffer_nr, side, col, row, side == 0 || side == 3 ? 32 : 0, side == 1 || side == 4 ? 32 : 0 , side == 2 || side == 5 ? 32 : 0);
	            }
	            else{
	                unsigned char val = *ptr;

                        int shift_adj   = 0;

	                led_mem_wr_gamma_dim(buffer_nr, side, 2*col, 2*row, 
	                                palette_bin[(val & 15) * 3    ] >> shift_adj,
	                                palette_bin[(val & 15) * 3 + 1] >> shift_adj,
	                                palette_bin[(val & 15) * 3 + 2] >> shift_adj);
	                led_mem_wr_gamma_dim(buffer_nr, side, 2*col+1, 2*row, 
	                                palette_bin[(val & 15) * 3    ] >> shift_adj,
	                                palette_bin[(val & 15) * 3 + 1] >> shift_adj,
	                                palette_bin[(val & 15) * 3 + 2] >> shift_adj);
	                led_mem_wr_gamma_dim(buffer_nr, side, 2*col, 2*row +1, 
	                                palette_bin[(val & 15) * 3    ] >> shift_adj,
	                                palette_bin[(val & 15) * 3 + 1] >> shift_adj,
	                                palette_bin[(val & 15) * 3 + 2] >> shift_adj);
	                led_mem_wr_gamma_dim(buffer_nr, side, 2*col+1, 2*row +1, 
	                                palette_bin[(val & 15) * 3    ] >> shift_adj,
	                                palette_bin[(val & 15) * 3 + 1] >> shift_adj,
	                                palette_bin[(val & 15) * 3 + 2] >> shift_adj);

	                led_mem_wr_gamma_dim(buffer_nr, side, (col+1)*2, row*2, 
	                                palette_bin[(val>>4) * 3    ] >> shift_adj,
	                                palette_bin[(val>>4) * 3 + 1] >> shift_adj,
	                                palette_bin[(val>>4) * 3 + 2] >> shift_adj);
	                led_mem_wr_gamma_dim(buffer_nr, side, (col+1)*2+1, row*2, 
	                                palette_bin[(val>>4) * 3    ] >> shift_adj,
	                                palette_bin[(val>>4) * 3 + 1] >> shift_adj,
	                                palette_bin[(val>>4) * 3 + 2] >> shift_adj);
	                led_mem_wr_gamma_dim(buffer_nr, side, (col+1)*2, row*2+1, 
	                                palette_bin[(val>>4) * 3    ] >> shift_adj,
	                                palette_bin[(val>>4) * 3 + 1] >> shift_adj,
	                                palette_bin[(val>>4) * 3 + 2] >> shift_adj);
	                led_mem_wr_gamma_dim(buffer_nr, side, (col+1)*2+1, row*2+1, 
	                                palette_bin[(val>>4) * 3    ] >> shift_adj,
	                                palette_bin[(val>>4) * 3 + 1] >> shift_adj,
	                                palette_bin[(val>>4) * 3 + 2] >> shift_adj);
	                ++ptr;
	            }
	
	        }
	    }
    }
}

void render_bitmap_1bpp(uint16_t *bitmap, uint32_t color, int size_x, int size_y, int buffer_nr, e_hub75_ring ring, int pos_x, int pos_y)
{
    for(int y=0; y<size_y;++y){
        for(int x=0; x<size_x;++x){
                //uint32_t bit = (bitmap[y] >> (size_x-1-x)) & 1;
                uint32_t bit = (bitmap[y] >> (x)) & 1;
                if (!bit)
                    continue;

#if 0
//                uint32_t log_addr = ring * HUB75S_RING_SIZE 
//                                    + ((pos_y+y) + HUB75S_SIDE_HEIGHT) * HUB75S_STRIP_WIDTH 
//                                    + (pos_x+x);

                uint32_t log_addr = 0
                                    + ((pos_y+y) + HUB75S_SIDE_HEIGHT) * HUB75S_SIDE_WIDTH 
                                    + (pos_x+x);
                    
                uint32_t phys_addr = hub75s_calc_phys_addr(buffer_nr, log_addr);

                MEM_WR(LED_MEM, phys_addr, color);
#endif
                int phys_addr = hub75s_ring_coord2addr(buffer_nr, 0, pos_x+x, pos_y+y);
                MEM_WR(LED_MEM, phys_addr, color);
        }
    }
}

void render_bitmap_2bpp(uint32_t *bitmap, uint32_t *colors, int size_x, int size_y, int buffer_nr, e_hub75_ring ring, int pos_x, int pos_y)
{
    for(int y=0; y<size_y;++y){
        for(int x=0; x<size_x;++x){
                //uint32_t bit = (bitmap[y] >> (size_x-1-x)) & 1;
                uint32_t bits = (bitmap[y] >> (2*size_x-2 - 2*x)) & 3;
                if (bits == 0)
                    continue;

#if 0
//                uint32_t log_addr = ring * HUB75S_RING_SIZE 
//                                    + ((pos_y+y) + HUB75S_SIDE_HEIGHT) * HUB75S_STRIP_WIDTH 
//                                    + (pos_x+x);

                uint32_t log_addr = 0
                                    + ((pos_y+y) + HUB75S_SIDE_HEIGHT) * HUB75S_SIDE_WIDTH 
                                    + (pos_x+x);
                    
                uint32_t phys_addr = hub75s_calc_phys_addr(buffer_nr, log_addr);
#endif

                uint32_t color = colors[bits];

                int phys_addr = hub75s_ring_coord2addr(buffer_nr, 0, pos_x+x, pos_y+y);
                MEM_WR(LED_MEM, phys_addr, color);
        }
    }
}

void play_basic(int total_nr_frames)
{
    led_mem_fill(0, 0, 0, 0);
    led_mem_fill(1, 0, 0, 0);

    uint32_t scratch_buf = 0;

    //hub75s_config();

    int intensity = 32;


#if 0
    //for(int p=0; p<5; ++p){
    int p=1;
    {
        for(int x=0;x<64;++x){
            led_mem_wr(scratch_buf, p, x, 0, 64,0,0);

            hub75s_start();
            
            // Wait for a certain number of frames..
            uint32_t prev_frame_cntr = REG_RD(HUB75S_FRAME_CNTR);
            while(REG_RD(HUB75S_FRAME_CNTR) < prev_frame_cntr + 6) 
                ;

            // Swap buffer
            REG_WR_FIELD(HUB75S_CONFIG, BUFFER_NR, scratch_buf);
            while(REG_RD_FIELD(HUB75S_STATUS, CUR_BUFFER_NR) != scratch_buf) 
                ;
        }
    }
    return;
#endif


    for(int x=0;x<64;++x){
        for(int p=0; p<5; ++p){
            uint32_t color = 0;
            switch(p){
                case 0: color   = (0  << 16) | (0  << 8) | intensity; break;            // RED
                case 1: color   = (0  << 16) | (intensity << 8) |  0; break;            // GREEN
                case 2: color   = (intensity << 16) | (0  << 8) |  0; break;            // BLUE
    
                case 3: color   = (0  << 16) | (intensity << 8) | intensity; break;     // YELLOW
                case 4: color   = (intensity << 16) | (intensity << 8) |  0; break;     // CYAN
                case 5: color   = (intensity << 16) | (0  << 8) | intensity; break;
            }
    
            //for(int y=0;y<HUB75S_SIDE_HEIGHT/2;++y){
            {
                //for(int x=0;x<HUB75S_SIDE_WIDTH/2;++x){
                {
                    //uint32_t phys_addr = p * HUB75S_SIDE_HEIGHT * HUB75S_SIDE_WIDTH + y * HUB75S_SIDE_WIDTH + x;
                    //MEM_WR(LED_MEM, phys_addr, color);
                    led_mem_wr(scratch_buf, p, x, x, color&255, (color>>8)&255, (color>>16)&255);
                }
            }

            hub75s_start();
            
            // Wait for a certain number of frames..
            uint32_t prev_frame_cntr = REG_RD(HUB75S_FRAME_CNTR);
            while(REG_RD(HUB75S_FRAME_CNTR) < prev_frame_cntr + 2) 
                ;

            // Swap buffer
            REG_WR_FIELD(HUB75S_CONFIG, BUFFER_NR, scratch_buf);
            while(REG_RD_FIELD(HUB75S_STATUS, CUR_BUFFER_NR) != scratch_buf) 
                ;
        }
    }
}

void play_rick(int total_nr_frames)
{
    int movie_cntr = 0;
    int movie_frame = 0;
    uint32_t scratch_buf = 1;

    uint32_t start_frame = REG_RD(HUB75S_FRAME_CNTR);

    while(REG_RD(HUB75S_FRAME_CNTR) < start_frame + total_nr_frames){
        led_mem_clear(scratch_buf);
        led_mem_rick(scratch_buf, movie_frame);

        movie_cntr  = (movie_cntr + 1) % 16;
        //movie_frame = movie_cntr<16 ? movie_cntr : 31-movie_cntr;
        movie_frame = movie_cntr;

        uint32_t prev_frame_cntr = REG_RD(HUB75S_FRAME_CNTR);
        while(REG_RD(HUB75S_FRAME_CNTR) < prev_frame_cntr + 25) 
            ;

        REG_WR_FIELD(HUB75S_CONFIG, BUFFER_NR, scratch_buf);
        while(REG_RD_FIELD(HUB75S_STATUS, CUR_BUFFER_NR) != scratch_buf) 
            ;

        scratch_buf ^= 1;
    }

}

void play_mario(int total_nr_frames)
{
    uint32_t scratch_buf = 1;

    int pos_x = 0;
    int pos_y = 10;

    uint32_t start_frame = REG_RD(HUB75S_FRAME_CNTR);

    while(REG_RD(HUB75S_FRAME_CNTR) < start_frame + total_nr_frames){

        led_mem_fill(scratch_buf, (mario_sky_color & 255) * 3/4, ((mario_sky_color >> 8) & 255) * 3/4, (mario_sky_color >> 16) *3/4); 

        int stride = (REG_RD(HUB75S_FRAME_CNTR) % 21)/7;

        uint32_t *current_mario = stride == 0 ? mario_walk_0 :
                                  stride == 1 ? mario_walk_1 :
                                                mario_walk_2 ;


        /*
        if ((pos_x & 31) < 15){
            int q = ((pos_x & 15) - 8)*2/3;
            pos_y = 14-q*q;
        }
        else{
            pos_y = 14;
        }
        */

        pos_y = 14;

        for(int i=0;i<256;i+=16){
            render_bitmap_2bpp(mario_ground, mario_ground_colors, 16, 3, scratch_buf, RING_LFRBa, i % (4*HUB75S_SIDE_WIDTH), 29);
        }

        render_bitmap_2bpp(current_mario,   mario_colors,    16, 16, scratch_buf, RING_LFRBa, (pos_x) % (4*HUB75S_SIDE_WIDTH), pos_y);

        pos_x = (pos_x + 1) % (4 * HUB75S_SIDE_WIDTH);

        uint32_t prev_frame_cntr = REG_RD(HUB75S_FRAME_CNTR);
        while(REG_RD(HUB75S_FRAME_CNTR) < prev_frame_cntr + 6) ;

        REG_WR_FIELD(HUB75S_CONFIG, BUFFER_NR, scratch_buf);
        while(REG_RD_FIELD(HUB75S_STATUS, CUR_BUFFER_NR) != scratch_buf) 
            ;

        scratch_buf ^= 1;
    }
}


int main() 
{

    hub75s_config();

    REG_WR(LED_DIR, 0xff);

    /*
    for(volatile int i=0;i<10;++i){
        //for(volatile int j=0;j<1000000;++j);
        for(volatile int j=0;j<10;++j);
        REG_WR(LED_WRITE, 0xffffffff);
        //for(volatile int j=0;j<1000000;++j);
        for(volatile int j=0;j<10;++j);
        REG_WR(LED_WRITE, 0x0);
    }
    */ 

    hub75s_dim(0x40, 0x40, 0x40);

    REG_WR(LED_WRITE, 0xff);
    REG_WR(LED_WRITE, 0x0);
    REG_WR(LED_WRITE, 0xff);
    REG_WR(LED_WRITE, 0x0);

//    while(1)
//        play_basic(120 * 3);

    hub75s_start();
    while(1){
        //play_rick(120 * 3);
        play_pacman(1);
        //play_mario(120 * 6);
    }
}
