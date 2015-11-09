`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:32 11/09/2015 
// Design Name: 
// Module Name:    FreqMod 
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
module FreqMod(
    input [17:0] audio_in,
    input ready,
    input clock,
    input reset,
    input [7:0] controls,
    output [17:0] audio_out,
    output [7:0] freq1 =0,
    output [7:0] freq2 =0,
    output [7:0] freq3 =0,
    output [7:0] freq4 =0,
    output [7:0] freq5 =0,
    output [7:0] freq6 =0,
    output [7:0] freq7 =0
    );
	
	always@(posedge clock) begin
		if(reset) begin
			audio_out<=18'b00_0000_0000_0000_0000;
			freq1<=8'b0000_0000;
			freq2<=8'b0000_0000;
			freq3<=8'b0000_0000;
			freq4<=8'b0000_0000;
			freq5<=8'b0000_0000;
			freq6<=8'b0000_0000;
			freq7<=8'b0000_0000;	
		end
		else if(ready) begin
			audio_out<=audio_in;
			freq1<=8'b0000_0000;
			freq2<=8'b0000_0000;
			freq3<=8'b0000_0000;
			freq4<=8'b0000_0000;
			freq5<=8'b0000_0000;
			freq6<=8'b0000_0000;
			freq7<=8'b0000_0000;
		end
	end

endmodule
