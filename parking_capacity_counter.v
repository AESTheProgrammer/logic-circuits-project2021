`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:54:12 01/03/2022 
// Design Name: 
// Module Name:    parking_capacity_counter 
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
module parking_capacity_counter(
 new_capacity,
 parked,
 empty);
input [7:0] new_capacity;
output [3:0] parked;
output [3:0] empty;
wire[3:0] temp0;
wire[3:0] temp1;
wire[3:0] temp2;
wire[3:0] temp3;
wire[3:0] temp4;
wire[3:0] temp5;
wire[3:0] temp6;
fulladder_4bit1_ f0(new_capacity[0], 4'b0000, 1'b0, temp0),
					f1(new_capacity[1], temp0, 1'b0, temp1),
					f2(new_capacity[2], temp1, 1'b0, temp2),
					f3(new_capacity[3], temp2, 1'b0, temp3),
					f4(new_capacity[4], temp3, 1'b0, temp4),
					f5(new_capacity[5], temp4, 1'b0, temp5),
					f6(new_capacity[6], temp5, 1'b0, temp6),
					f7(new_capacity[7], temp6, 1'b0, empty);
fulladder_4bit4_ f8(4'b1000, empty, 1'b1, parked);
endmodule

module fulladder_4bit1_(
    input a,
    input[3:0] b,
    input cin,
    output[3:0] sum
    );
    wire c_1, c_2, c_3, cout;
    circuit2 C01(a, b[0], cin, cin, c_1, sum[0]),
		  C02(1'b0, b[1], c_1, cin, c_2, sum[1]),
		  C03(1'b0, b[2], c_2, cin, c_3, sum[2]),
		  C04(1'b0, b[3], c_3, cin, cout, sum[3]);
endmodule

module fulladder_4bit4_(
    input[3:0] a,
    input[3:0] b,
    input cin,
    output[3:0] sum
    );
    wire c_1, c_2, c_3, cout;
    circuit2 C01(a[0], b[0], cin, cin, c_1, sum[0]),
		  C02(a[1], b[1], c_1, cin, c_2, sum[1]),
		  C03(a[2], b[2], c_2, cin, c_3, sum[2]),
		  C04(a[3], b[3], c_3, cin, cout, sum[3]);
endmodule

module circuit2(
    input a,
    input b,
    input cin,
    input sel,
    output cout,
    output sum
    );
    wire c;
    xor xor_gate(c, b, sel);
    fulladder2 f(a, c, cin, cout, sum);
endmodule

module fulladder2(
    input a,
    input b,
    input cin,
    output cout,
    output sum
    );
    wire sum01, c01, c02;
    halfadder2 h01(a, b, c01, sum01),
             h02(sum01, cin, c02, sum);
    or or_gate(cout, c01, c02);
endmodule

module halfadder2(
    input a,
    input b,
    output cout,
    output sum
    );
	xor xor_gate(sum, a, b);
	and and_gate(cout, a, b);
endmodule
