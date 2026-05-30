module RegisterAsyncN #(
    parameter WIDTH = 5;
) (
    input logic [WIDTH-1:0] d,
    input logic clk,
    input logic arstn,
);
    
    always_ff @(posedge clk or negedge arstn) begin
        if (~arstn) begin
            q <= 0;
        end else begin
            q <= d;
        end
    end

endmodule