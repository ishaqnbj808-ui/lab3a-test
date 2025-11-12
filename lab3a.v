module lab3a (
    input clk,            // clock input
    input reset_n,        // active low reset
    input load_n,         // active low load
    input [7:0] a, b,     // 8-bit inputs
    input cin,            // carry-in
    output [3:0] reg_sum, // registered sum
    output [4:0] reg_cs   // registered carry+sum
);

    // Wires for connection between adder and registers
    wire [7:0] d2, d1, d0;
    wire [3:0] sum4;
    wire cout;

    // instantiate the adder from Lab2C
    lab2c adder8 (
        .a(a),
        .b(b),
        .cin(cin),
        .d2(d2),
        .d1(d1),
        .d0(d0)
    );

    // Use lower nibble of d0 as 4-bit sum
    assign sum4 = d0[3:0];

    // Assume MSB of d1 or another signal gives carry (adjust if needed)
    assign cout = d1[0];  // <— change if your lab2b defines carry differently

    // Instantiate registers
    reg4bit r4 (
        .clk(clk),
        .reset_n(reset_n),
        .load_n(load_n),
        .d(sum4),
        .q(reg_sum)
    );

    reg5bit r5 (
        .clk(clk),
        .reset_n(reset_n),
        .load_n(load_n),
        .d({cout, sum4}),
        .q(reg_cs)
    );

endmodule
