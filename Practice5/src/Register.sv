module Register #(
    parameter WIDTH = 5
) (
    input logic [WIDTH-1:0] d,
    input logic clk,
    output logic [WIDTH-1:0] q
);
    
    always_ff @(posedge clk) begin
        q <= d;
    end

endmodule