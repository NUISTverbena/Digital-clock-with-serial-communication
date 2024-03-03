module display (clk,L,M,B,DIG,Digitron_Out,stop,in);

input stop;
input[2:0]in;
input clk;
input [6:0]L;
input [6:0]M;
input [6:0]B;
output reg [5:0]DIG = 6'b111110;
output reg [7:0]Digitron_Out;
integer x,count;
reg clk_out;

always@ (posedge clk)
begin

if (x == 25000)
begin
clk_out = ~clk_out;
x <= 0;
end

else x = x + 1;
end

always@ (posedge clk_out)  //扫频
begin
DIG = {DIG[0],DIG[5:1]};
end


always@ (posedge clk)
begin
if (L != 60 && !(stop ==0 && in == 3'b010))
begin
if (DIG[0]==0)
begin
count <= L%10;
case (count)

4'b0000 : {Digitron_Out[7:0]} = 8'b00111111;
4'b0001 : {Digitron_Out[7:0]} = 8'b00000110;
4'b0010 : {Digitron_Out[7:0]} = 8'b01011011;
4'b0011 : {Digitron_Out[7:0]} = 8'b01001111;
4'b0100 : {Digitron_Out[7:0]} = 8'b01100110;
4'b0101 : {Digitron_Out[7:0]} = 8'b01101101;
4'b0110 : {Digitron_Out[7:0]} = 8'b01111101;
4'b0111 : {Digitron_Out[7:0]} = 8'b00000111;
4'b1000 : {Digitron_Out[7:0]} = 8'b01111111;
4'b1001 : {Digitron_Out[7:0]} = 8'b01101111;
default;
endcase
end

else if (DIG[1]==0)
begin
count <= L/10;
case (count)

4'b0000 : {Digitron_Out[7:0]} = 8'b00111111;
4'b0001 : {Digitron_Out[7:0]} = 8'b00000110;
4'b0010 : {Digitron_Out[7:0]} = 8'b01011011;
4'b0011 : {Digitron_Out[7:0]} = 8'b01001111;
4'b0100 : {Digitron_Out[7:0]} = 8'b01100110;
4'b0101 : {Digitron_Out[7:0]} = 8'b01101101;
4'b0110 : {Digitron_Out[7:0]} = 8'b01111101;
4'b0111 : {Digitron_Out[7:0]} = 8'b00000111;
4'b1000 : {Digitron_Out[7:0]} = 8'b01111111;
4'b1001 : {Digitron_Out[7:0]} = 8'b01101111;
default;
endcase
end

else if (DIG[2]==0)
begin
count <= M%10;
case (count)

4'b0000 : {Digitron_Out[7:0]} = 8'b10111111;
4'b0001 : {Digitron_Out[7:0]} = 8'b10000110;
4'b0010 : {Digitron_Out[7:0]} = 8'b11011011;
4'b0011 : {Digitron_Out[7:0]} = 8'b11001111;
4'b0100 : {Digitron_Out[7:0]} = 8'b11100110;
4'b0101 : {Digitron_Out[7:0]} = 8'b11101101;
4'b0110 : {Digitron_Out[7:0]} = 8'b11111101;
4'b0111 : {Digitron_Out[7:0]} = 8'b10000111;
4'b1000 : {Digitron_Out[7:0]} = 8'b11111111;
4'b1001 : {Digitron_Out[7:0]} = 8'b11101111;
default;
endcase
end


else if (DIG[3]==0)
begin
count <= M/10;
case (count)

4'b0000 : {Digitron_Out[7:0]} = 8'b00111111;
4'b0001 : {Digitron_Out[7:0]} = 8'b00000110;
4'b0010 : {Digitron_Out[7:0]} = 8'b01011011;
4'b0011 : {Digitron_Out[7:0]} = 8'b01001111;
4'b0100 : {Digitron_Out[7:0]} = 8'b01100110;
4'b0101 : {Digitron_Out[7:0]} = 8'b01101101;
4'b0110 : {Digitron_Out[7:0]} = 8'b01111101;
4'b0111 : {Digitron_Out[7:0]} = 8'b00000111;
4'b1000 : {Digitron_Out[7:0]} = 8'b01111111;
4'b1001 : {Digitron_Out[7:0]} = 8'b01101111;
default;
endcase
end


else if (DIG[4]==0)
begin
count <= B%10;
case (count)

4'b0000 : {Digitron_Out[7:0]} = 8'b10111111;
4'b0001 : {Digitron_Out[7:0]} = 8'b10000110;
4'b0010 : {Digitron_Out[7:0]} = 8'b11011011;
4'b0011 : {Digitron_Out[7:0]} = 8'b11001111;
4'b0100 : {Digitron_Out[7:0]} = 8'b11100110;
4'b0101 : {Digitron_Out[7:0]} = 8'b11101101;
4'b0110 : {Digitron_Out[7:0]} = 8'b11111101;
4'b0111 : {Digitron_Out[7:0]} = 8'b10000111;
4'b1000 : {Digitron_Out[7:0]} = 8'b11111111;
4'b1001 : {Digitron_Out[7:0]} = 8'b11101111;
default;
endcase
end


else if (DIG[5]==0)
begin
count <= B/10;
case (count)

4'b0000 : {Digitron_Out[7:0]} = 8'b00111111;
4'b0001 : {Digitron_Out[7:0]} = 8'b00000110;
4'b0010 : {Digitron_Out[7:0]} = 8'b01011011;
4'b0011 : {Digitron_Out[7:0]} = 8'b01001111;
4'b0100 : {Digitron_Out[7:0]} = 8'b01100110;
4'b0101 : {Digitron_Out[7:0]} = 8'b01101101;
4'b0110 : {Digitron_Out[7:0]} = 8'b01111101;
4'b0111 : {Digitron_Out[7:0]} = 8'b00000111;
4'b1000 : {Digitron_Out[7:0]} = 8'b01111111;
4'b1001 : {Digitron_Out[7:0]} = 8'b01101111;
default;
endcase
end
end


else if (L == 60|| (stop ==0 && in == 3'b010)) //闹钟阶段的清零
begin
Digitron_Out <= 8'b01000000;
end
end

endmodule 