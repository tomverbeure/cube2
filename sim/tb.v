`default_nettype none
`timescale 1ns/1ps

module tb;

    reg clk25 = 0;

    Cube2Top u_cube2top (
    	.osc_clk25(clk25)
    );


    integer i;
    initial begin
        for(i=0;i<10000;i=i+1) begin
            clk25   <= 1'b0;
            #5;
            clk25   <= 1'b1;
            #5;
        end
        $finish;
    end

    initial begin
    	$dumpfile("tb.vcd");
    	$dumpvars(0,u_cube2top);
    end

endmodule

