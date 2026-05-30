module SPI_testbench1 #(parameter INPUT_W=4, parameter OUTPUT_W=96) ();
    logic[INPUT_W-1:0] mosi;
    logic sck = 1;
    logic ss = 1;
    logic clk;
    logic arstn;
    logic[OUTPUT_W-1:0] data;
    logic valid;
    logic[INPUT_W-1:0] miso;

    parameter real CLK_PERIOD = 4761ps;
    parameter real SCK_PERIOD = CLK_PERIOD*13;

    // instantiate device under test
    SPI spi(
        .i_mosi(mosi),
        .i_sck(sck),
        .i_ss(ss),
        .i_clk(clk),
        .i_arstn(arstn),
        .o_data(data),
        .o_valid(valid),
        .o_miso(miso)
    );

    // generate clock
    initial begin
        clk = '0;
        forever
            #(CLK_PERIOD/2) clk = ~clk;
    end

    // generate synchroclock signal
    initial begin
        sck = '1;
        forever begin
            if (!ss) begin
                #(SCK_PERIOD/2) sck = ~sck;
            end else begin
                sck = '1;
                wait(!ss);
            end
        end
    end

    initial begin
        #10ps  arstn = '0;
        #500ps arstn = '1;
    end

    logic [OUTPUT_W-1:0] test_data;
    int seed = 32'($time);
    int a = $urandom(seed);
    int b = $urandom(seed);
    int c = $urandom(seed);
    assign test_data = {a, b, c};

    localparam NUM_ITER = 24;
    initial begin // send data
        @(negedge arstn);
        repeat (10) @(posedge clk);
        for (int i = NUM_ITER; i >= 1; i--) begin
            ss = 0;
            mosi = test_data[i*INPUT_W-1 -: 4];

            $display("++ INPUT i => MOSI: %d, SCK: %d, SS: %d", i, mosi, sck, ss);
            @(posedge sck);
        end
        ss = 1;
        sck = 1;
        repeat (10) @(posedge clk);
    end


    int error_counter = 0;
    logic [OUTPUT_W-1:0] ethalon_data;
    assign ethalon_data = test_data;

    initial begin // recieve and check data
        @(posedge valid);
        if (data !== ethalon_data) begin
            error_counter++;
            $display ("output_data %d", data);
            $display ("ethalon_data %d", ethalon_data);
        end

        if (error_counter > 0) begin
            $display ("FAIL %s - see log above", `__FILE__);
            $stop;
        end

        repeat (100) @(posedge clk);
        $display ("PASS %s", `__FILE__);
        $stop;
    end

endmodule
