module Mux2Vector(
    input logic sel,
    input logic in[1:0],
    output logic out
);
    assign out = in[sel];
endmodule