module Practice1_1(
    input logic x1, x2, x3, x4,
    output logic z
);

  assign z = ~x1 & ~x2 | ~x1 & ~x3 | x1 & x3 & x4 | x1 & x2 & x3;

endmodule