module FIFO_testbench #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4 
) ();
    logic clk;
    logic rst_n;
    logic wr_en = 0;
    logic rd_en = 0;
    logic [DATA_WIDTH-1:0] input_data;
    logic [DATA_WIDTH-1:0] output_data;
    logic fifo_full;
    logic fifo_empty;

    FIFO fifo_dut(
        .i_clk(clk),
        .i_rst_n(rst_n),
        .i_wr_en(wr_en),
        .i_rd_en(rd_en),
        .i_data(input_data),
        .o_data(output_data),
        .o_full(fifo_full),
        .o_empty(fifo_empty)
    );

    logic [DATA_WIDTH-1:0] data [2] = '{ 8'($random()), 8'($random()) };

    initial begin
        clk = '0;
        forever begin
            #10ns clk = ~clk;
        end
    end

    initial begin
        rst_n <= '0; repeat (10) @(posedge clk);
        rst_n <= '1;
    end

    initial begin
        repeat (100) @(posedge clk);
        wr_en = '1;
        input_data = data[0];
        @(posedge clk);
        input_data = data[1];
        @(posedge clk);
        wr_en = '0;

        rd_en = '1;
        $display("input_data: %d, output_data: %d", data[0], output_data);
        @(posedge clk);
        $display("input_data: %d, output_data: %d", data[1], output_data);
        @(posedge clk);
        rd_en = '0;

        $stop;
    end

endmodule