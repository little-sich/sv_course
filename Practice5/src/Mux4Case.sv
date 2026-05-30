module Mux4Case(
    input logic [1:0] sel,
    input logic [3:0] in,
    output logic out
);
    always_comb begin
        case (sel)
            2'd0: output = in[0];
            2'd1: output = in[1];
            2'd2: output = in[2];
            2'd3: output = in[3];
        endcase
    end
endmodule