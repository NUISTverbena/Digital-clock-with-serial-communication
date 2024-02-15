module keyunit (		
	input      clk   ,		  
	input      rstn  ,    
	input      key   ,      //按键信号
	output reg shape        //消抖信号
	);
	
//例化模块
//shake shake1(		
//	.clk   (clk  ),		  
//	.rstn  (rstn ),    
//	.key   (key  ),      
//	.shape (shape)  
//);
 
	parameter delay=999999; //20ms计数，仿真建议50
	reg [19:0]t20ms;
	reg       t    ;
	reg [ 1:0]cm   ;
 
	always@(posedge clk)    //按键信号延时一个时钟
		t <= key;
	wire thl = t&&(!key);    //t————|____key,下降沿
	wire tlh = (!t)&&key;    //t____|————key,上升沿
 
	always@(posedge clk or negedge rstn)
		begin
			if(!rstn)begin
				shape <= 0;
				t20ms <= 0;
				cm    <= 0;
			end else case(cm)
				0:begin
					if(thl)begin  //等待按键发生
						cm    <= 1;
						shape <= 0;
						t20ms <= 0;
					end else begin
						shape <= 0;
						t20ms <= 0;
						cm    <= 0;
					end 
				end
				1:begin
					if(t20ms == delay)begin    //20ms延时
						shape <= 0;
						t20ms <= 0;
						cm    <= 2;
					end else begin
						shape <= 0;
						t20ms <= t20ms+1;
						cm    <= 1;
					end
				end
				2:begin 
					if(tlh)begin  //等待按键松开
						shape <= 0;
						t20ms <= 0;
						cm    <= 3;
					end else begin
						shape <= 0;
						t20ms <= 0;
						cm    <= 2;
					end
				end
				3:begin
					if(t20ms == delay)begin    //20ms延时，同时给出消抖信号
						shape <= 1;
						t20ms <= 0;
						cm    <= 0;
					end else begin
						shape <= 0;
						t20ms <= t20ms+1;
						cm    <= 3;
					end
				end
				default:begin
					shape <= 0;
					t20ms <= 0;
					cm    <= 0;
				end
			endcase
		end
	
endmodule