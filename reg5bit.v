module reg5bit (
    input clk,
    input reset_n,   // active low asynchronous reset
    input load_n,    // active low load
    input [4:0] d,   // data input
    output reg [4:0] q // data output
);
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            q <= 5'b00000;
        else if (!load_n)
            q <= d;
        else
            q <= q;
    end
endmodule