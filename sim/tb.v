`default_nettype none
`timescale 1ns/1ps

module tb;

    reg clk25 = 0;

    Cube2Top u_cube2top (
    	.osc_clk25(clk25)
    );


    integer i;
    initial begin
        for(i=0;i<200000;i=i+1) begin
            clk25   <= 1'b0;
            #5;
            clk25   <= 1'b1;
            #5;
        end
        $finish;
    end

    initial begin
    	$dumpfile("tb.fst");
    	$dumpvars(1,u_cube2top);
    	$dumpvars(0,u_cube2top.core_u_led_mem);
    	$dumpvars(0,u_cube2top.core_u_hub75phy);
    	$dumpvars(0,u_cube2top.core_u_hub75_streamer);
    end

endmodule

