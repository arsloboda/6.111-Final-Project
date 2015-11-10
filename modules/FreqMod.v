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
    input signed [17:0] audio_in, // I made this signed
    input ready,
    input clock, // 27MHz clock is what I want, is that what I'm getting?
    input reset,
    input [7:0] controls,
    output reg signed [17:0] audio_out, // I made this signed
    output reg [7:0] freq1,
    output reg [7:0] freq2,
    output reg [7:0] freq3,
    output reg [7:0] freq4,
    output reg [7:0] freq5,
    output reg [7:0] freq6,
    output reg [7:0] freq7
    );
	 
	wire signed [17:0] full_freq1;
	wire signed [17:0] full_freq2;
	wire signed [17:0] full_freq3;
	wire signed [17:0] full_freq4;
	wire signed [17:0] full_freq5;
	wire signed [17:0] full_freq6;
	wire signed [17:0] full_freq7;
	
	wire signed [9:0] coeff1;
	wire signed [9:0] coeff2;
	wire signed [9:0] coeff3;
	wire signed [9:0] coeff4;
	wire signed [9:0] coeff5;
	wire signed [9:0] coeff6;
	wire signed [9:0] coeff7;
	
	// TODO: need to implement other coeffs modules to reflect coefficients I built in Matlab
	// missing very first coefficient for some reason when perform impulse response
	coeffs_below80Hz coeffs1 (.index(index),.coeff(coeff1));
	coeffs31 coeffs2 (.index(index),.coeff(coeff2)); // placeholder
	coeffs31 coeffs3 (.index(index),.coeff(coeff3)); // placeholder
	coeffs31 coeffs4 (.index(index),.coeff(coeff4)); // placeholder
	coeffs31 coeffs5 (.index(index),.coeff(coeff5)); // placeholder
	coeffs31 coeffs6 (.index(index),.coeff(coeff6)); // placeholder
	coeffs31 coeffs7 (.index(index),.coeff(coeff7)); // placeholder
	

	fir31 filter1 (.clock(clock),.reset(reset),.ready(ready),.coeff(coeff1),
					.x(audio_in[17:10]),.y(full_freq1));
	
	fir31 filter2 (.clock(clock),.reset(reset),.ready(ready),.coeff(coeff2),
					.x(audio_in[17:10]),.y(full_freq2));
	
	fir31 filter3 (.clock(clock),.reset(reset),.ready(ready),.coeff(coeff3),
					.x(audio_in[17:10]),.y(full_freq3));
	
	fir31 filter4 (.clock(clock),.reset(reset),.ready(ready),.coeff(coeff4),
					.x(audio_in[17:10]),.y(full_freq4));
	
	fir31 filter5 (.clock(clock),.reset(reset),.ready(ready),.coeff(coeff5),
					.x(audio_in[17:10]),.y(full_freq5));
	
	fir31 filter6 (.clock(clock),.reset(reset),.ready(ready),.coeff(coeff6),
					.x(audio_in[17:10]),.y(full_freq6));
	
	fir31 filter7 (.clock(clock),.reset(reset),.ready(ready),.coeff(coeff7),
					.x(audio_in[17:10]),.y(full_freq7));
	
	
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
