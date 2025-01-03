
MEM_BYTES	= 20480
MEM_WORDS       = 5120

GAMMA           = 1.3
DIM             = 0.35

OBJ_FILES       = start.o main.o led_render.o hub75_streamer.o pacman.o led_mem.o pacman_bitmaps.o

MARCH			= rv32imc
MABI			= ilp32

#TOOLS_PREFIX    = /opt/homebrew/bin
TOOLS_PREFIX    = /opt/riscv64-unknown-elf-toolchain/bin
TARGET          = $(TOOLS_PREFIX)/riscv64-unknown-elf
AS              = $(TARGET)-as
ASFLAGS         = -march=$(MARCH) -mabi=$(MABI)
LD              = $(TARGET)-gcc
LDFLAGS         = -march=$(MARCH) -mabi=$(MABI) -Wl,-Tsections.lds,-Map,progmem.map -ffreestanding -nostartfiles 
CC              = $(TARGET)-gcc
#CFLAGS          = -march=$(MARCH) -mabi=$(MABI) -Wall -Wextra -pedantic -DFREQ=$(FREQ_PLL)000000 -O2
#CFLAGS          = -march=$(MARCH) -mabi=$(MABI) -Wall -Wextra -Wpedantic -DFREQ=$(FREQ_PLL)000000 -O2
CFLAGS          = -march=$(MARCH) -mabi=$(MABI) -DFREQ=$(FREQ_PLL)000000 -O2
OBJCOPY         = $(TARGET)-objcopy
OBJDUMP         = $(TARGET)-objdump

.PHONY: all clean syntax time stat flash

#all: progmem.dis progmem.bin progmem0.coe progmem0.mif progmem0.hex progmem.mem
all: progmem.dis progmem.bin progmem4k.bin progmem.hex progmem0.hex

main.o: gamma_dim_table.h pacman.h hub75_streamer.h

pacman.o: gamma_dim_table.h pacman.h hub75_streamer.h

led_mem.o: gamma_dim_table.h led_mem.h

progmem.dis: progmem_dis.elf
	$(OBJDUMP) -s -D $< > $@

progmem.hex: progmem4k.bin
	$(OBJCOPY) --change-addresses 0x80000000 -O ihex -I binary $< $@

progmem0.hex: progmem.bin
	../misc/create_mif.rb -f hex -d $(MEM_WORDS) -w 8 -o 0 -i 4 $< > progmem0.hex
	../misc/create_mif.rb -f hex -d $(MEM_WORDS) -w 8 -o 1 -i 4 $< > progmem1.hex
	../misc/create_mif.rb -f hex -d $(MEM_WORDS) -w 8 -o 2 -i 4 $< > progmem2.hex
	../misc/create_mif.rb -f hex -d $(MEM_WORDS) -w 8 -o 3 -i 4 $< > progmem3.hex

progmem0.coe: progmem.bin
	../misc/create_mif.rb -f coe -d $(MEM_WORDS) -w 8 -o 0 -i 4 $< > progmem0.coe
	../misc/create_mif.rb -f coe -d $(MEM_WORDS) -w 8 -o 1 -i 4 $< > progmem1.coe
	../misc/create_mif.rb -f coe -d $(MEM_WORDS) -w 8 -o 2 -i 4 $< > progmem2.coe
	../misc/create_mif.rb -f coe -d $(MEM_WORDS) -w 8 -o 3 -i 4 $< > progmem3.coe

progmem0.mif: progmem.bin
	../misc/create_mif.rb -f mif -d $(MEM_WORDS) -w 8 -o 0 -i 4 $< > progmem0.mif
	../misc/create_mif.rb -f mif -d $(MEM_WORDS) -w 8 -o 1 -i 4 $< > progmem1.mif
	../misc/create_mif.rb -f mif -d $(MEM_WORDS) -w 8 -o 2 -i 4 $< > progmem2.mif
	../misc/create_mif.rb -f mif -d $(MEM_WORDS) -w 8 -o 3 -i 4 $< > progmem3.mif

progmem.mif: progmem.bin
	../misc/create_mif.rb -f mif -d $(MEM_WORDS) -w 32 $< > progmem.mif

progmem.mem: progmem.bin
	../misc/create_mif.rb -f mem -d $(MEM_WORDS) -w 32 $< > progmem.mem

progmem.bin: progmem.elf
	$(OBJCOPY) -O binary $< $@

progmem4k.bin: progmem.elf
	$(OBJCOPY) --pad-to=$(MEM_BYTES) -O binary $< $@

progmem.elf: $(OBJ_FILES) global.h hub75_streamer.h reg.h top_defines.h sections.lds Makefile ../movie/ricks_compr.h ../movie/palette.h
	$(LD) $(LDFLAGS) -s -o $@ $(OBJ_FILES) > progmem.map

progmem_dis.elf: $(OBJ_FILES) top_defines.h sections.lds Makefile
	$(LD) $(LDFLAGS) -o $@ $(OBJ_FILES) > progmem.map

gamma_dim_table.h: gen_gamma_dim_table.py Makefile
	./gen_gamma_dim_table.py $(GAMMA) $(DIM) > $@

clean:
	\rm -fr *.o *.hex *.elf *.dis *.bin *.coe *.map *.mif *.mem gamma_dim_table.h
