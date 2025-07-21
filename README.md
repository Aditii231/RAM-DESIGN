# RAM-DESIGN

COMPANY: CODTECH IT SOLUTIONS

NAME: ADITI ATTAL

INTERN ID: CITS0D695

DOMAIN: VLSI

DURATION: 6 WEEKS

MENTOR: NEELA SANTOSH

DESCRIPTION:
1. Objective and Overview of the Task
The primary objective of this task was to design, implement, and simulate a simple synchronous RAM (Random Access Memory) module using the Verilog Hardware Description Language. The simulation and waveform analysis were performed using the EDA Playground online platform, which offers a convenient web-based interface for digital design development. The focus was on creating a memory module that can perform basic read and write operations, synchronized with a clock signal. This type of memory is widely used in digital systems, processors, and embedded applications. A RAM module is essential in any computing system, as it provides temporary data storage and fast access for ongoing operations. In this task, a single-port RAM was designed, meaning the same port is used for both reading and writing data, depending on the control signal provided.

2. RAM Module Design in Verilog
The synchronous RAM was implemented in a module named SyncRAM, defined in the ram.v file. It was parameterized with DATA_WIDTH (8 bits) and ADDR_WIDTH (4 bits), allowing for 16 memory locations, each capable of storing an 8-bit data word. The RAM accepts four main inputs: a clock (clk), a write enable (we), an address (addr), and input data (din). The output is dout, which holds the data read from memory. The memory itself was implemented using a register array: reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1]. All operations are triggered on the positive edge of the clock, making the RAM synchronous. If the write enable is high on a clock edge, the input data is written to the specified address. Otherwise, the module performs a read operation and places the corresponding memory content on the output.

3. Testbench Development and Waveform Dump
To validate the functionality of the RAM module, a testbench was developed in the ram_tb.v file. This testbench instantiates the RAM module and applies a series of write and read operations to simulate real-world usage. The testbench also generates a clock signal using the construct always #5 clk = ~clk, creating a 10ns clock period. To observe the internal behavior and signal transitions, the testbench uses Verilog system tasks $dumpfile("ram_waveform.vcd") and $dumpvars(0, SyncRAM_tb). These tasks create a VCD (Value Change Dump) file, which records all signal changes over time. This file can be visualized using GTKWave (or EDA Playground's EPWave), which helps in debugging and validating the read/write operations at specific clock cycles. The simulation writes values to addresses 0 to 3 and 15, and then reads them back, checking if the correct values are retained.

4. Simulation Process on EDA Playground
The entire project was developed and tested on EDA Playground, a free, browser-based simulation platform for Verilog and SystemVerilog. It allows users to write and simulate code without installing any tools locally. On the platform, the Verilog files were placed in the appropriate code windows: ram.v for the RAM module and ram_tb.v for the testbench. The simulator used was Icarus Verilog with GTKWave, selected for its compatibility with VCD waveform files. After setting the top-level module name to SyncRAM_tb and enabling waveform viewing, the simulation was executed by clicking the "Run" button. The simulation results were printed to the console, and the waveform viewer (EPWave) provided a visual representation of signal transitions. This made it easy to verify when data was written to memory and when it was successfully read back, all synchronized with the clock signal.

5. Conclusion and Key Learning Outcomes
This task demonstrated a successful implementation of a basic synchronous RAM in Verilog and highlighted the importance of testbench design and waveform analysis in digital circuit verification. Through EDA Playground, the entire design-to-simulation cycle was completed seamlessly in an online environment. The RAM module behaved as expected, performing write operations on clock edges when the write enable signal was high and correctly outputting stored data during read operations. By dumping waveforms into a .vcd file, a clear and detailed understanding of timing relationships and signal behavior was achieved. This project reinforces key digital design concepts such as memory modeling, clock synchronization, and simulation-driven debugging. The modular approach and clear structure of the Verilog code also make the RAM module reusable in larger projects, such as processor data paths, buffers, and cache implementations.

OUTPUT:

<img width="1883" height="392" alt="Image" src="https://github.com/user-attachments/assets/51685c53-2177-4b1f-a254-7f05bfaef2db" />
