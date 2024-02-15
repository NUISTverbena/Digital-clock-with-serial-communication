module choosedisplay (clk,clock,calendar,set_time,set_clock,set_calendar,out,reset);

input clk,clock,calendar,set_time,set_clock,set_calendar,reset;
output reg [2:0]out;
integer x=1'b0;
reg clk2=1'b0;
reg flag = 1'b0;

always@ (posedge clk,negedge reset)
begin

if (!reset)
begin
flag = 1'b0;
x = 1'b0;
end

else if (flag == 1'b1)
begin
clk2 <= 1'b1;
x = x + 1;
if (x == 32'd150000000)
begin
flag = 1'b0;
x = 1'b0;
end
end

else if (calendar == 1'b0)
begin
out <= 3'b100;
flag <= 1'b1;
end

else if (clock == 1'b0)
begin
out <= 3'b010;
flag <= 1'b1;
end



else if (set_time == 1'b1) out <= 3'b000;
else if (set_calendar == 1'b1) out <= 3'b100;
else if (set_clock == 1'b1) out <= 3'b010;

else
begin
out <= 3'b000;
flag <= 1'b0;
end

end 


endmodule 