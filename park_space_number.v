`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:37:18 01/03/2022 
// Design Name: 
// Module Name:    park_space_number 
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
module park_space_number(
    enable,
    parking_capacity,
    park_number
    );
input enable;
input [7:0] parking_capacity;
output [2:0] park_number;
wire [7:0] B;
assign  B[7] = parking_capacity[7],
        B[6] = parking_capacity[6] &
                ~B[7],
        B[5] = parking_capacity[5] &
                ~parking_capacity[6] &
                ~parking_capacity[7],
        B[4] = parking_capacity[4] &
                ~parking_capacity[5] &
                ~parking_capacity[6] &
                ~parking_capacity[7],
        B[3] = parking_capacity[3] &
                ~parking_capacity[4] &
                ~parking_capacity[5] &
                ~parking_capacity[6] &
                ~parking_capacity[7],
        B[2] = parking_capacity[2] &
                ~parking_capacity[3] &
                ~parking_capacity[4] &
                ~parking_capacity[5] &
                ~parking_capacity[6] &
                ~parking_capacity[7],
        B[1] = parking_capacity[1] &
                ~parking_capacity[2] &
                ~parking_capacity[3] &
                ~parking_capacity[4] &
                ~parking_capacity[5] &
                ~parking_capacity[6] &
                ~parking_capacity[7],
        B[0] = parking_capacity[0] &
                ~parking_capacity[1] &
                ~parking_capacity[2] &
                ~parking_capacity[3] &
                ~parking_capacity[4] &
                ~parking_capacity[5] &
                ~parking_capacity[6] &
                ~parking_capacity[7];
    assign park_number[2] = (B[7] | B[6] | B[5] | B[4]) & enable,
           park_number[1] = (B[7] | B[6] | B[3] | B[2]) & enable,
           park_number[0] = (B[7] | B[5] | B[3] | B[1]) & enable;

endmodule
