module chooseset (set_clock,set_calendar,set_alarm,L1,M1,B1,L2,M2,B2,L3,M3,B3,Less,Middle,Big);

input set_clock,set_calendar,set_alarm,Less,Middle,Big;
output reg L1,M1,B1,L2,M2,B2,L3,M3,B3;

always@(*)
begin

if (set_clock == 1'b1 && set_alarm == 1'b0 && set_calendar == 1'b0)
begin

L1 <= Less;
M1 <= Middle;
B1 <= Big;
L2 <= 1'b0;
M2 <= 1'b0;
B2 <= 1'b0;
L3 <= 1'b0;
M3 <= 1'b0;
B3 <= 1'b0;

end

else if (set_clock == 1'b0 && set_alarm == 1'b0 && set_calendar == 1'b1)
begin

L1 <= 1'b0;
M1 <= 1'b0;
B1 <= 1'b0;
L2 <= 1'b0;
M2 <= 1'b0;
B2 <= 1'b0;
L3 <= Less;
M3 <= Middle;
B3 <= Big;

end

else if (set_clock == 1'b0 && set_alarm == 1'b1 && set_calendar == 1'b0)
begin

L1 <= 1'b0;
M1 <= 1'b0;
B1 <= 1'b0;
L2 <= Less;
M2 <= Middle;
B2 <= Big;
L3 <= 1'b0;
M3 <= 1'b0;
B3 <= 1'b0;

end
end

endmodule
