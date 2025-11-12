module loadable_register_7bit (
    input clk,            // Clock input
    input reset,          // Asynchronous reset (Active High)
    input load,           // Load enable signal (Active High)
    input [7:0] d_in,     // Data input (8-bit result from lab2c)
    output reg [6:0] q    // Registered data output (7-bit display)
);

// The 'always @' block is sensitive to the clock (posedge clk) 
// and the asynchronous reset (posedge reset).
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Asynchronous reset: Clear the register immediately
        q <= 7'h00; 
    end
    else if (load) begin
        // Synchronous load: Capture the lower 7 bits of the 8-bit data input
        q <= d_in[6:0]; 
    end
end

endmodule