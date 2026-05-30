module FIFO #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input logic i_clk,
    input logic i_rst_n,
    input logic i_wr_en,
    input logic i_rd_en,
    input logic [DATA_WIDTH-1:0] i_data,
    output logic [DATA_WIDTH-1:0] o_data,
    output logic o_full,
    output logic o_empty
);

localparam DEPTH = 1 << ADDR_WIDTH;
logic [DATA_WIDTH-1:0] mem [DEPTH];

// ADDR_WIDTH+1 бит
logic [ADDR_WIDTH:0] wr_ptr, rd_ptr;
// Запись в память
always_ff @(posedge i_clk) begin
    if (i_wr_en && !o_full) begin
        mem[wr_ptr[ADDR_WIDTH-1:0]] <= i_data;
    end
end

// Чтение из памяти
assign o_data = mem[rd_ptr[ADDR_WIDTH-1:0]];
// Управление указателями
always_ff @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
    end else begin
        if (i_wr_en && !o_full)  wr_ptr <= wr_ptr + 1;
        if (i_rd_en && !o_empty) rd_ptr <= rd_ptr + 1;
    end
end

// Логика флагов
// Empty: указатели полностью совпадают
assign o_empty = (wr_ptr == rd_ptr);
// Full: индексы совпадают, но MSB отличается
assign o_full = (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]) &&
                (wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]);
endmodule