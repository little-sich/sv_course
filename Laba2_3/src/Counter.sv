module Counter #(parameter INPUT_W=4, parameter DELAY=24) (
    input   logic i_clk,
    input   logic i_arstn,
    input   logic i_enable,
    output  logic o_to
);
    logic [$clog2(DELAY)-1:0] count;

    always_ff @(posedge i_clk or negedge i_arstn) begin
        if (~(i_arstn)) begin
            count <= '0;
        end else begin
            if (o_to) begin
                count <= '0;
            end else if (i_enable) begin
                count <= count + '1;
            end
        end
    end

    assign o_to = (count == DELAY);

endmodule

