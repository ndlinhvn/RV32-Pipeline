module wbmux(out,in0,in1,in2, in3,sel);
output reg [31:0]out;
input [31:0]in0,in1,in2, in3;
input [1:0]sel;
always @(*)
	begin
	 case(sel)
		2'b00: out = in0; //DMEM
		2'b01: out = in1; //ALU
		2'b10: out = in2; //PC+4
		2'b11: out = in3;
	 endcase
	end
endmodule
