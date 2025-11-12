module lab2c(
    input [7:0] a, b,
	 input cin,          
    output[7:0] d2, d1, d0
);

wire cinter;
wire cout; 
wire [7:0] td2, td1, td0;
wire [7:0] dignored = 8'b11111111;

lab2b first_stage(a[3:0], b[3:0], cin, dignored, td0, cinter);
lab2b second_stage(a[7:4], b[7:4], cinter, td2, td1, cout);

assign d2 = td2;
assign d1 = td1;
assign d0 = td0;

endmodule
