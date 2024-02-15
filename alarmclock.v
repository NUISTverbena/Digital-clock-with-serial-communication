module alarmclock (clk,set_time,set_clock,set_calendar,reset,Less_in,Middle_in,Big_in,DIG,Digitron_Out,buzz,stop,clock,calendar,uart,uart_sign,uart_out);

input clk,reset,Less_in,Middle_in,Big_in,stop,uart,uart_sign;
//input [1:0]address;
input set_time,set_clock,set_calendar;
input clock,calendar;
output wire uart_out;
output [5:0]DIG;
output [7:0]Digitron_Out;
wire [6:0] Sec,Min,Hour,Sec_out,Min_out,Hour_out,Less_out,Middle_out,Big_out,Day,Month,Year;
wire sign_out;
wire pressa,pressb,pressc;
output buzz;
wire music_out;
wire beep1,beep2;
wire [2:0]out;
wire [6:0]Less_uart,Middle_uart,Big_uart;
wire [6:0]Less_clock_uart, Middle_clock_uart,Big_clock_uart,Less_cla_uart,Middle_cla_uart,Big_cla_uart,Less_ala_uart,Middle_ala_uart,Big_ala_uart;


clock U1 (clk,set_time,reset,pressa,pressb,pressc,Sec,Min,Hour,sign_out,Less_clock_uart,Middle_clock_uart,Big_clock_uart,uart_sign);
display U2 (clk,Less_out,Middle_out,Big_out,DIG,Digitron_Out);
keyunit U3 (clk,reset,Less_in,pressa);
keyunit U10 (clk,reset,Middle_in,pressb);
keyunit U11 (clk,reset,Big_in,pressc);
baoshi U4 (clk,Sec,Min,beep1);
claendar U5 (clk,pressa,pressb,pressc,Day,Month,Year,sign_out,reset,set_calendar,Less_cla_uart,Middle_cla_uart,Big_cla_uart,uart_sign);
alarm U7 (clk,set_clock,reset,Sec_out,Min_out,Hour_out,pressa,pressc,pressb,stop,Sec,Min,Hour,music_out,Less_ala_uart,Middle_ala_uart,Big_ala_uart,uart_sign);
music U6 (music_out,clk,beep2);
distributor U8 (clk,reset,Sec,Min,Hour,Day,Month,Year,Sec_out,Min_out,Hour_out,out,Less_out,Middle_out,Big_out);
choosedisplay U9 (clk,clock,calendar,set_time,set_clock,set_calendar,out,reset);
receive U12 (uart,clk,Less_uart,Middle_uart,Big_uart);
choosesend U13 (Less_uart,Middle_uart,Big_uart,set_time,set_clock,set_calendar,Less_clock_uart,Middle_clock_uart,Big_clock_uart,Less_cla_uart,Middle_cla_uart,Big_cla_uart,Less_ala_uart,Middle_ala_uart,Big_ala_uart);
send U14 (clk,Sec,Min,Hour,Day,Month,Year, uart_out);

assign buzz = (music_out ==1'b1)? beep2:beep1;


endmodule 