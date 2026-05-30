module Demux5 #(
    parameter WIDTH = 5;
) (
    input logic [3:0] sel,
    input logic in,
    input logic [WIDTH-1:0] out;
);
    always_comb begin
        case (sel)
            3'd0: out[0] = in;
            3'd1: out[1] = in;
            3'd2: out[2] = in;
            3'd3: out[3] = in;
            3'd4: out[4] = in;
        endcase
    end
endmodule