module clock (clk,set,reset,Less_in,Middle_in,Big_in,Sec,Min,Hour,sign_out,Less_uart,Middle_uart,Big_uart,uart_sign);

input set,reset,Less_in,Middle_in,Big_in,clk,uart_sign;
output reg sign_out;
output reg [6:0]Sec = 5'd58;
output reg [6:0] Min = 5'd58;
output reg [6:0] Hour = 5'd23;
input [6:0]Less_uart,Middle_uart,Big_uart;
integer count;
wire flag;
reg clk2 = 1'b0;
reg count2 = 1'b0;

always@ (posedge clk,negedge reset)
begin
if (!reset)
begin
count = 1'b0;
end

else
begin
if (count == 50000000)
begin
count <= 1'b0;
clk2 <= 1'b1;
end
else 
begin
count <= count + 1;
clk2 <= 1'b0;
end
end
end 

assign flag = clk2;

always@ (posedge clk , negedge reset)
begin
if (!reset)
begin
Sec <= 6'd58;
Min <= 6'd58;
Hour <= 6'd23;
end

else if (flag && !set)
begin
if(Sec == 59 && Min != 59 && Hour <=23) // 秒进位
begin 
Min <= Min + 1;
Sec <= 0;
end

else if (Hour == 23 && Min == 59 && Sec == 59 ) // 时进位
begin
Hour <= 0;
Min <= 0;
Sec <= 0;
sign_out <= 1'b1;
end

else if (Hour < 23 && Min == 59 && Sec == 59 ) // 分进位
begin
Hour <= Hour + 1 ;// 将H_o的赋值语句改为对H_o_temp的赋值
Min <= 0;
Sec <= 0;
end

 // 将H_o的赋值语句改为对H_o_temp的赋值
//sign_out <= ~sign_out; // 切换上下午标志

else // 正常计时
begin
Sec <= Sec + 1;
sign_out <= 1'b0;
end
end

else if(set && !uart_sign)
begin
if(Less_in == 1'b1 && Middle_in == 1'b0 && Big_in == 1'b0)
begin
if(Sec == 59) Sec <= 6'b0;
else Sec = Sec + 1;
end

else if(Less_in == 1'b0 && Middle_in == 1'b1 && Big_in == 1'b0)
begin
if(Min == 59) Min <= 6'b0;
else Min = Min + 1;
end

else if(Less_in == 1'b0 && Middle_in == 1'b0 && Big_in == 1'b1)
begin
if(Hour == 23) Hour <= 6'b0;
else Hour = Hour + 1;
end

end

else if (set && uart_sign)
begin
Sec <= Less_uart;
Min <= Middle_uart;
Hour <= Big_uart;
end

end

/*always@ (posedge clk,negedge reset)
begin

if (!reset) begin sign_out <= 1'b0 ; end
else if (Hour < 23 && Min == 59 && Sec == 59 ) sign_out <= 1'b1;
else sign_out <= 1'b0;

end*/

endmodule 