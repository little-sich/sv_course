module Lecture6(
    input   logic i_a, i_b, i_c, i_d,
    input   logic i_clk,
    input   logic i_arstn,
    input   logic i_enable,
    output  logic o_y
);
    logic nor_ff;
    logic c_ff;
    logic d_ff1, d_ff2;
    logic nand_ff;

    // always_ff @(posedge i_clk) nor_ff <= ~(i_a | i_b);

    // always_ff @(posedge i_clk) c_ff <= i_c;
    // always_ff @(posedge i_clk) d_ff1 <= i_d;

    // always_ff @(posedge i_clk) nand_ff <= ~(nor_ff & c_ff);
    // always_ff @(posedge i_clk) d_ff2 <= d_ff1;

    always_ff @(posedge i_clk or negedge i_arstn) begin
        if (~(i_arstn)) begin
            nor_ff <= 0;
            c_ff <= 0;
            d_ff1 <= 0;
            nand_ff <= 0;
            d_ff2 <= 0;
        end else if (i_enable) begin
            nor_ff <= ~(i_a | i_b);
            c_ff <= i_c;
            d_ff1 <= i_d;
            nand_ff <= ~(nor_ff & c_ff);
            d_ff2 <= d_ff1;
        end
    end

    parameter WIDTH = 8;
    logic d;
    assign d = ~(d_ff2 & nand_ff);
    logic [WIDTH-1 : 0] q;
    always_ff @(posedge i_clk or negedge i_arstn) begin
        if ((~i_arstn))
            q <= '0;
        else
            // Shift left: the MSB is dropped
            q <= {q[WIDTH-2 : 0], d};
    end

    assign o_y = q[WIDTH-1];
    // assign o_y = ~(d_ff2 & nand_ff);
endmodule

