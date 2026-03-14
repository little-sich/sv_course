module CompleteCircuit(
    input   logic[14:0] x,
    input   logic[4:0] sel,
    output  logic[16:0] y
);
    logic[3:0] A;
    logic B;

    Decoder15 Decoder15_inst(x, A);

    LogicFunc LogicFunc_inst(A[0], A[1], A[2], A[3], B);

    Demultiplexer17 Demultiplexer17_inst(B, sel, y);

endmodule
