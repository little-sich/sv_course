module Demultiplexer17(
    input   logic x,
    input   logic[4:0] sel,
    output  logic[16:0] y
);
    always_comb begin
        y = '0;
        case (sel)
            5'd01: y[0] = x;
            5'd02: y[1] = x;
            5'd03: y[2] = x;
            5'd04: y[3] = x;
            5'd05: y[4] = x;
            5'd06: y[5] = x;
            5'd07: y[6] = x;
            5'd08: y[7] = x;
            5'd09: y[8] = x;
            5'd10: y[9] = x;
            5'd11: y[10] = x;
            5'd12: y[11] = x;
            5'd13: y[12] = x;
            5'd14: y[13] = x;
            5'd15: y[14] = x;
            5'd16: y[15] = x;
            5'd17: y[16] = x;
            
            default: y = 0;
        endcase
    end
    
endmodule

