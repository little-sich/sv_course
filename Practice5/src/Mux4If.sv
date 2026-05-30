module Mux4If(
    input logic [1:0] sel,
    input logic [3:0] in,
    output logic out
);
    always_comb begin
        if (sel == 0)
            output = in[0];
        else if (sel == 1)
            output = in[1];
        else if (sel == 2)
            output = in[2];
        else if (sel == 3)
            output = in[3];
    end
endmodule