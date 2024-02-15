module distributor (clk,reset,Less_clock,Middle_clock,Big_clock,Less_cla,Middle_cla,Big_cla,Less_ala,Middle_ala,Big_ala,address,Less_out,Middle_out,Big_out);

input reset,clk;
input [6:0] Less_clock,Middle_clock,Big_clock,Less_cla,Middle_cla,Big_cla,Less_ala,Middle_ala,Big_ala;
output reg [6:0] Less_out,Middle_out,Big_out;
input [2:0]address;

always@ (posedge clk)
begin

if (address == 3'b000)
begin

Less_out <= Less_clock;
Middle_out <= Middle_clock;
Big_out <= Big_clock;

end 

else if (address == 3'b010)
begin

Less_out <= Less_ala;
Middle_out <= Middle_ala;
Big_out <= Big_ala;

end 


else if (address == 3'b100)
begin

Less_out <= Less_cla;
Middle_out <= Middle_cla;
Big_out <= Big_cla;

end 
end 
endmodule 