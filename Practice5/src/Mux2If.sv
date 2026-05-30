module Mux2If(
    input logic sel,
    input logic [1:0] in,
    output logic out
);
    always_comb begin
        if (sel)
            out = in[1];
        else
            out = in[0];
    end
endmodule