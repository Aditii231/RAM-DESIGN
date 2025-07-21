module SyncRAM #(
    parameter DATA_WIDTH = 8,           // Width of data
    parameter ADDR_WIDTH = 4            // Address width (2^4 = 16 locations)
)(
    input clk,
    input we,                           // Write Enable
    input [ADDR_WIDTH-1:0] addr,        // Address input
    input [DATA_WIDTH-1:0] din,         // Data input
    output reg [DATA_WIDTH-1:0] dout    // Data output
);

    // Memory declaration
    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;           // Write operation
        else
            dout <= mem[addr];          // Read operation
    end

endmodule
