`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:51 01/03/2022 
// Design Name: 
// Module Name:    token_production 
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
module token_production(
    park_number,
    pattern,
    token
    );
input [2:0] park_number;
input [2:0] pattern;
output [2:0] token;
assign token[2] = park_number[2] ^ pattern[2],
	token[1] = park_number[1] ^ pattern[1],
	token[0] = park_number[0] ^ pattern[0];

endmodule
