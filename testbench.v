module testbench();
reg clk;

top_module _test(clk);

initial begin
clk = 0;
end
always begin
#1 clk =~ clk;
end

endmodule 