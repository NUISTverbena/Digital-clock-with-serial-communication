module send (
input clk,
input [6:0]Sec,
input [6:0]Min,
input [6:0]Hour,
input [6:0]Day,
input [6:0]Month,
inout [6:0]Year,
output  uart
);

//input [6:0]Sec,
//input [6:0]Min,
//input [6:0]Hour,
//input [6:0]Day,
//input [6:0]Month,
//inout [6:0]Year,都是两位数 由两位数转一位数后 进行8421BCD => ASCII

reg [169:0]remember = 170'b_0010011001_0000011001_0010011001_0001011001_0101101001_0000011001_0010011001_0101101001_0100011001_0101011001_0000001001_0010011001_0100011001_0010111001_0001011001_0101011001_0101100001;
integer x;
reg clk_2;
reg uart_wire;
reg [3:0] Min_low,Min_high,Hour_low,Hour_high,Day_low,Day_high,Month_low,Month_high,Year_low,Year_high;

always@ (posedge clk) //两位数转一位数，8421BCD => ASCII
begin
Min_low = Min%10;
Min_high = Min/10;
Hour_low = Hour%10;
Hour_high = Hour/10;
Day_low = Day%10;
Day_high = Day/10;
Month_low = Month%10;
Month_high = Month/10;
Year_low = Year%10;
Year_high = Year/10;

remember[148:145] <= {Year_high[0],Year_high[1],Year_high[2],Year_high[3]};
remember[138:135] <= {Year_low[0],Year_low[1],Year_low[2],Year_low[3]};
remember[118:115] <= {Month_high[0],Month_high[1],Month_high[2],Month_high[3]};
remember[108:105] <= {Month_low[0],Month_low[1],Month_low[2],Month_low[3]};
remember[88:85] <= {Day_high[0],Day_high[1],Day_high[2],Day_high[3]};
remember[78:75] <= {Day_low[0],Day_low[1],Day_low[2],Day_low[3]};
remember[58:55] <= {Hour_high[0],Hour_high[1],Hour_high[2],Hour_high[3]};
remember[48:45] <= {Hour_low[0],Hour_low[1],Hour_low[2],Hour_low[3]};
remember[28:25] <= {Min_high[0],Min_high[1],Min_high[2],Min_high[3]};
remember[18:15] <= {Min_low[0],Min_low[1],Min_low[2],Min_low[3]};

end


always@ (posedge clk) //9600hz分频器
begin
if (x == 5207)
begin
clk_2 <= 1'b1;
x <= 1'b0;
end 
else 
begin
clk_2 <= 1'b0;
x <= x + 1;
end
end

integer y = 339;
reg flag = 0; //只要输出一次

always@(posedge clk_2)
begin

if (Sec == 0) flag <= 0;

else if (y <= 0)
begin
y <= 339;
flag <= 1;
end

else if (y > 0 && flag == 0)
begin
y <= y - 1;
end

if (Sec == 0) uart_wire <= 1'b1;
else if(flag == 0 && y>169) uart_wire <= remember[y - 170];
else if (flag == 0 && y<=169) uart_wire <= remember[y];


end

assign uart =(y<=169)? uart_wire : 1'b1;

endmodule 



