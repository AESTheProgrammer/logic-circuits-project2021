`timescale 1ns / 1ps
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
 exit,
 token,
 pattern,
 park_number);
input exit;
input [2:0] token;
input [2:0] pattern;
output [2:0] park_number;
xor(park_number[1], token[1], pattern[1]);
xor(park_number[2], token[2], pattern[2]);
xor(park_number[0], token[0], pattern[0]);
endmodule