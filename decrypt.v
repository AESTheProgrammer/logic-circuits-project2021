`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:32 01/03/2022 
// Design Name: 
// Module Name:    decrypt 
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
module decrypt(
token,
pattern,
park_number);
input [2:0] token;
input [2:0] pattern;
output [2:0] park_number;
xor x01(park_number[1], token[1], pattern[1]);
xor x02(park_number[2], token[2], pattern[2]);
xor x03(park_number[0], token[0], pattern[0]);
endmodule