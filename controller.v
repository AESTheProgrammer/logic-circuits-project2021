/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2021-2022
--  *******************************************************
--  Student ID  : 
--  Student Name: 
--  Student Mail: 
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name: controller
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module controller(
input [2:0] system_token,
input request,
input [7:0] TimeData,
input reset,
input clock,
input confirm,
input [2:0] user_token,
output [7:0] data_Q,
output [7:0] data_P
);
	reg[2:0] PS;
	reg[2:0] NS;
	reg en_Q, en_P;
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
	register r1(TimeData, clock, reset, en_Q, data_Q),
				r2(TimeData, clock, reset, en_P, data_P);
	always @(posedge clock or negedge request)
		if (~request) PS <= S0;
		else PS <= NS;
	always @(user_token or system_token or request
				or confirm or TimeData or PS)
		case (PS)
			S0: begin 
					if (request) NS <= S1;
					else NS <= S0;
					en_Q <= 0;
					en_P <= 0;
				end
			S1: if (confirm) NS <= (user_token == system_token ? S2 : S3);
					else NS <= S1;
			S2: if (confirm) 
					begin
						if (TimeData[7] && TimeData[6] && TimeData[5]
							&& TimeData[4] && TimeData[3]) begin en_P <= 1; en_Q <= 0; end
						else if (!TimeData[7] || !TimeData[6] || !TimeData[5]
							|| !TimeData[4] || !TimeData[3]) begin en_Q <= 1; en_P <= 0; end
						else begin en_P <= 0; en_Q <= 0; end
						NS <= S4;
					end
				else NS <= S2;
			S3: NS <= S3;
			S4: NS <= S0;
			default: NS <= S0;
		endcase
endmodule
