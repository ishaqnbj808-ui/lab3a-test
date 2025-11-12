module lab2c_mux2to1 (
    input  a, b, s, 
    output m
);

assign m = s? b:a;

endmodule