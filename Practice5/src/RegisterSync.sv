module RegisterSync #(
    parameter WIDTH = 5
) (
    input logic [WIDTH-1:0] d,
    input logic clk,
    input logic rst,
    output logic [WIDTH-1:0] q
);
    
    always_ff @(posedge clk) begin
        if (rst) begin
            q <= '0;
        end else begin
            q <= d;
        end
    end

endmodule