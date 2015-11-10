
// TODO: implement all coeffs. into ROM
// TODO: figure out where my first bit disappears to!!! (tested w/ impulse)
// TODO: understand why FIR filters aren't as precise as I expected


// input 8 MSBs of audio signal
// output 18 bits because scaled by 2**10 (18 bits) :)

module fir31( // DEFINITELY need 27 MHz clock to handle 48 kHz, and be able to handle each new sample in our own project
  input wire clock,reset,ready,
  input wire signed [9:0] coeff,
  input wire signed [7:0] x,
  output reg signed [17:0] y
);

	reg signed [17:0] accumulator; 
	reg signed [7:0] sample [31:0];  // 32 element array each 8 bits wide
	reg [4:0] offset = 0; // increment offset with each sample to always point to the newest sample
	reg [4:0] index = 0;
	reg active = 0; // boolean: actively performing FIR filter computations
	reg done = 0;
	// carefully chose sample width, offset, & index to be powers of 2 to handle circular counting
	//wire signed [9:0] coeff;
	//coeffs31 coeffs(.index(index),.coeff(coeff));
	
	always @(posedge clock) begin
		//if (ready) y <= {x,10'd0};
		if (reset == 1) begin
			accumulator <= 0;
			sample[0] <= 0;
			sample[1] <= 0;
			sample[2] <= 0;
			sample[3] <= 0;
			sample[4] <= 0;
			sample[5] <= 0;
			sample[6] <= 0;
			sample[7] <= 0;
			sample[8] <= 0;
			sample[9] <= 0;
			sample[10] <= 0;
			sample[11] <= 0;
			sample[12] <= 0;
			sample[13] <= 0;
			sample[14] <= 0;
			sample[15] <= 0;
			sample[16] <= 0;
			sample[17] <= 0;
			sample[18] <= 0;
			sample[19] <= 0;
			sample[20] <= 0;
			sample[21] <= 0;
			sample[22] <= 0;
			sample[23] <= 0;
			sample[24] <= 0;
			sample[25] <= 0;
			sample[26] <= 0;
			sample[27] <= 0;
			sample[28] <= 0;
			sample[29] <= 0;
			sample[30] <= 0;
			sample[31] <= 0;
			active <= 0;
			done <= 0;
			y <= 0;
		end
		if (ready == 1) begin //essentially, reset accumulator to begin calculations
			accumulator <= 0;
			offset <= offset +1; 
			index <= 0;
			active <= 1;
			done <= 0;
			sample[offset] <= x;
			// need to rotate through pointer in sample reg to pick appropriate sample to add
		end
		
		if (active == 1) begin // perform filter multiplication and addition over 32 cycles
			accumulator <= accumulator + coeff*sample[offset-index]; // delay 1
			index <= index + 1;
			if (index == 31) begin
				active <= 0;
				y <= accumulator;
				done <= 1;
			end
		end
		
	end
endmodule

module coeffs31(
  input wire [4:0] index,
  output reg signed [9:0] coeff
);
  // tools will turn this into a 31x10 ROM
  always @(index)
    case (index)
      5'd0:  coeff = -10'sd1;
      5'd1:  coeff = -10'sd1;
      5'd2:  coeff = -10'sd3;
      5'd3:  coeff = -10'sd5;
      5'd4:  coeff = -10'sd6;
      5'd5:  coeff = -10'sd7;
      5'd6:  coeff = -10'sd5;
      5'd7:  coeff = 10'sd0;
      5'd8:  coeff = 10'sd10;
      5'd9:  coeff = 10'sd26;
      5'd10: coeff = 10'sd46;
      5'd11: coeff = 10'sd69;
      5'd12: coeff = 10'sd91;
      5'd13: coeff = 10'sd110;
      5'd14: coeff = 10'sd123;
      5'd15: coeff = 10'sd128;
      5'd16: coeff = 10'sd123;
      5'd17: coeff = 10'sd110;
      5'd18: coeff = 10'sd91;
      5'd19: coeff = 10'sd69;
      5'd20: coeff = 10'sd46;
      5'd21: coeff = 10'sd26;
      5'd22: coeff = 10'sd10;
      5'd23: coeff = 10'sd0;
      5'd24: coeff = -10'sd5;
      5'd25: coeff = -10'sd7;
      5'd26: coeff = -10'sd6;
      5'd27: coeff = -10'sd5;
      5'd28: coeff = -10'sd3;
      5'd29: coeff = -10'sd1;
      5'd30: coeff = -10'sd1;
      default: coeff = 10'hXXX;
    endcase
endmodule


module coeffs_below80Hz(
  input wire [4:0] index,
  output reg signed [9:0] coeff
);
  // tools will turn this into a 31x10 ROM
  always @(index)
    case (index)
      5'd0:  coeff = 10'sd5;
      5'd1:  coeff = 10'sd6;
      5'd2:  coeff = 10'sd8;
      5'd3:  coeff = 10'sd11;
      5'd4:  coeff = 10'sd15;
      5'd5:  coeff = 10'sd19;
      5'd6:  coeff = 10'sd25;
      5'd7:  coeff = 10'sd31;
      5'd8:  coeff = 10'sd37;
      5'd9:  coeff = 10'sd43;
      5'd10: coeff = 10'sd48;
      5'd11: coeff = 10'sd53;
      5'd12: coeff = 10'sd57;
      5'd13: coeff = 10'sd60;
      5'd14: coeff = 10'sd62;
      5'd15: coeff = 10'sd63;
      5'd16: coeff = 10'sd62;
      5'd17: coeff = 10'sd60;
      5'd18: coeff = 10'sd57;
      5'd19: coeff = 10'sd53;
      5'd20: coeff = 10'sd48;
      5'd21: coeff = 10'sd43;
      5'd22: coeff = 10'sd37;
      5'd23: coeff = 10'sd31;
      5'd24: coeff = 10'sd25;
      5'd25: coeff = 10'sd19;
      5'd26: coeff = 10'sd15;
      5'd27: coeff = 10'sd11;
      5'd28: coeff = 10'sd8;
      5'd29: coeff = 10'sd6;
      5'd30: coeff = 10'sd5;
      default: coeff = 10'hXXX;
    endcase
endmodule