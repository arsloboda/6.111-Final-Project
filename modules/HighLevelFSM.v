`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:08 11/09/2015 
// Design Name: 
// Module Name:    HighLevelFSM 
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
module HighLevelFSM(
    input clock,
    input reset,
    input [14:0] controls,
    output [7:0] f_controls,
    output [7:0] t_controls,
    output [7:0] m_controls,
    output [7:0] v_controls
    );
	//TBD :P, based off state, change which control signals are affected by inputs

endmodule
