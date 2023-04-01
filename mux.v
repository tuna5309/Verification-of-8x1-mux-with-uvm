module  mux8x1 (
    input  d0,
    input  d1,
    input  d2,
    input  d3,
    input  d4,
    input  d5,
    input  d6,
    input  d7,
    input  [2:0] sel,
    output reg out
);
 
always @* begin
    case(sel)
        3'b000: out=d0;
        3'b001: out=d1;
        3'b010: out=d2;
        3'b011: out=d3;
        3'b100: out=d4;
        3'b101: out=d5;
        3'b110: out=d6;
        3'b111: out=d7;
    endcase
end
endmodule