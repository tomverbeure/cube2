
SYNTH_SRCS=./build/Cube2Top.v ../rtl/hw/verilog/main_pll.v
#YOSYS_DEBUG = -p 'logger -debug'
HEX2BIN     = ../misc/hex2bin.py
BIN2HEX     = ../misc/bin2hex.py

RANDOM_RAM_CONTENTS_BIN = build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol0.bin \
			build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol1.bin \
			build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol2.bin \
			build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol3.bin

#SW_RAM_CONTENTS_HEX = build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol0.sw.hex \
#			build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol1.sw.hex \
#			build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol2.sw.hex \
#			build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol3.sw.hex

SW_RAM_CONTENTS_HEX = ../sw/progmem0.hex \
			../sw/progmem1.hex \
			../sw/progmem2.hex \
			../sw/progmem3.hex
PACKAGE=CABGA381

all: top.bit top.svf

# During synthesis and P&R, use random contents for CPU RAMs.
top.json: $(RANDOM_RAM_CONTENTS_BIN) $(SYNTH_SRCS)
	yosys  -l top.yosys.log $(YOSYS_DEBUG) -p 'read_verilog $(SYNTH_SRCS); synth_ecp5 -top Cube2Top -abc9 -json $@'

top.unpatched.config: top.json top.lpf
	#nextpnr-ecp5 -l top.nextpnr.log --25k --package $(PACKAGE) --speed 6 --lpf top.lpf --json top.json --textcfg $@ --freq 48
	nextpnr-ecp5 -l top.nextpnr.log --25k --package $(PACKAGE) --speed 6 --lpf top.lpf --json top.json --textcfg $@

# Take the unpatched bitstream that has random RAM contents and patch the
# RAM content with the 'real' contents from the ./sw directory
top.config: top.unpatched.config $(SW_RAM_CONTENTS_HEX)
	ecpbram --width 8 --depth 5120 -i top.unpatched.config -o top.patched0.config --from ./build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol0.hex --to ../sw/progmem0.hex -v
	ecpbram --width 8 --depth 5120 -i top.patched0.config -o top.patched1.config  --from ./build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol1.hex --to ../sw/progmem1.hex -v
	ecpbram --width 8 --depth 5120 -i top.patched1.config -o top.patched2.config  --from ./build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol2.hex --to ../sw/progmem2.hex -v
	ecpbram --width 8 --depth 5120 -i top.patched2.config -o top.config           --from ./build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol3.hex --to ../sw/progmem3.hex -v

top.svf: top.config
	ecppack --compress --input $< --svf $@

top.bit: top.config
	ecppack --compress --input $< --bit $@

pll50.v:
	ecppll -n pll50 --clkin 25 --clkout0 50 --clkin_name clk25 --clkout0_name clk50 --file pll50.v

upload: top.bit
	openfpgaloader  --vid 0x0403 --pid 0x6014 top.bit

flash: top.bit
	openfpgaloader  --vid 0x0403 --pid 0x6014 --unprotect-flash --write-flash top.bit

# Create CPU RAM init files with random content
build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol%.bin:
	mkdir -p ./build
	ecpbram --width 8 --depth 5120 --generate $(addsuffix .hex, $(basename $@))
	$(HEX2BIN) < $(addsuffix .hex, $(basename $@))> $@

# Convert the binary CPU RAM init files with the SW to hex
build/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol%.sw.hex: ../rtl/hw/gen/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol%.bin
	mkdir -p ./build
	#$(BIN2HEX) < $(addsuffix .bin, $(basename me $<))) > $@
	$(BIN2HEX) < $< > $@

./build/Cube2Top.v:../rtl/hw/gen/Cube2Top.v
	mkdir -p build
	ln -f -s ../$< $@

clean:
	rm -fr *.json *.config *.svf *.bit *.vcd pll50.v build *.log
