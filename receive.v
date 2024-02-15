module receive (
input uart,
input clk,
output reg [6:0]Less,
output reg [6:0]Middle,
output reg [6:0]Big
);

reg [47:0]led_out;
reg uart_d; //打一拍
integer x = 1'b 0;
reg clk_2 = 1'b0;//19200hz
integer cnt = 1'b0;//计时接收和输出
reg flag = 1'b0;

always@ (posedge clk) //19200赫兹分频器
begin

if (x == 2604) //产生一个clk周期的脉冲clk_2
begin
x <= 1'b0;
clk_2 <= 1'b1;
end

else 
begin
x <= x + 1;
clk_2 <= 1'b0;
end 
end 

always@ (posedge clk_2) //uart_d == 1 && uart == 0 开始计时 ,cnt为20进制
begin

uart_d <= uart;

if (uart_d == 1'b1 && uart == 1'b0)
begin 
flag <= 1'b1;
end 

else flag <= 1'b0;

if (flag==1'b1 && cnt == 1'b0)
begin
cnt <= cnt + 1;
end

else if (cnt >= 119) cnt <= 1'b0;

else if (cnt != 0 && cnt <= 118) cnt <= cnt + 1;

end

reg flag2 = 1'b0;//标志ASCII转8421BCD的开始

always@ (cnt)
begin

case (cnt)
0 : flag2 <= 1'b0; //flag清零表示一次转换完成

2 : led_out[47] <= uart;
4 : led_out[46] <= uart;
6 : led_out[45] <= uart;
8 : led_out[44] <= uart;
10 : led_out[43] <= uart;
12 : led_out[42] <= uart;
14 : led_out[41] <= uart;
16 : led_out[40] <= uart;

22 : led_out[39] <= uart;
24 : led_out[38] <= uart;
26 : led_out[37] <= uart;
28 : led_out[36] <= uart;
30 : led_out[35] <= uart;
32 : led_out[34] <= uart;
34 : led_out[33] <= uart;
36 : led_out[32] <= uart;

42 : led_out[31] <= uart;
44 : led_out[30] <= uart;
46 : led_out[29] <= uart;
48 : led_out[28] <= uart;
50 : led_out[27] <= uart;
52 : led_out[26] <= uart;
54 : led_out[25] <= uart;
56 : led_out[24] <= uart;

62 : led_out[23] <= uart;
64 : led_out[22] <= uart;
66 : led_out[21] <= uart;
68 : led_out[20] <= uart;
70 : led_out[19] <= uart;
72 : led_out[18] <= uart;
74 : led_out[17] <= uart;
76 : led_out[16] <= uart;

82 : led_out[15] <= uart;
84 : led_out[14] <= uart;
86 : led_out[13] <= uart;
88 : led_out[12] <= uart;
90 : led_out[11] <= uart;
92 : led_out[10] <= uart;
94 : led_out[9] <= uart;
96 : led_out[8] <= uart;

102 : led_out[7] <= uart;
104 : led_out[6] <= uart;
106 : led_out[5] <= uart;
108 : led_out[4] <= uart;
110 : led_out[3] <= uart;
112 : led_out[2] <= uart;
114 : led_out[1] <= uart;
116 : led_out[0] <= uart;
117 : flag2 <= 1'b1;
default ;
endcase;

end

always@ (posedge flag2)
begin
Big <= {led_out[44],led_out[45],led_out[46],led_out[47]}*10 + {led_out[36],led_out[37],led_out[38],led_out[39]};
Middle <= {led_out[28],led_out[29],led_out[30],led_out[31]}*10 + {led_out[20],led_out[21],led_out[22],led_out[23]};
Less <= {led_out[12],led_out[13],led_out[14],led_out[15]}*10 + {led_out[4],led_out[5],led_out[6],led_out[7]};
end

endmodule 