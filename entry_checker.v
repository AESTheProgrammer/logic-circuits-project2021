`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:35:15 01/03/2022 
// Design Name: 
// Module Name:    entry_checker 
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
module entry_checker(
    entry,
    parking_capacity,
    enable
    );
input entry;
input [7:0] parking_capacity;
output enable;
assign enable = 
(parking_capacity[0] |
parking_capacity[1] |
parking_capacity[2] |
parking_capacity[3] |
parking_capacity[4] |
parking_capacity[5] |
parking_capacity[6] |
parking_capacity[7]) |
entry;

endmodule
