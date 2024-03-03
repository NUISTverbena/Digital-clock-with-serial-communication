module music (
  input key,
  input clk,
  output reg beep
);

  parameter C4 = 262;
  parameter D4 = 294;
  parameter E4 = 330;
  parameter F4 = 349;
  parameter G4 = 392;
  parameter A4 = 440;
  parameter B4 = 494;
  parameter C5 = 523;
  parameter D5 = 587;
  parameter E5 = 659;
  parameter F5 = 698;
  parameter G5 = 784;
  parameter A5 = 880;
  parameter B5 = 988;
  parameter C6 = 1047;
  parameter D6 = 1175;
  parameter E6 = 1319;
  parameter F6 = 1397;
  parameter G6 = 1568;
  parameter A6 = 1760;
  parameter B6 = 1976;
  parameter C7 = 2093;
  parameter D7 = 2349;
  parameter E7 = 2637;
  parameter F7 = 2794;
  parameter G7 = 3136;
  parameter A7 = 3520;
  parameter B7 = 3951;
  parameter D8 = 4699;
  parameter E8 = 5274;
  parameter C8 = 4186;
  parameter F8 = 5588;
  parameter R = 0;

  parameter WHOLE = 50000000 / 4;
  parameter HALF = WHOLE / 2;
  parameter QUARTER = HALF / 2;
  parameter EIGHTH = QUARTER / 2;
  parameter SIXTEENTH = EIGHTH / 2;
  parameter THIRTYSECOND = SIXTEENTH / 2;

  reg [31:0] clk2 = 32'h00000000;
  reg quarter = 1'b0;
  integer counter2 = 0;
  integer count1,count2,count3,count4,count5,count6,count7,count8,count9,count10,count11,count12,count13,count14,count15,count16,count17,count18,count19,count20,count21,count0,count22,count23,count24,count25,count26,count27,count28,count29,count30,count31;

  
  always@ (posedge clk) //生成音符频率
	begin
		if (count0 == 25000000/C4-1) begin clk2[0] <= ~clk2[0]; count0 = 14'b0;end
		else count0 = count0+ 1'b1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count1 == 25000000/D4-1)  begin clk2[1] <= ~clk2[1]; count1= 1'b0;end
		else count1 = count1 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count2 == 25000000/E4-1) begin clk2[2] <= ~clk2[2]; count2 = 1'b0;end
		else count2 = count2 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count3 == 25000000/F4-1) begin clk2[3] <= ~clk2[3]; count3 = 1'b0;end
		else count3 = count3 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count4 == 25000000/G4-1) begin clk2[4] <= ~clk2[4]; count4 = 1'b0;end
		else count4 = count4 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count5 == 25000000/A4-1) begin clk2[5] <= ~clk2[5]; count5 = 1'b0;end
		else count5 = count5 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count6 == 25000000/B4-1) begin clk2[6] <= ~clk2[6]; count6 = 1'b0;end
		else count6 = count6 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count7 == 25000000/C5-1) begin clk2[7] <= ~clk2[7]; count7 = 1'b0;end
		else count7 = count7 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count8 == 25000000/D5-1) begin clk2[8] <= ~clk2[8]; count8 = 1'b0;end
		else count8 = count8 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count9 == 25000000/E5-1) begin clk2[9] <= ~clk2[9]; count9 = 1'b0;end
		else count9 = count9 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count10 == 25000000/F5-1) begin clk2[10] <= ~clk2[10]; count10 = 1'b0;end
		else count10 = count10 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count11 == 25000000/G5-1) begin clk2[11] <= ~clk2[11]; count11 = 1'b0;end
		else count11 = count11 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count12 == 25000000/A5-1)  begin clk2[12] <= ~clk2[12]; count12 = 1'b0;end
		else count12= count12 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count13 == 25000000/B5-1) begin clk2[13] <= ~clk2[13]; count13 = 1'b0;end
		else count13 = count13 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count14 == 25000000/C6-1) begin clk2[14] <= ~clk2[14]; count14 = 1'b0;end
		else count14 = count14 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count15 == 25000000/D6-1) begin clk2[15] <= ~clk2[15]; count15 = 1'b0;end
		else count15 = count15 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count16 == 25000000/E6-1) begin clk2[16] <= ~clk2[16]; count16 = 1'b0;end
		else count16 = count16 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count17 == 25000000/F6-1) begin clk2[17] <= ~clk2[17]; count17 = 1'b0;end
		else count17 = count17 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count18 == 25000000/G6-1) begin clk2[18] <= ~clk2[18]; count18 = 1'b0;end
		else count18 = count18 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count19 == 25000000/A6-1) begin clk2[19] <= ~clk2[19]; count19 = 1'b0;end
		else count19 = count19 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count20 == 25000000/B6-1) begin clk2[20] <= ~clk2[20]; count20 = 1'b0;end
		else count20 = count20 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count21 == 25000000/C7-1) begin clk2[21] <= ~clk2[21]; count21 = 1'b0;end
		else count21 = count21 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count22 == 25000000/D7-1) begin clk2[22] <= ~clk2[22]; count22 = 1'b0;end
		else count22 = count22 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count23 == 25000000/E7-1) begin clk2[23] <= ~clk2[23]; count23 = 1'b0;end
		else count23 = count23 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count24 == 25000000/F7-1) begin clk2[24] <= ~clk2[24]; count24 = 1'b0;end
		else count24 = count24 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count25 == 25000000/G7-1) begin clk2[25] <= ~clk2[25]; count25 = 1'b0;end
		else count25 = count25 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count26 == 25000000/A7-1) begin clk2[26] <= ~clk2[26]; count26 = 1'b0;end
		else count26 = count26 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count27 == 25000000/B7-1) begin clk2[27] <= ~clk2[27]; count27 = 1'b0;end
		else count27 = count27 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count28 == 25000000/D8-1) begin clk2[28] <= ~clk2[28]; count28 = 1'b0;end
		else count28 = count28 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count29 == 25000000/E8-1) begin clk2[29] <= ~clk2[29]; count29 = 1'b0;end
		else count29 = count29 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count30 == 25000000/C8-1) begin clk2[30] <= ~clk2[30]; count30 = 1'b0;end
		else count30 = count30 + 1;
	end
	
	always@ (posedge clk) //生成音符频率
	begin
		if (count31 == 25000000/F8-1) begin clk2[31] <= ~clk2[31]; count31 = 1'b0;end
		else count31 = count31 + 1;
	end
	

  
  
  always@ (posedge clk) //生成QUARTER频率来驱动音符运行
	begin 
		if (counter2 == 27472528)  //清零
			begin
				counter2 = 0;
				quarter = 1'b1;
			end
		else
			begin
				counter2 = counter2 + 1;
				quarter = 1'b0;
			end
	end
  
  integer flag = 97;
  
	always@ (posedge quarter)
		begin
			
			if (flag <= 0)  flag <= 97;
			else if (key == 1'b0) flag <= 97;
			else flag <= flag - 1;
			
		end
			
			
	always@ (posedge clk)
		begin
		if(key == 1'b1)begin
			case (flag)
				96 : beep <= clk2 [9];
				95 : beep <= clk2[11];
				94 : beep <= clk2[14];
				93 : beep <= clk2[16];
				92 : beep <= clk2[16];
				91 : beep <= clk2[16];
				90 : beep <= clk2[16];
				89 : beep <= clk2[17];
				88 : beep <= clk2[15];
				87 : beep <= clk2[15];
				86 : beep <= clk2[15];
				85 : beep <= clk2[15];
				84 : beep <= 0;
				83 : beep <= clk2[15];
				82 : beep <= clk2[15];
				81 : beep <= clk2[18];
				80 : beep <= clk2[13];
				79 : beep <= clk2[14];
				78 : beep <= clk2[14];
				77 : beep <= clk2[14];
				76 : beep <= clk2[14];
				75 : beep <= clk2[16];
				74 : beep <= clk2[17];
				73 : beep <= clk2[18];
				72 : beep <= clk2[14];
				71 : beep <= clk2[14];
				70 : beep <= clk2[14];
				69 : beep <= clk2[15];
				68 : beep <= clk2[15];
				67 : beep <= clk2[16];
				66 : beep <= clk2[16];
				65 : beep <= clk2[16];
				64 : beep <= clk2[16];
				63 : beep <= clk2[9];
				62 : beep <= clk2[11];
				61 : beep <= clk2[14];
				60 : beep <= clk2[16];
				59 : beep <= clk2[16];
				58 : beep <= clk2[16];
				57 : beep <= clk2[16];
				56 : beep <= clk2[17];
				55 : beep <= clk2[15];
				54 : beep <= clk2[15];
				53 : beep <= clk2[15];
				52 : beep <= clk2[15];
				51 : beep <= clk2[15];
				50 : beep <= clk2[15];
				49 : beep <= clk2[18];
				48 : beep <= clk2[13];
				47 : beep <= clk2[14];
				46 : beep <= clk2[14];
				45 : beep <= clk2[14];
				44 : beep <= clk2[14];
				43 : beep <= clk2[16];
				42 : beep <= clk2[17];
				41 : beep <= clk2[18];
				40 : beep <= clk2[14];
				39 : beep <= clk2[14];
				38 : beep <= clk2[14];
				37 : beep <= clk2[15];
				36 : beep <= clk2[15];
				35 : beep <= clk2[14];
				34 : beep <= clk2[14];
				33 : beep <= clk2[8];
				32 : beep <= clk2[10];
				31 : beep <= clk2[9];
				30 : beep <= clk2[9];
				29 : beep <= clk2[10];
				28 : beep <= clk2[11];
				27 : beep <= clk2[11];
				26 : beep <= clk2[11];
				25 : beep <= clk2[11];
				24 : beep <= clk2[11];
				23 : beep <= clk2[11];
				22 : beep <= clk2[12];
				21 : beep <= clk2[13];
				20 : beep <= clk2[14];
				19 : beep <= clk2[14];
				18 : beep <= clk2[14];
				17 : beep <= clk2[14];
				16 : beep <= clk2[14];  
				15 : beep <= clk2[14];
				14 : beep <= clk2[13];
				13 : beep <= clk2[15];
				12 : beep <= clk2[12];
				11 : beep <= clk2[12];
				10 : beep <= clk2[11];
				9  : beep <= clk2[11];
				8  : beep <= clk2[15];
				7  : beep <= clk2[15];
				6  : beep <= clk2[14];
				5  : beep <= clk2[16];
				4  : beep <= clk2[16];
				3  : beep <= clk2[16];
				2  : beep <= clk2[16];
				1  : beep <= clk2[16];
				0  : beep <= clk2[16];
				default;
				endcase 
		end
		end
			
			
			
			
 
  endmodule 