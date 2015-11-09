`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:40 11/09/2015 
// Design Name: 
// Module Name:    ProcessMod 
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
module ProcessMod(
    input [17:0] l_audio_in,
	 input [17:0] r_audio_in,
    input ready,
    input clock,
    input reset,
    input [7:0] f_controls,
	 input [7:0] t_controls,
    output [17:0] l_audio_out =0,
	 output [17:0] r_audio_out =0,
    output [7:0] freq1=0,
    output [7:0] freq2=0,
    output [7:0] freq3=0,
    output [7:0] freq4=0,
    output [7:0] freq5=0,
    output [7:0] freq6=0,
    output [7:0] freq7=0
    );
	//Left and right audio out of frequency modules
	wire l_f_aud_out[7:0];
	wire r_f_aud_out[7:0];
	//Left frequency data out for all 7 bands
	wire l_f_f1_out[7:0];
	wire l_f_f2_out[7:0];
	wire l_f_f3_out[7:0];
	wire l_f_f4_out[7:0];
	wire l_f_f5_out[7:0];
	wire l_f_f6_out[7:0];
	wire l_f_f7_out[7:0];
	//Right frequency data out for all 7 bands
	wire r_f_f1_out[7:0];
	wire r_f_f2_out[7:0];
	wire r_f_f3_out[7:0];
	wire r_f_f4_out[7:0];
	wire r_f_f5_out[7:0];
	wire r_f_f6_out[7:0];
	wire r_f_f7_out[7:0];
	//Instantiate frequency modules for left and right channels
	FreqMod FreqL(.audio_in(l_audio_in),.ready(ready),.clock(clock),
						.reset(reset),.controls(f_controls),.audio_out(l_f_aud_out),
						.freq1(l_f_f1_out),.freq2(l_f_f2_out),.freq3(l_f_f3_out),
						.freq4(l_f_f4_out),.freq5(l_f_f5_out),.freq6(l_f_f6_out),
						.freq7(l_f_f7_out));
	FreqMod FreqR(.audio_in(r_audio_in),.ready(ready),.clock(clock),
						.reset(reset),.controls(f_controls),.audio_out(r_f_aud_out),
						.freq1(r_f_f1_out),.freq2(r_f_f2_out),.freq3(r_f_f3_out),
						.freq4(r_f_f4_out),.freq5(r_f_f5_out),.freq6(r_f_f6_out),
						.freq7(r_f_f7_out));
	//TBD outputting mixture of frequency data from left and right channels for mixer
	
	//Instantiate time modules for left and right channels
	TimeMod TimeL(.audio_in(l_f_aud_out),.ready(ready),.clock(clock),
					  .reset(reset),.controls(t_controls),.audio_out(l_audio_out));
	TimeMod TimeR(.audio_in(r_f_aud_out),.ready(ready),.clock(clock),
					  .reset(reset),.controls(t_controls),.audio_out(r_audio_out));


endmodule
