module Decoder5(
    input   logic[5:0] in,
    output  logic[3:0] out
);
    always_comb begin
        case (in)
            5'b00001: out = 1;
            5'b00010: out = 2;
            5'b00100: out = 3;
            5'b01000: out = 4;
            5'b10000: out = 5;

            default: out = 0;
        endcase
    end
endmodule