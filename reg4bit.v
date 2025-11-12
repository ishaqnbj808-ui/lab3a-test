module reg4bit (
    input clk,
    input reset_n,   // active low asynchronous reset
    input load_n,    // active low load
    input [3:0] d,   // data input
    output reg [3:0] q // data output
);
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            q <= 4'b0000;           // reset to 0
        else if (!load_n)
            q <= d;                 // load new data
        else
            q <= q;                 // hold previous value
    end
endmodule