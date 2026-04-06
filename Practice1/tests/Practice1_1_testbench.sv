module Practice1_1_testbench();

    logic x1, x2, x3, x4, z;

    Practice1_1 dut(x1, x2, x3, x4, z);

    initial begin
        x1 = 0; x2 = 0; x3 = 0; x4 = 0;    #20;
        x4 = 1;                             #20;
        x2 = 1; x3 = 1; x4 = 0;           #20;
        x4 = 1;                  #20;
        x1 = 1; x2 = 0; x3 = 0; x4 = 0;    #20;
        x4 = 1;                  #20;
        x1 = 0; x2 = 1; x3 = 1;  x4 = 0;           #20;
        x4 = 1;                  #20;
    end

endmodule