
FW  = ../rtl/hw/gen/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol0.bin
FW  += ../rtl/hw/gen/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol1.bin
FW  += ../rtl/hw/gen/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol2.bin
FW  += ../rtl/hw/gen/Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol3.bin

run: ./tb $(FW)
	cp $(FW) .
	./tb

tb: tb.v ../rtl/hw/gen/Cube2Top.v
	iverilog -o $@ $^
