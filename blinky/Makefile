all: top.bit top.svf

SYNTH_SRCS=top.v pll50.v

PACKAGE=CABGA381


top.json: $(SYNTH_SRCS)
	yosys -p 'read_verilog $(SYNTH_SRCS); synth_ecp5 -top top -abc9 -json $@'

top.config: top.json top.lpf
	nextpnr-ecp5 --25k --package $(PACKAGE) --speed 6 --lpf top.lpf --json top.json --textcfg top.config --freq 65

top.svf: top.config
	ecppack --compress --input $< --svf $@

top.bit: top.config
	ecppack --compress --input $< --bit $@

pll50.v:
	ecppll -n pll50 --clkin 25 --clkout0 50 --clkin_name clk25 --clkout0_name clk50 --file pll50.v

upload: top.bit
	openfpgaloader  --vid 0x0403 --pid 0x6014 top.bit

clean:
	rm -f *.json *.config *.svf *.bit *.vcd pll50.v
