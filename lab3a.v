module lab3a (
    // Inputs for the Sequential Logic
    input clk, 
    input rst, // Renamed 'reset' to 'rst' to match template
    input ld,  // Renamed 'load' to 'ld' to match template
    
    // Inputs for the Adder
    input cin,
    input [7:0] a, b,
    
    // Registered Outputs (7-bit wide)
    output [6:0] d2, d1, d0
);

// Wires to hold the combinational 8-bit result from the lab2c module
wire [7:0] comb_d2, comb_d1, comb_d0;


// --- 1. Instantiate the Combinational Adder Core (lab2c) ---

// lab2c calculates the current 8-bit sum (comb_d*) based on inputs a, b, cin
// NOTE: Ensure your existing lab2c module outputs are [7:0] as previously used.
lab2c adder_core (
    .a(a), 
    .b(b),
    .cin(cin),
    // Outputs are 8-bit wires
    .d2(comb_d2), 
    .d1(comb_d1), 
    .d0(comb_d0)
);


// --- 2. Instantiate the 7-bit Loadable Registers ---

// Register for D0 (7-bit output)
loadable_register_7bit reg_d0_inst (
    .clk(clk),
    .reset(rst),
    .load(ld),
    .d_in(comb_d0), 
    .q(d0) // Directly connect to the output port
);

// Register for D1 (7-bit output)
loadable_register_7bit reg_d1_inst (
    .clk(clk),
    .reset(rst),
    .load(ld),
    .d_in(comb_d1), 
    .q(d1) // Directly connect to the output port
);

// Register for D2 (7-bit output)
loadable_register_7bit reg_d2_inst (
    .clk(clk),
    .reset(rst),
    .load(ld),
    .d_in(comb_d2), 
    .q(d2) // Directly connect to the output port
);

// No explicit 'assign' statements needed for d0, d1, d2 since they are driven 
// directly by the register outputs 'q' and are declared as 'output' in the header.

endmodule