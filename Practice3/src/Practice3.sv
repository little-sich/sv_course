module Practice3 #(parameter WIO = 4) (
    input               i_clk,

    input               i_valid,
    input [WIO-1:0]     i_a,
    input [WIO-1:0]     i_b,

    output              o_valid,
    output [WIO-1:0]    o_sum,
    output              o_overflow
);
    localparam RANGE_N = 'b1 << (WIO-1);
    localparam RANGE_P = RANGE_N - 1;

    logic [WIO-1:0] sum_temp;

    always_ff @(posedge i_clk) begin
        sum_temp <= i_a + i_b;
        o_valid <= i_valid;
    end

    assign o_overflow = (~i_a[WIO-1] & ~i_b[WIO-1] &  sum_temp[WIO-1]) |
                        ( i_a[WIO-1] &  i_b[WIO-1] & ~sum_temp[WIO-1]);

    assign o_sum = o_overflow ? (i_a[WIO-1] ? RANGE_N : RANGE_P) : sum_temp;

endmodule

