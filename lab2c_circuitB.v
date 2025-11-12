module lab2c_circuitB(
    input gr,
    output [7:0] d1
);


assign d1 = gr? 8'b11111001 : 8'b11000000;

endmodule