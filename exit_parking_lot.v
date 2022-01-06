`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:41 01/03/2022 
// Design Name: 
// Module Name:    exit_parking_lot 
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
module exit_parking_lot(
 park_number,
 park_location);
input [2:0] park_number;
output [7:0] park_location;
wire [2:0] not_park_number;
not (not_park_number[0], park_number[0]);
not (not_park_number[1], park_number[1]);
not (not_park_number[2], park_number[2]);
and (park_location[0], not_park_number[0], not_park_number[1], not_park_number[2]),
    (park_location[1], not_park_number[2], not_park_number[1], park_number[0]),
    (park_location[2], not_park_number[2], park_number[1], not_park_number[0]),
    (park_location[3], not_park_number[2], park_number[1], park_number[0]),
    (park_location[4], park_number[2], not_park_number[1], not_park_number[0]),
    (park_location[5], park_number[2], not_park_number[1], park_number[0]),
    (park_location[6], park_number[2], park_number[1], not_park_number[0]),
    (park_location[7], park_number[2], park_number[1], park_number[0]);

endmodule