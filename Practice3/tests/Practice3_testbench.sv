module Practice3_testbench();
    logic       clk;
    logic       input_valid = 0;
    logic [3:0] a;
    logic [3:0] b;
    logic       output_valid;
    logic [3:0] result;
    logic overflow;

    parameter WIO_TB = 4;

    initial begin
        clk = '0;
        forever begin
            #5ns clk = ~clk; // 100 MHz
        end
    end

    Practice3 dut #(
        .WIO(WIO_TB)
    ) (
        .i_clk(clk),
        .i_valid(input_valid),
        .i_a(a),
        .i_b(b),

        .o_valid(output_valid),
        .o_sum(result),
        .o_overflow(overflow)
    );

    parameter MAX_RANGE = ('b1 << WIO_TB) - 1;
    parameter NUM_ITER = 100;

    int ethalon_data = '{NUM_ITER{0}};

    initial begin // send data
        #1000ns;
        for (int i = 0; i < NUM_ITER; i++) begin
            a = $urandom & MAX_RANGE;
            b = $urandom & MAX_RANGE;
            ethalon_data[i] = a + b;
            input_valid = 1;
            $display("++ INPUT i => %d {%d, %d}", i, a, b);
            @(posedge clk);
        end
        input_valid = 0;
    end

    int error_counter = 0;

    initial begin // recieve and check data
        @(posedge output_valid);
        for (int i = 0; i < NUM_ITER; i++) begin
            if (result !== ethalon_data[i]) begin
                error_counter++;
                $display ("result %d", result);
                $display ("ethalon_data %d", ethalon_data[i]);
            end
        end

        if (error_counter > 0) begin
            $display ("FAIL %s - see log above", `__FILE__);
            $stop;
        end

        repeat (100) @ (posedge clk);
        $display ("PASS %s", `__FILE__);
        $stop;
    end

endmodule

