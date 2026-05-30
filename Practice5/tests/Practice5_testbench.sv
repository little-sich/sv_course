module Practice5_testbench();

/////////////////////////////////////////////////////////////////////////////
// parameters and localparams
/////////////////////////////////////////////////////////////////////////////

// parameter  INFO = 1;
parameter  NUM_ITER = 50;

// parameter  WIO_TB = 8;
// localparam MAX_RANGE = (2 ** WIO_TB) - 1;

parameter CLK_PERIOD = 10ns; // 100 MHz

/////////////////////////////////////////////////////////////////////////////
// signal declaration
/////////////////////////////////////////////////////////////////////////////

logic clk = 0;
logic [4:0] reg1_in;
logic [4:0] reg1_out;

logic reg2_rst = 0;
logic [4:0] reg2_in;
logic [4:0] reg2_out;

logic reg3_arstn = 1;
logic [4:0] reg3_in;
logic [4:0] reg3_out;

logic mux1_sel = 0;
logic [1:0] mux1_in;
logic mux1_out;

logic mux2_sel = 0;
logic [1:0] mux2_in;
logic mux2_out;

logic mux3_sel = 0;
logic mux3_in[1:0];
logic mux3_out;

// logic  [WIO_TB-1 : 0]    a = 0;
// logic  [WIO_TB-1 : 0]    b = 0;
// logic  [WIO_TB-1 : 0]    result;
// logic                    overflow;

// logic input_valid = 0;
// logic output_valid;

// logic [WIO_TB : 0]     ethalon_data = 0;
// int ethalon_data_array[NUM_ITER] = '{NUM_ITER{0}};
// logic [WIO_TB : 0]     ethalon_data_out = 0;
// int error_counter = 0;

/////////////////////////////////////////////////////////////////////////////
// sheme install
/////////////////////////////////////////////////////////////////////////////

Register reg1(
    .d(reg1_in),
    .clk(clk),
    .q(reg1_out)
);

RegisterSync reg2(
    .d(reg2_in),
    .clk(clk),
    .rst(reg2_rst),
    .q(reg2_out)
);

RegisterAsyncN reg3(
    .d(reg3_in),
    .clk(clk),
    .arstn(reg3_arstn),
    .q(reg3_out)
);

Mux2If mux1(
    .sel(mux1_sel),
    .in(mux1_in),
    .out(mux1_out)
);

Mux2Case mux2(
    .sel(mux2_sel),
    .in(mux2_in),
    .out(mux2_out)
);

Mux2Vector mux3(
    .sel(mux3_sel),
    .in(mux3_in),
    .out(mux3_out)
);

/////////////////////////////////////////////////////////////////////////////
// clk and reset generate
/////////////////////////////////////////////////////////////////////////////

initial begin
    forever begin
        #(CLK_PERIOD/2) clk = ~clk;
    end
end

// initial begin
//     repeat (10) @ (posedge clk);
//     arstn <= '0;
//     repeat (10) @ (posedge clk);
//     arstn <= '1;
// end

/////////////////////////////////////////////////////////////////////////////
// send data
/////////////////////////////////////////////////////////////////////////////

initial begin
    repeat (10) @(posedge clk);
end

initial begin
    //input_valid = 1; // control signal: start data transmit
    for (int i = 0; i < NUM_ITER; i++) begin
        reg1_in = 1;
        @(posedge clk);
        reg1_in = 0;
        repeat (9) @(posedge clk);

        // // generate random data and sends it to DUT
        // a = $urandom & MAX_RANGE;
        // b = $urandom & MAX_RANGE;

        // // generate ethalon data and write it to array
        // ethalon_data = a + b;
        // ethalon_data_array[i] = ethalon_data;
        // if (INFO == 1) begin
        //     $display("INPUT: iteration = %d, a = %d, b = %d, ethalon_result = %d", i, a, b, ethalon_data);
        // end

        // @(posedge clk);
    end
    //input_valid = 0; // control signal: stop data transmit
    $stop;
end

initial begin
    for (int i = 0; i < NUM_ITER; i++) begin
        reg2_in = 1;
        @(posedge clk);
        reg2_rst = 1;
        @(posedge clk);
        reg2_rst = 0;
        repeat (8) @(posedge clk);
    end
    $stop;
end

initial begin
    for (int i = 0; i < NUM_ITER; i++) begin
        reg3_in = 1;
        @(posedge clk);
        #1ns;
        reg3_arstn = 0;
        #3ns;
        reg3_arstn = 1;
        repeat (9) @(posedge clk);
    end
    $stop;
end

initial begin
    for (int i = 0; i < NUM_ITER; i++) begin
        mux1_sel = 0;
        @(posedge clk);
        mux1_in = 2'd1;
         @(posedge clk);
        mux1_in = 2'd2;
         @(posedge clk);
        mux1_in = 2'd3;
         @(posedge clk);

        mux1_sel = 1;
        @(posedge clk);
        mux1_in = 2'd1;
         @(posedge clk);
        mux1_in = 2'd2;
         @(posedge clk);
        mux1_in = 2'd3;
         @(posedge clk);
    end
    $stop;
end

initial begin
    for (int i = 0; i < NUM_ITER; i++) begin
        mux2_sel = 0;
        @(posedge clk);
        mux2_in = 2'd1;
         @(posedge clk);
        mux2_in = 2'd2;
         @(posedge clk);
        mux2_in = 2'd3;
         @(posedge clk);

        mux2_sel = 1;
        @(posedge clk);
        mux2_in = 2'd1;
         @(posedge clk);
        mux2_in = 2'd2;
         @(posedge clk);
        mux2_in = 2'd3;
         @(posedge clk);
    end
    $stop;
end

initial begin
    for (int i = 0; i < NUM_ITER; i++) begin
        mux3_sel = 0;
        @(posedge clk);
        mux3_in[0] = 1;
        mux3_in[1] = 0;
        @(posedge clk);
        mux3_in[0] = 0;
        mux3_in[1] = 1;
        @(posedge clk);
        mux3_in[0] = 1;
        mux3_in[1] = 1;
        @(posedge clk);

        mux3_sel = 1;
        @(posedge clk);
        mux3_in[0] = 1;
        mux3_in[1] = 0;
        @(posedge clk);
        mux3_in[0] = 0;
        mux3_in[1] = 1;
        @(posedge clk);
        mux3_in[0] = 1;
        mux3_in[1] = 1;
        @(posedge clk);
    end
    $stop;
end

/////////////////////////////////////////////////////////////////////////////
// resieve data, check data and stop the test
/////////////////////////////////////////////////////////////////////////////

// initial begin

//     @(posedge output_valid); // sinchronisation with DUT output
//     @(posedge clk);

//     for (int i = 0; i < NUM_ITER; i ++) begin

//         ethalon_data_out = ethalon_data_array[i];

//         if (result != ethalon_data_out) begin
//             error_counter++;
//             if (INFO == 1) begin
//                 $write ("OUTPUT: iteration %d", i);
//                 $write (", output_data %d", result);
//                 $write (", ethalon_data %d", ethalon_data_out);
//                 $write (", overflow %d", overflow);
//                 $write ("\n");
//             end
//         end
//         @(posedge clk);
//     end

//     if (error_counter > 0) begin
//         $display ("FAIL %s! NUMBER_OF_ERRORS = %d", `__FILE__, error_counter);
//         $stop;
//     end else begin
//         $display ("PASS %s", `__FILE__);
//     end

//     repeat (100) @ (posedge clk);
//     $stop;

// end

endmodule
