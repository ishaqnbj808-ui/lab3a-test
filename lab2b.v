module lab2b(
    input [3:0] a, b,
	input cin,          
    output[7:0] d1, 
	output[7:0] d0,
	output coutext
);

wire [2:0] cinter;
wire [3:0] s;
wire cout; 
wire gr, z;
wire [3:0] aout;
wire [3:0] m;
wire [7:0] dout1, dout0;

// 8-bit full adder loop

    lab2c_fulladder fa_1(a[0], b[0], cin, cinter[0], s[0]);
    lab2c_fulladder fa_2(a[1], b[1], cinter[0], cinter[1], s[1]);
    lab2c_fulladder fa_3(a[2], b[2], cinter[1], cinter[2], s[2]);
    lab2c_fulladder fa_4(a[3], b[3], cinter[2], cout, s[3]);


assign z = gr | cout;

// display d1

lab2c_comparator comparator (s, 4'b1001, gr);
    
lab2c_circuitB circuitB (z, dout1);

assign coutext = z;

assign d1 = dout1;

// display d0

lab2c_newcircuitA newcircuitA (z, s, aout);

genvar i;
generate
    for (i=0; i<4; i=i+1) begin : inst_mux_loop
        lab2c_mux2to1 inst_mux (s[i], aout[i], z, m[i]);
end
endgenerate

lab2c_decoder decoder(m, dout0);

assign d0 = dout0;

endmodule




