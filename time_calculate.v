`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:51:10 01/03/2022 
// Design Name: 
// Module Name:    time_calculate 
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
module time_calculate(
 time_out,
 time_in,
 Time);
input [7:0] time_out;
input [7:0] time_in;
output [7:0] Time;
wire cout;
fulladder_8bit adder(time_out, time_in, 1'b1, cout, Time);
endmodule

module fulladder_8bit(
    input[7:0] a,
    input[7:0] b,
    input cin,
    output cout,
    output[7:0] sum
    );
    wire c_1, c_2, c_3, c_4, c_5, c_6, c_7;
    circuit C01(a[0], b[0], cin, cin, c_1, sum[0]),
        C03(a[1], b[1], c_1, cin, c_2, sum[1]),
        C04(a[2], b[2], c_2, cin, c_3, sum[2]),
        C05(a[3], b[3], c_3, cin, c_4, sum[3]),
        C06(a[4], b[4], c_4, cin, c_5, sum[4]),
        C07(a[5], b[5], c_5, cin, c_6, sum[5]),
        C08(a[6], b[6], c_6, cin, c_7, sum[6]),
        C09(a[7], b[7], c_7, cin, cout, sum[7]);
endmodule

module circuit(
    input a,
    input b,
    input cin,
    input sel,
    output cout,
    output sum
    );
    wire c;
    xor xor_gate(c, b, sel);
    fulladder f(a, c, cin, cout, sum);
endmodule

module fulladder(
    input a,
    input b,
    input cin,
    output cout,
    output sum
    );
    wire sum01, c01, c02;
    halfadder h01(a, b, c01, sum01),
             h02(sum01, cin, c02, sum);
    or or_gate(cout, c01, c02);
endmodule

module halfadder(
    input a,
    input b,
    output cout,
    output sum
    );
	xor xor_gate(sum, a, b);
	and and_gate(cout, a, b);
endmodule