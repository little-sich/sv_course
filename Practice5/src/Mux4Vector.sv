module Mux4Vector(
    input logic [1:0] sel,
    input logic in [3:0],
    output logic out
);
    assign out = in[sel];
endmodule