module CompleteCircuit_testbench();
    logic[14:0] x;
    logic[4:0]  sel;
    logic[16:0] y;

    CompleteCircuit dut(x, sel, y);

    initial begin
        for (sel = 1; sel <= 17; sel++) begin
            x = 15'h0001; #10;
            x = 15'h0002; #10;
            x = 15'h0004; #10;
            x = 15'h0008; #10;
            x = 15'h0010; #10;
            x = 15'h0020; #10;
            x = 15'h0040; #10;
            x = 15'h0080; #10;
            x = 15'h0100; #10;
            x = 15'h0200; #10;
            x = 15'h0400; #10;
            x = 15'h0800; #10;
            x = 15'h1000; #10;
            x = 15'h2000; #10;
            x = 15'h4000; #10;
        end
    end

endmodule

