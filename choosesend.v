module choosesend (
input [6:0]Less,
input [6:0]Middle,
input [6:0]Big,
input set_clock,
input set_ala,
input set_cla,
output reg [6:0]Less_clock,
output reg [6:0]Middle_clock,
output reg [6:0]Big_clock,
output reg [6:0]Less_cla,
output reg [6:0]Middle_cla,
output reg [6:0]Big_cla,
output reg [6:0]Less_ala,
output reg [6:0]Middle_ala,
output reg [6:0]Big_ala
);

always@(*)
begin

if (set_clock == 1 && set_ala == 0 && set_cla == 0)
begin
Less_clock <= Less;
Middle_clock <= Middle;
Big_clock <= Big;
end

else if (set_clock == 0 && set_ala == 1 && set_cla == 0)
begin
Less_ala <= Less;
Middle_ala <= Middle;
Big_ala <= Big;
end

else if (set_clock == 0 && set_ala == 0 && set_cla == 1)
begin
Less_cla <= Less;
Middle_cla <= Middle;
Big_cla <= Big;
end

end

endmodule 