module baoshi (clk,S_in,M_in,buzz);

input [6:0] S_in,M_in;
input clk;
output reg buzz;
integer count1,count2;
reg clk_1,clk_2;
//integer x;

always@ (posedge clk)
	begin
		if (count1 == 62500)//嘟
			begin
				count1 <= 0;
				clk_1 <= ~clk_1;
			end
		else count1 = count1 +  1;
	end
	
always@ (posedge clk)
	begin
		if (count2 == 50000 )//di
			begin
				count2 <= 0;
				clk_2 <= ~clk_2;
			end
		else count2 = count2 +  1;
	end

always@ (posedge clk)
	begin
		if(S_in == 50 && M_in ==59) buzz <= clk_2;
		else if(S_in == 52 && M_in ==59) buzz <= clk_2;
		else if(S_in == 54 && M_in ==59) buzz <= clk_2;
		else if(S_in == 56 && M_in ==59) buzz <= clk_2;
		else if(S_in == 58 && M_in ==59) buzz <= clk_2;
		else if(S_in == 0 && M_in ==0) buzz <= clk_1;
	end
endmodule 