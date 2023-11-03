`default_nettype none

module top (
    input       osc_clk25,
    output      phy_reset_n,
    input       button,
    output      led
);
    wire clk;

    pll50 u_pll(
        .clk25(     osc_clk25),
        .clk50(     clk),
        .locked()
    );


    // External oscillator runs at 25MHz

    assign phy_reset_n  = 1'b1;

    reg [24:0]  cntr = 0;

    always @(posedge clk) begin
        cntr <= cntr + 1;
    end

    assign led  = cntr[23] ^ button;


endmodule
