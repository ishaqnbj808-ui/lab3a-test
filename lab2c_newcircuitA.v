module lab2c_newcircuitA (
    input z,
    input [3:0] s,
    output reg [3:0] aout
);

always @(*) begin
    if (s > 4'b1001) begin

        aout = s - 4'b1010;
    end 
    else if (s < 4'b0100) begin

        aout = s + 4'b0110;
    end 
    else begin
        
        aout = s;
    end
end

endmodule