module lab2c_decoder(
    input [3:0] m,
    output reg [7:0] dout0
);

always @(*) begin
    case (m)
        4'b0000: dout0 = 8'b11000000;
        4'b0001: dout0 = 8'b11111001;
        4'b0010: dout0 = 8'b10100100;
        4'b0011: dout0 = 8'b10110000;
        4'b0100: dout0 = 8'b10011001;
        4'b0101: dout0 = 8'b10010010;
        4'b0110: dout0 = 8'b10000010;
        4'b0111: dout0 = 8'b11111000;
        4'b1000: dout0 = 8'b10000000;
        4'b1001: dout0 = 8'b10010000;
        default: dout0 = 8'b11111111;
    endcase
end

endmodule

