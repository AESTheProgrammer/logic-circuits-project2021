`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:36:30 01/03/2022 
// Design Name: 
// Module Name:    entry_park 
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
module entry_park(
    entry,
    parking_capacity,
    park_number
    );
input entry;
input [7:0] parking_capacity;
output [2:0] park_number;
    wire enable;
    entry_checker ec(entry, parking_capacity, enable);
    park_space_number psn(enable, parking_capacity, park_number);
endmodule
