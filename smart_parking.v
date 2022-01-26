`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:56 01/16/2022 
// Design Name: 
// Module Name:    smart_parking 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module smart_parking(
input entry,
input [7:0] parking_capacity,
input exit,
input [2:0] pattern,
input [7:0] time_out,
input [7:0] time_in,
output [7:0] new_capacity,
output [7:0] time_total,
output [3:0] parked,
output [3:0] empty
);
	wire [2:0]park_number; wire [2:0]token; wire [7:0]park_location; wire [7:0]parking_capacity_new;
	entry_park E(entry, parking_capacity, park_number);
	token_production TP(park_number, pattern, token);
	exit_park EP(exit, token, pattern, park_location);
	update_capacity UC(entry, parking_capacity, parking_capacity_new);
	calculate_new_capacity CNC(park_location, parking_capacity_new, new_capacity);
	parking_capacity_counter PCC(new_capacity, parked, empty);
	time_calculate TC(time_out, time_in, time_total);
endmodule