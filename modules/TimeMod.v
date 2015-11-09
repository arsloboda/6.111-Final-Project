`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:52 11/09/2015 
// Design Name: 
// Module Name:    TimeMod 
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
module TimeMod(
    input [17:0] audio_in,
    input ready,
    input clock,
    input reset,
    input [7:0] controls,
    output reg [17:0] audio_out
    );
	always@(posedge clock) begin
		if(reset) begin
			audio_out<=18'b00_0000_0000_0000_0000;	
		end
		else if(ready) begin
			audio_out<=audio_in;
		end
	end

endmodule
