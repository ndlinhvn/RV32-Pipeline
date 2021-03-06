module stall_handle_unit(
	input stall_lw,
	input stall_j,
	input clock,
	output reg ff_stop_updateF, 
	output reg ff_stop_updateD,//Tich cuc muc CAO
	output reg pc_stop_update  //Tich cuc muc CAO
);

reg stall_state;
reg last_state;

always @(negedge clock)
begin
if (stall_lw == 1) begin   
	ff_stop_updateF = 1;
	ff_stop_updateD = 1;
	pc_stop_update = 1;
	// Stall state = true
	last_state = stall_state;
	stall_state = 1;	
end
else if (stall_j == 1) begin   
	ff_stop_updateF = 1;
	ff_stop_updateD = 0;
	pc_stop_update = 0;
	// Stall state = true
	last_state = stall_state;
	stall_state = 1;	
end
else begin
	ff_stop_updateF = 0;
	ff_stop_updateD = 0;
	pc_stop_update = 0;
	last_state = stall_state;
end
if (last_state && stall_state) begin 
	ff_stop_updateF = 0;
	ff_stop_updateD = 0;
	pc_stop_update = 0;
	// Stall state = false
	last_state = stall_state;
	stall_state = 0;	
end
end
endmodule
