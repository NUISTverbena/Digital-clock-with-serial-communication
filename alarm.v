module alarm (clk,set,reset,Sec,Min,Hour,Less_in,Big_in,Middle_in,stop,Sec_in,Min_in,Hour_in,music_out,Less_uart,Middle_uart,Big_uart,uart_sign);

input [6:0]Sec_in,Min_in,Hour_in,uart_sign;
input set,reset,Less_in,Big_in,Middle_in,clk,stop;
input [6:0] Less_uart,Middle_uart,Big_uart;
output reg [6:0]Sec = 6'd60;
output reg [6:0]Min = 6'd59;
output reg [6:0]Hour = 6'd23;
reg flag = 1'b1;
output reg music_out;

always@ (posedge clk,negedge reset)//the reset and fix the alarm time
begin

if(!reset)
begin
Sec <= 6'd60;
Min <= 6'd59;
Hour <= 6'd23;
end

else if (set == 1 && uart_sign == 0)
begin
if (Less_in == 1'b1 && Middle_in == 1'b0 && Big_in == 1'b0)
begin
if (Sec >= 6'd59) Sec = 6'd0;
else Sec = Sec + 1;
end

else if (Less_in == 1'b0 && Middle_in == 1'b1 && Big_in == 1'b0)
begin
if (Min >= 6'd59) Min = 6'd0;
else Min = Min + 1;
end

else if (Less_in == 1'b0 && Middle_in == 1'b0 && Big_in == 1'b1)
begin
if (Hour >= 6'd23) Hour = 6'd0;
else Hour = Hour + 1;
end

end

else if (set == 1 && uart_sign == 1)
begin
Sec <= Less_uart;
Min <= Middle_uart;
Hour <=Big_uart;
end 

end

always@(posedge clk , negedge stop)
begin

if (!stop)
begin
music_out <= 1'b0;
end

else if(Sec === Sec_in && Min === Min_in && Hour === Hour_in)
begin
music_out <= 1'b1;
end

end
endmodule