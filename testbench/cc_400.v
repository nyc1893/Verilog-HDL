module cc_400(
clk,
rst_n,
num_random,//test port
num,//num out
start,
read_out,
state,
o_selectable1,
o_selectable2,
wren
);
input clk;
input rst_n;

input read_out;
input start;
output [7:0]num;
output [7:0] o_selectable1,o_selectable2;


output [7:0]num_random;
/*
output [6:0]wr_addr,rd_addr;
*/
reg [7:0]rand_num;
reg [10:0]CLK_DIV;
reg [7:0]r_select,r_selectable1,r_selectable2;
reg [6:0]wr_cnt,rd_cnt,gen_cnt;
reg pre_read_out,pre_start,wr,CTRL_CLK;
reg [7:0]r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;
reg [7:0]r11,r12,r13,r14,r15,r16,r17,r18,r19,r20;
reg [7:0]r21,r22,r23,r24,r25,r26,r27,r28,r29,r30;
reg [7:0]r31,r32,r33,r34,r35,r36,r37,r38,r39,r40;

assign rr1=r1|r2|r3|r4|r5|r6|r7|r8|r9|r10;
assign rr2=r11|r12|r13|r14|r15|r16|r17|r18|r19|r20;
assign rr3=r21|r22|r23|r24|r25|r26|r27|r28|r29|r30;
assign rr4=r31|r32|r33|r34|r35|r36|r37|r38|r39|r40;


output[7:0] wren;
assign wren=rr1;
output reg state;
assign num=r_select; /*send to the ram and restored*/
assign num_random=rand_num;
assign o_selectable1=r_selectable1;

assign o_selectable2=r_selectable2;

//wire [6:0]wr_addr,rd_addr;
assign  wr_addr=wr_cnt;

wire[7:0] read_ram;


always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        rand_num    <=8'b0;
//		rd_addr<=0;
	//	r_selectable2<=0;

    end
    else
	begin
          pre_start<=start;	
          pre_read_out<=read_out;
    //      rd_addr<=rd_addr+1;
			if(rand_num[6:0]<80&rand_num[6:0]>0) r_selectable1<={1'b0,rand_num[6:0]};
			
          if({pre_start,start}==2'b01) /*when the rising edge of start comes*/
          begin
            rand_num <=20;    /*load the initial value when start is active*/

          end
          
              
		
		else

			  begin                /*generate the random number*/
				rand_num[0] <= rand_num[7];
				rand_num[1] <= rand_num[0];
				rand_num[2] <= rand_num[1];
				rand_num[3] <= rand_num[2];
				rand_num[4] <= rand_num[3]^rand_num[7];
				rand_num[5] <= rand_num[4]^rand_num[7];
				rand_num[6] <= rand_num[5]^rand_num[7];
				rand_num[7] <= rand_num[6];
				
			
				
			  end
	end
end


assign CLOCK=clk;
assign RESET=rst_n;

//to generate clock div
always@(posedge CLOCK or negedge RESET)
begin
	if(!RESET)
	begin
		CTRL_CLK	<=	0;
		CLK_DIV	<=	0;
		
	end
	else
	begin

		if( CLK_DIV	< (3)) //50*2=100 clock div
		CLK_DIV	<=	CLK_DIV+1;
		else
		begin
			CLK_DIV	<=	0;
			CTRL_CLK	<=	~CTRL_CLK;
		end
	end
end



always@(posedge CTRL_CLK or negedge rst_n)
begin
    if(!rst_n)
		begin
			state<=0;	
			wr_cnt    	<=0;
			rd_cnt		<=0;
			r_select	<=0;
			r_selectable1<=0;
			wr<=0;
		{r1,r2,r3,r4,r5,r6,r7,r8,r9,r10}<=0;
		{r11,r12,r13,r14,r15,r16,r17,r18,r19,r20}<=0;
		{r21,r22,r23,r24,r25,r26,r27,r28,r29,r30}<=0;
		{r31,r32,r33,r34,r35,r36,r37,r38,r39,r40}<=0;
		end
    else
    begin 
    

			
			
		if({pre_read_out,read_out}==2'b01) /*when the rising edge of readout comes*/
			begin

				r_select<=	r_selectable2;
				wr_cnt<=wr_cnt+1;
				
		if(r_select==5)state<=1;	
				
		if(r_selectable1!=r1
		/*	&&(r_selectable1!==r4)&&(r_selectable1!==r5)&&(r_selectable1!==r6)
			&&(r_selectable1!==r7)&&(r_selectable1!==r8)&&(r_selectable1!==r9)
			&&(r_selectable1!==r10)&&(r_selectable1!==r11)&&(r_selectable1!==r12)
			&&(r_selectable1!==r13)&&(r_selectable1!==r14)&&(r_selectable1!==r15)*/
			)
				begin
					r_selectable2<=r_selectable1;

					r40<=r39;
					r39<=r38;
					r38<=r37;
					r37<=r36;
					r36<=r35;
					r35<=r34;
					r34<=r33;
					r33<=r32;
					r32<=r31;
					r31<=r30;
					
					r30<=r29;
					r29<=r28;
					r28<=r27;
					r27<=r26;
					r26<=r25;
					r25<=r24;
					r24<=r23;
					r23<=r22;
					r22<=r21;
					r21<=r20;
					
					r20<=r19;
					r19<=r18;
					r18<=r17;
					r17<=r16;
					r16<=r15;
					r15<=r14;
					r14<=r13;
					r13<=r12;
					r12<=r11;
					r11<=r10;
					
					r10<=r9;
					r9<=r8;
					r8<=r7;
					r7<=r6;
					r6<=r5;
					r5<=r4;
					r4<=r3;
					r3<=r2;
					r2<=r1;
					r1<=r_selectable1;
				end
		
			end
    end
    
 end
   
			

/*lock-down in 2 regs when matching the requirement, one for 1-59,another for 16-31*/



endmodule
