module Decoder15(
    input   logic[14:0] x,
    output  logic[3:0] y
);
    always_comb begin
        case (x)
            15'h0001: y = 1;
            15'h0002: y = 2;
            15'h0004: y = 3;
            15'h0008: y = 4;
            15'h0010: y = 5;
            15'h0020: y = 6;
            15'h0040: y = 7;
            15'h0080: y = 8;
            15'h0100: y = 9;
            15'h0200: y = 10;
            15'h0400: y = 11;
            15'h0800: y = 12;
            15'h1000: y = 13;
            15'h2000: y = 14;
            15'h4000: y = 15;

            default: y = 0;
        endcase
    end
endmodule

