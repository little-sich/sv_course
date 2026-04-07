module FallingEdgeDetector(
    input   logic i_from,
    input   logic i_clk,
    output  logic o_to
);
    logic dff;

    always_ff @(posedge i_clk) dff <= i_from;

    assign o_to = ~i_from & dff;

endmodule

