module Practice2(
    input   logic i_clk,
    input   logic i_arst,

    input   logic[14:0] i_x,
    input   logic[4:0] sel,
    output  logic[16:0] o_y
);
    logic[14:0] x_ff;
    logic[16:0] y_ff;

    logic[3:0] A;
    logic[3:0] a_ff;

    logic B;
    logic b_ff;

    logic[16:0] C;
    logic[16:0] c_ff;

    always_ff @(posedge i_clk) begin
        x_ff <= i_x;
    end

    Decoder15 Decoder15_inst(x_ff, A);

    always_ff @(posedge i_clk) begin
        a_ff <= A;
    end

    LogicFunc LogicFunc_inst(a_ff[0], a_ff[1], a_ff[2], a_ff[3], B);

    always_ff @(posedge i_clk) begin
        b_ff <= B;
    end

    Demultiplexer17 Demultiplexer17_inst(b_ff, sel, C);

    always_ff @(posedge i_clk) begin
        c_ff <= C;
    end

    assign o_y = c_ff;

endmodule
