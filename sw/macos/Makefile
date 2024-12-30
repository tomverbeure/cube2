
MEM_BYTES		= 20480
MEM_WORDS       = 5120

GAMMA           = 1.3
DIM             = 0.35

OBJ_FILES       = main.o led_render.o hub75_streamer.o pacman.o led_mem.o pacman_bitmaps.o

#TOOLS_PREFIX    = /opt/homebrew/bin
#TOOLS_PREFIX    = /opt/riscv64-unknown-elf-toolchain/bin
#TARGET          = $(TOOLS_PREFIX)/riscv64-unknown-elf
#AS              = $(TARGET)-as
#ASFLAGS         = -march=rv32imc -mabi=ilp32
#LD              = $(TARGET)-gcc
#LDFLAGS         = -march=rv32imc -mabi=ilp32 -Wl,-Tsections.lds,-Map,progmem.map -ffreestanding -nostartfiles
CC              = gcc
#CFLAGS          = -march=rv32imc -mabi=ilp32 -Wall -Wextra -pedantic -DFREQ=$(FREQ_PLL)000000 -O2
#CFLAGS          = -march=rv32imc -mabi=ilp32 -Wall -Wextra -Wpedantic -DFREQ=$(FREQ_PLL)000000 -O2
#CFLAGS          = -march=rv32imc -mabi=ilp32 -DFREQ=$(FREQ_PLL)000000 -O2
#OBJCOPY         = $(TARGET)-objcopy
#OBJDUMP         = $(TARGET)-objdump

.PHONY: all clean syntax time stat flash

all: pacman

pacman: $(OBJ_FILES) ../global.h ../hub75_streamer.h ../reg.h ../top_defines.h Makefile ../../movie/ricks_compr.h ../../movie/palette.h
	$(CC) -o $@ $(OBJ_FILES)

main.o: ../main.c gamma_dim_table.h ../pacman.h ../hub75_streamer.h
	$(CC) -o $@ $<

pacman.o: ../pacman.c gamma_dim_table.h ../pacman.h ../hub75_streamer.h
led_mem.o: ../led_mem.c gamma_dim_table.h ../led_mem.h
led_render.o: ../led_render.c
hub75_streamer.o: ../hub75_streamer.c
pacman_bitmaps.o: ../pacman_bitmaps.c

progmem.dis: progmem_dis.elf
	$(OBJDUMP) -s -D $< > $@

progmem.hex: progmem4k.bin
	$(OBJCOPY) --change-addresses 0x80000000 -O ihex -I binary $< $@

progmem_dis.elf: $(OBJ_FILES) top_defines.h sections.lds Makefile
	$(LD) $(LDFLAGS) -o $@ $(OBJ_FILES) > progmem.map

gamma_dim_table.h: ../gen_gamma_dim_table.py Makefile
	../gen_gamma_dim_table.py $(GAMMA) $(DIM) > $@

clean:
	\rm -fr *.o *.hex *.elf *.dis *.bin *.coe *.map *.mif *.mem gamma_dim_table.h
