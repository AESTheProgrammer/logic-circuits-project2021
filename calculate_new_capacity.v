`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:44:55 01/03/2022 
// Design Name: 
// Module Name:    calculate_new_capacity 
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
module calculate_new_capacity(
 park_location,
 parking_capacity,
 new_capacity);
input [7:0] park_location;
input [7:0] parking_capacity;
output [7:0] new_capacity;
xor x(new_capacity[0], park_location[0], parking_capacity[0]),
    (new_capacity[1], park_location[1], parking_capacity[1]),
    (new_capacity[2], park_location[2], parking_capacity[2]),
    (new_capacity[3], park_location[3], parking_capacity[3]),
    (new_capacity[4], park_location[4], parking_capacity[4]),
    (new_capacity[5], park_location[5], parking_capacity[5]),
    (new_capacity[6], park_location[6], parking_capacity[6]),
    (new_capacity[7], park_location[7], parking_capacity[7]);
endmodule