module Mux2Case(
    input logic sel,
    input logic [1:0] in,
    output logic out
);
    always_comb begin
        case (sel)
            1'd0: out = in[0];
            1'd1: out = in[1];
        endcase
    end
endmodule