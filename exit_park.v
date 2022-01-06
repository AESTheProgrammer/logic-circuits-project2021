`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:47:45 01/03/2022 
// Design Name: 
// Module Name:    exit_park 
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
module exit_park(
 exit,
 token,
 pattern,
 park_location);
input exit;
input [2:0] token;
input [2:0] pattern;
output [7:0] park_location;
wire[2:0] park_number;
decrypt d(exit, token, pattern, park_number);
exit_parking_lot e(park_number, park_location);
endmodule
