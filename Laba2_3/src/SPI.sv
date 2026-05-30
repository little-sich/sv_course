module SPI #(parameter INPUT_W=4, parameter OUTPUT_W=96) (
    input   logic[INPUT_W-1:0] i_mosi,
    input   logic i_sck,
    input   logic i_ss,
    input   logic i_clk,
    input   logic i_arstn,
    output  logic[OUTPUT_W-1:0] o_data,
    output  logic o_valid,
    output  logic[INPUT_W-1:0] o_miso
);

    logic en_from_fed;

    FallingEdgeDetector fed(
        .i_from(i_sck),
        .i_clk(i_clk),
        .o_to(en_from_fed)
    );

    logic[OUTPUT_W-1:0] o_from_sr;
    ShiftRegister sr(
        .i_from(i_mosi),
        .i_clk(i_clk),
        .i_arstn(i_arstn),
        .i_enable(en_from_fed),
        .o_to(o_from_sr)
    );

    logic o_from_cntr;
    Counter cntr(
        .i_clk(i_clk),
        .i_arstn(i_arstn),
        .i_enable(en_from_fed),
        .o_to(o_from_cntr)
    );

    always_ff @(posedge i_clk or negedge i_arstn) begin
        if (~(i_arstn)) begin
            o_data <= '0;
        end else if (o_from_cntr) begin
            o_data <= o_from_sr;
        end
    end

    always_ff @(posedge i_clk) o_valid <= o_from_cntr;

    logic[INPUT_W-1:0] o_from_mosi_mux;
    assign o_from_mosi_mux = ~i_ss ? i_mosi : 'z;

    assign o_miso = o_from_mosi_mux;

endmodule
