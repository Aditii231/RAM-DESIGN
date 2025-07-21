`timescale 1ns/1ps

module SyncRAM_tb;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    // Signals
    reg clk;
    reg we;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;

    // Instantiate the RAM module
    SyncRAM #(DATA_WIDTH, ADDR_WIDTH) uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        we = 0;
        addr = 0;
        din = 0;

        // VCD file setup for waveform
        $dumpfile("ram_waveform.vcd");  // Name of VCD output file
        $dumpvars(0, SyncRAM_tb);       // Dump all variables in this module

        // Write operations
        @(posedge clk); we = 1; addr = 4'd0; din = 8'hA5; // Write 0xA5 to addr 0
        @(posedge clk); addr = 4'd1; din = 8'h5A;         // Write 0x5A to addr 1
        @(posedge clk); addr = 4'd2; din = 8'h3C;         // Write 0x3C to addr 2
        @(posedge clk); addr = 4'd3; din = 8'hFF;         // Write 0xFF to addr 3

        // Read operations
        @(posedge clk); we = 0; addr = 4'd0;              // Read from addr 0
        @(posedge clk); addr = 4'd1;                      // Read from addr 1
        @(posedge clk); addr = 4'd2;                      // Read from addr 2
        @(posedge clk); addr = 4'd3;                      // Read from addr 3

        // Final test
        @(posedge clk); we = 1; addr = 4'd15; din = 8'h99;// Write 0x99 to addr 15
        @(posedge clk); we = 0; addr = 4'd15;             // Read from addr 15

        #20;  // Wait to ensure signal visibility in VCD
        $finish;
    end

endmodule
