module Coder5(
    input   logic[3:0] in,
    output  logic[5:0] out
);
    always_comb begin
        case (in)
            3'd1: out = 5'b00001;
            3'd2: out = 5'b00010;
            3'd3: out = 5'b00100;
            3'd4: out = 5'b01000;
            3'd5: out = 5'b10000;

            default: out = 0;
        endcase
    end
endmodule