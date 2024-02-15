module claendar (clk,Less,Middle,Big,Day,Month,Year,sign_in,reset,set,Less_uart,Middle_uart,Big_uart,uart_sign);

input clk,Less,Middle,Big,sign_in,reset,set,uart_sign;
input [6:0]Less_uart,Middle_uart,Big_uart;
output reg [6:0]Year = 5'd24;
output reg [6:0]Day = 5'd2;
output reg [6:0]Month = 5'd2;
integer x=0;
wire sign2;
reg flag = 1'b0;
integer y = 0;


always@ (posedge clk)
begin


if (sign_in == 1'b1 && flag == 0)
begin
x <= 1'b1;
flag <= 1'b1;
end

else if (sign_in == 1'b1 && flag == 1) x <= 1'b0;

else if (sign_in == 1'b0 && flag == 1) flag <= 1'b0;

end

assign sign2 = x;

always@ (posedge clk)
begin

case (Month)
7'd1 : y = 1;
7'd2 : begin if (Year % 4 == 0)y = 2;else y=3; end
7'd3 : y = 1;
7'd4 : y = 4;
7'd5 : y = 1;
7'd6 : y = 4;
7'd7 : y = 1;
7'd8 : y = 1;
7'd9 : y = 4;
7'd10 : y = 1;
7'd11  : y = 4;
7'd12 : y = 1;
default y = 0;
endcase
end

always@(posedge clk,negedge reset)
begin

if (!reset)
begin
Year = 7'd24;
Day = 7'd2;
Month = 7'd2;
end

else if (set == 1 && uart_sign == 0)
begin

if (Less == 1'b1 && Middle == 1'b0 && Big == 1'b0)
begin
if (Day >= 30 && y==4) Day <= 1;
else if (Day >=31 && y==1) Day <= 1;
else if (Day >= 28 && y==3) Day <= 1;
else if (Day >= 29 && y==2) Day <= 1;
else Day <= Day + 1;
end

else if (Less == 1'b0 && Middle == 1'b1 && Big == 1'b0)
begin
if (Month >= 12)
begin
Month <= 7'd1;
end
else Month <= Month + 1;
end

else if (Less == 1'b0 && Middle ==1'b0 && Big == 1'b1) Year <= Year + 1;

end

else if (set == 1 && uart_sign == 1)
begin
Day <= Less_uart;
Month <= Middle_uart;
Year <= Big_uart;
end


else if (sign2 == 1)
begin

if (Day >= 30 && y==4) 
begin
Day <= 1;
Month <= Month + 1;
end

else if (Day >=31 && y==1) 
begin
Day <= 1;
Month <= Month +1;
end

else if (Day >= 28 && y==3)
begin
Day <= 1;
Month <= Month +1;
end

else if (Day >= 29 && y==2) 
begin
Day <= 1;
Month <= Month +1;
end

else if (Month >12)
begin
Year <= Year + 1;
Month <= 1'b1;
end

else Day <= Day + 1;

end
end
endmodule