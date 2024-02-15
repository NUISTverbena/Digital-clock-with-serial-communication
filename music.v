module music(
input key,
input clk,
output reg beep
);
//key is blongs to music_out
/*parameter do = 47774;
parameter ri = 42568;
parameter mi = 37919;
parameter fa = 35791;
parameter so = 31888;
parameter la = 28410;
parameter xi = 25309;*/
reg [15:0] cnt;
reg [15:0] prediv;
reg [12:0] delay;

initial begin
cnt = 16'd0;
prediv = 16'hBA9E;
delay = 13'd0;
end

always @(posedge clk) begin
if (key == 1'b0) begin
	beep <= 1'b0;
	delay <= 13'd0;
	cnt <= 16'd0;
	prediv <= 16'hBA9E;
end
else begin
	cnt <= cnt + 1'b1;
	if (cnt == prediv) begin
		beep <= ~beep;
		cnt <= 0;
		delay <= delay +1'b1;
		case(delay)
			13'd1000:prediv <= 16'hA648;
			13'd2000:prediv <= 16'h941F;
			13'd3000:prediv <= 16'h8BCF;
			13'd4000:prediv <= 16'h7C90;
			13'd5000:prediv <= 16'h6EFA;
			13'd6000:prediv <= 16'h62DD;
			13'd7000:begin
				prediv <= 16'hBA9E;
				delay <= 13'd0;
				end
			default : prediv <= prediv;
			endcase
	end
end 
end
endmodule
