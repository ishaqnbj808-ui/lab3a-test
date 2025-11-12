module lab2c_fulladder (
    input a, b, cin,
    output cout, s
);
    assign s  = a ^ b ^ cin;          
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule