	module ADC16BIT(

							 reg01_td,
						  reg01_tv,
						  reg02_td, 
						  reg02_tv,
						  reg03_td, 
						  reg03_tv,			
						  reg04_td, 
						  reg04_tv,					 
						  reg05_td, 
						  reg05_tv,					 
						  reg06_td, 
						  reg06_tv,					 
						  reg07_td, 
						  reg07_tv,					 
						   reg08_td, 
						   reg08_tv,					 
						   reg09_td, 
						   reg09_tv,					 
						   reg10_td, 
						   reg10_tv,
						   reg11_td, 
						   reg11_tv,
						   reg12_td, 
						   reg12_tv,
						   reg13_td, 
						   reg13_tv,
						   reg14_td, 
						   reg14_tv, 
						 
						   reg01_rd,
						   reg01_rv,
						   reg02_rd, 
						   reg02_rv,
						   reg03_rd, 
						   reg03_rv,			
						   reg04_rd, 
						   reg04_rv,					 
						   reg05_rd, 
						   reg05_rv,					 
						   reg06_rd, 
						   reg06_rv,					 
						   reg07_rd, 
						   reg07_rv,					 
						  reg08_rd, 
						   reg08_rv,					 
						   reg09_rd, 
						   reg09_rv,					 
						   reg10_rd, 
						   reg10_rv,
						   reg11_rd, 
						   reg11_rv,
						   reg12_rd, 
						   reg12_rv,
						   reg13_rd, 
						   reg13_rv,
						   reg14_rd, 
						   reg14_rv,
						  
						 
						  reset,
						 
						 
						  	fifowr_clk, 
						  fifowr_en ,  
						  fifodin  ,
						  
						   fifofull ,   
						   fifoprog_full,
						
						
						  real_strobe_signal,
						  real_soa_signal,


						  resetfifo,
						

						  trnclk,
						  adc  ,
						  adc1,
						  adc2,
						 leds,

						  CLKFROMADCREAL
					);
 

parameter IDELAY_SIGNAL_GROUP = "adc0_data_delay_group";
 
//                               
/*Parametrs*/
//                   
parameter WIDTH=16;
//
/*Variable*/
//

//Input Reg
	//Input Reg
	input	 wire [31:0] reg01_td;
	input	 wire reg01_tv;
	input	 wire [31:0] reg02_td;
	input	 wire reg02_tv;	 
	input	 wire [31:0] reg03_td;
	input	 wire reg03_tv;	 
	input	 wire [31:0] reg04_td;
	input	 wire reg04_tv;	 
	input	wire [31:0] reg05_td;
	input	 wire reg05_tv;	 
	input	 wire [31:0] reg06_td;
	input	 wire reg06_tv;
	input	 wire [31:0] reg07_td;
	input	 wire reg07_tv;	 
	input	 wire [31:0] reg08_td;
	input	 wire reg08_tv;	 
	input	 wire [31:0] reg09_td;
	input	 wire reg09_tv;	 
	input	wire [31:0] reg10_td;
	input	 wire reg10_tv;	 
	input	 wire [31:0] reg11_td;
	input	 wire reg11_tv;	 
	input	 wire [31:0] reg12_td;
	input	 wire reg12_tv;	 
	input	 wire [31:0] reg13_td;
	input	 wire reg13_tv;	 
		
		 
	input	 wire [31:0] reg14_td;
	input	 wire reg14_tv;	   
			
			
	input  wire	 CLKFROMADCREAL;
			 
	input	 wire [15:0] adc;
	input	 wire [15:0] adc1;
	input	 wire [15:0] adc2;
	reg[47:0] fromADC;
		 
		 //   
		 reg [31:0] strobe_counter;
		 //   SOA
		 reg [31:0]	soa_counter;
		 
		 
		 //   
		 reg [31:0] reflength_counter;
		 // --     
		 // --    
		 // --   -  
		 reg [31:0] reg01_rd_current_reflength;
	output	 reg [31:0] reg01_rd;
	output	 reg reg01_rv;
		 
		 // ---      (  !)
		 reg [31:0] fifowasoverflowonvalue;
		 reg fifowasoverflow;
		 
		 //  workstatus = 1    FIFO,     
		 reg reg02_rd_work_status;
		
output		 reg [31:0] reg02_rd;
	output	 reg reg02_rv;
		 
		 //  
		 reg [31:0] reg03_strobe_length_cur;
	output	 reg [31:0] reg03_rd;
	output	 reg reg03_rv;
		 
		 //  soa 
		 reg [31:0] reg04_soa_length_cur;
	output	 reg [31:0] reg04_rd;
	output	 reg reg04_rv;
		 
		 //   FIFO
		 //       fifo  
	output	 reg [31:0] reg05_rd;
	output	 reg reg05_rv;
		 
		 //        ( 4   )
		 reg reg06_rd_testbandwith_speed;
	output	 reg [31:0] reg06_rd;
	output	 reg reg06_rv;
		 
	output	 reg [31:0] reg07_rd;
	output	 reg reg07_rv;
	output	 reg [31:0] reg08_rd;
	output	 reg reg08_rv;
	output	 reg [31:0] reg09_rd;
	output	 reg reg09_rv;
	output	 reg [31:0] reg10_rd;
	output	 reg reg10_rv;
	output	 reg [31:0] reg11_rd;
	output	 reg reg11_rv;
	output	 reg [31:0] reg12_rd;
	output	 reg reg12_rv;
	output	 reg [31:0] reg13_rd;
	output	 reg reg13_rv;
		 
		 
		 reg [31:0] reg14_rdCur = 'd0;
	output	 reg [31:0] reg14_rd;
	output	 reg reg14_rv;

		 reg [5:0]countTact;


	input	wire trnclk;
   
		//
		/*Default signal*/
		//
	input	wire                reset;
 
 
 
		
	output	wire	 fifowr_clk;
	output	reg    fifowr_en ;
	output	wire[71:0]  fifodin ;
	input	wire  fifofull;
	input	wire  fifoprog_full;
						
		
	output	reg real_strobe_signal;
	output	reg real_soa_signal;	
	

	
	output	reg resetfifo;
		
		reg[31:0] wasfifoerror;
		  
 output reg[2:0] leds;
  
///input wire userclock100mhz;

///input wire sysclock100mhz;
//wire ADCc_2x;
//reg ADCc;

//wire sysclk;// = sysclock100mhz;
//assign sysclk = sysclock100mhz;

reg[31:0] adctype;
 
 //clockdoubler clockdoubler_inst(.CLKIN_IN(sysclk), .CLK0_OUT(ADCc_2x));
 
 //assign real_soa_signal2 = ADCc_2x;
 
	 reg[63:0] tempCounter;
	 

	 	//DAC control
	
//	reg clockreal100mhz;
	
	///always @(posedge userclock100mhz) clockreal100mhz <= clockreal100mhz + 1;
	
//	reg [31:0] DacData;
	
	
 //  reg[1:0] tmp_cntr_1; always @(posedge clockreal100mhz) tmp_cntr_1 <= tmp_cntr_1 + 1;
	
	
//	reg [31:0] DAC_cnt; always @(posedge tmp_cntr_1[1]) DAC_cnt <= DAC_cnt + 1;
//	wire [7:0] DAC_regdata [3:0];
//	assign DAC_regdata[0] = DacData[31:24];//8'b11000000;
//	assign DAC_regdata[1] = DacData[23:16];//8'b10000000;
//	assign DAC_regdata[2] = DacData[15:8];//8'b11000000;
//	assign DAC_regdata[3] = DacData[7:0];//8'b10000000;
//	wire [15:0] DAC_data = {5'b11111, DAC_cnt[17:16], 1'b1, DAC_regdata[DAC_cnt[17:16]]};
//	reg DAC_control;
//	always @(posedge tmp_cntr_1[1])
//	begin
//		DAC1 <= &DAC_cnt[15:13] & (&DAC_cnt[8:1] ? ~DAC_cnt[0] : DAC_data[~DAC_cnt[12:9]]);
//		DAC2 <= &DAC_cnt[15:13] & (&DAC_cnt[8:1] ? ~DAC_cnt[0] : DAC_data[~DAC_cnt[12:9]]);
//	end

   
   
   reg resetfifo_ff2;
   reg resetfifo_ff;
   wire  	init_resetfifo;
   assign init_resetfifo	= (!resetfifo_ff2) && resetfifo_ff;
    
	 
	  always @(posedge trnclk) begin 
	  
		if (!reset) 
			begin
		
		  
				reg01_rd_current_reflength <= 'd12000; // 60 km
				reg02_rd_work_status <= 0;	// 0 not work
				reg03_strobe_length_cur <= 'd60;	// 7500 ns
				reg04_soa_length_cur <= 'd1;	// 75 ns
				
				reg06_rd_testbandwith_speed<=0;
				
 
//				DacData<='hFFFFFFFF;
				adctype<='d0;
				resetfifo <= 0;
			    resetfifo_ff <= 1'b0;                                                   
                resetfifo_ff2 <= 1'b0;
			
			end 
		 else
		 begin

         if (init_resetfifo == 1)
		 begin
		      resetfifo <= 1;
        end		
        if (init_resetfifo == 0)
        begin
            resetfifo <= 0;
        end
		      
    
		
		
		 if ( reg01_tv == 1)
		 begin
			reg01_rd_current_reflength <= reg01_td;
		 end
		  
		  reg01_rd <= reg01_rd_current_reflength; // 44
		   reg01_rv <=  1;//reg01_tv;//1; // Reg 44
		
		 if ( reg02_tv == 1)
		 begin
		   if (reg02_td > 'd0)
			  begin
				 reg02_rd_work_status <=1;
				 resetfifo_ff <= 0;
                 resetfifo_ff2 <= 0;
				  //resetfifo<=0;
			  end	 
				  
			 else
			  begin
				reg02_rd_work_status <= 0;
				resetfifo_ff <= 1;
                resetfifo_ff2 <= resetfifo_ff;
				
				//resetfifo <= 1;
			  end
			
		 end 
		 
		 
		 

		 
			
			reg02_rd <= reg02_rd_work_status; // state IRQ to reg 
		   reg02_rv <= 1; //45
			
			
		 if ( reg03_tv == 1)
		 begin
			reg03_strobe_length_cur <= reg03_td;
		 end
			
			reg03_rd <= reg03_strobe_length_cur;//count_irq; // 
		   reg03_rv <= 1;	//46	
			
		  if ( reg04_tv == 1)
		  begin
			reg04_soa_length_cur <= reg04_td; //
		  end
			
			reg04_rd <= reg04_soa_length_cur;//count_irq; // 
		   reg04_rv <= 1;	//47	
			
			if (reg05_tv == 1) // resetfifo
			begin
				//resetfifo <=  1;
				
			end
			else
			begin
				//resetfifo <=  0;
			end
		  reg05_rd <= wasfifoerror;  //48
		   reg05_rv <= 1;//1;
			
			
			if ( reg06_tv == 1)
		 begin
		   if (reg06_td > 'd0)
			 
				reg06_rd_testbandwith_speed <=1;
			 else
				reg06_rd_testbandwith_speed <= 0;
			
		 end 
			
			reg06_rd <= reg06_rd_testbandwith_speed; // state IRQ to reg 
		   reg06_rv <= 1; //49
			
			
			
			
			reg07_rd <= fifodin[31:0]; //50
		   reg07_rv <= 1;		
			
//	  if ( reg08_tv == 1)
//		 begin
//			DacData <= reg08_td;
//		 end 
		 
//			reg08_rd <= DacData; //51
//		   reg08_rv <= 1;
			
			  if ( reg09_tv == 1)
		 begin
			adctype <= reg09_td;
		 end 
		 
		  reg09_rd <=  adctype; //52
		   reg09_rv <= 1;//1;
			
			
			
			
			reg10_rd <= 0; //53
		   reg10_rv <= 1;
			reg11_rd <= 0;
		   reg11_rv <= 1;		
			reg12_rd <= 'd1000;
		   reg12_rv <= 1;
		  reg13_rd <= 'd1000;
		   reg13_rv <= 1;//1;
			
			  
		 end
	  end



	
	//  3 
	reg isfirstbuffer; 
	
	//  
	reg dataIsReady;
	
	//  
	reg isbigcount;
	
	integer curValue;
	 
	 
reg[72:0] outDataToWrite;

reg outbufferisempty;

 
 reg[63:0] adcChannel1;
 reg[63:0] adcChannel2;
 reg[63:0] adcChannel3;
 reg[63:0] adcChannel4;
 
  
 

 //reg[15:0] adcChannelCur1;
 //reg[15:0] adcChannelCur2;
 wire[15:0] adcChannelCur1;
 wire[15:0] adcChannelCur2;
 wire[15:0] adcChannelCur3;
 wire[15:0] adcChannelCur4;
 
 wire[15:0] adcChannelCur5;
 wire[15:0] adcChannelCur6;
 //wire[31:0] adcBUF;
 
 wire [15:0] databuf_ch1;
 wire [15:0] databuf_ch2;
 

 

	wire [15:0] data_from_A_1;
	wire [15:0] data_from_B_1;
	wire [15:0] data_from_A_2;
	wire [15:0] data_from_B_2;
	wire [15:0] data_from_A_3;
	wire [15:0] data_from_B_3;
///output	 wire clock20mhzout;
/// wire clockforddr20mhz;
 ///assign clock20mhzout =  clockforddr20mhz;

  genvar l_inst;
  genvar l_inst1;
  genvar l_inst2;
  
  wire[15:0] dataadcafterdelay;
  wire clk_io;

	   wire clkdd;

  generate
  for (l_inst = 0; l_inst <= 15; l_inst = l_inst + 1) begin : g_adc_if  
  		IDDR #(
    .INIT_Q1 (1'b0),
    .INIT_Q2 (1'b0),
    .DDR_CLK_EDGE ("SAME_EDGE_PIPELINED"),
    .SRTYPE ("ASYNC"))
  i_data_ddr (
    .CE (1'b1),
    .R (1'b0),
    .S (1'b0),
    .C (CLKFROMADCREAL),
    .D (adc[l_inst]),
    .Q1 (data_from_A_1[l_inst]),
    .Q2 (data_from_B_1[l_inst]));
  end
  endgenerate
 
  generate
  for (l_inst1 = 0; l_inst1 <= 15; l_inst1 = l_inst1 + 1) begin : g_adc_if1
		IDDR #(
    .INIT_Q1 (1'b0),
    .INIT_Q2 (1'b0),
    .DDR_CLK_EDGE ("SAME_EDGE_PIPELINED"),
    .SRTYPE ("ASYNC"))
  i_data_ddr (
    .CE (1'b1),
    .R (1'b0),
    .S (1'b0),
    .C (CLKFROMADCREAL),
    .D (adc1[l_inst1]),
    .Q1 (data_from_A_2[l_inst1]),
    .Q2 (data_from_B_2[l_inst1]));
  end
  endgenerate

    generate
  for (l_inst2 = 0; l_inst2 <= 15; l_inst2 = l_inst2 + 1) begin : g_adc_if2
		IDDR #(
    .INIT_Q1 (1'b0),
    .INIT_Q2 (1'b0),
    .DDR_CLK_EDGE ("SAME_EDGE_PIPELINED"),
    .SRTYPE ("ASYNC"))
  i_data_ddr (
    .CE (1'b1),
    .R (1'b0),
    .S (1'b0),
    .C (CLKFROMADCREAL),
    .D (adc2[l_inst2]),
    .Q1 (data_from_A_3[l_inst2]),
    .Q2 (data_from_B_3[l_inst2]));
  end
  endgenerate
  
	reg [2:0] clkcount;
	reg flag;
 
 wire clk2x2;
 wire tempclk;
 wire tempclkstd_logic;

 
 

 
 ///reg clk20mhz;

///assign clockforddr20mhz= userclock100mhz;


assign				adcChannelCur3[0]=data_from_A_1[0];
assign				adcChannelCur3[1]=data_from_B_1[0];			
assign				adcChannelCur3[2]=data_from_A_1[1];
assign				adcChannelCur3[3]=data_from_B_1[1];
assign				adcChannelCur3[4]=data_from_A_1[2];
assign				adcChannelCur3[5]=data_from_B_1[2];
assign				adcChannelCur3[6]=data_from_A_1[3];
assign				adcChannelCur3[7]=data_from_B_1[3];
assign				adcChannelCur3[8]=data_from_A_1[4];
assign				adcChannelCur3[9]=data_from_B_1[4];
assign				adcChannelCur3[10]=data_from_A_1[5];
assign				adcChannelCur3[11]=data_from_B_1[5];
assign				adcChannelCur3[12]=data_from_A_1[6];
assign				adcChannelCur3[13]=data_from_B_1[6];
assign				adcChannelCur3[14]=data_from_A_1[7];
assign				adcChannelCur3[15]=data_from_B_1[7];
			
assign				adcChannelCur4[0]=data_from_A_1[8];
assign				adcChannelCur4[1]=data_from_B_1[8];			
assign				adcChannelCur4[2]=data_from_A_1[9];
assign				adcChannelCur4[3]=data_from_B_1[9];
assign				adcChannelCur4[4]=data_from_A_1[10];
assign				adcChannelCur4[5]=data_from_B_1[10];
assign				adcChannelCur4[6]=data_from_A_1[11];
assign				adcChannelCur4[7]=data_from_B_1[11];
assign				adcChannelCur4[8]=data_from_A_1[12];
assign				adcChannelCur4[9]=data_from_B_1[12];
assign				adcChannelCur4[10]=data_from_A_1[13];
assign				adcChannelCur4[11]=data_from_B_1[13];
assign				adcChannelCur4[12]=data_from_A_1[14];
assign				adcChannelCur4[13]=data_from_B_1[14];
assign				adcChannelCur4[14]=data_from_A_1[15];
assign				adcChannelCur4[15]=data_from_B_1[15];		
			



assign				adcChannelCur1[0]=data_from_A_2[0];
assign				adcChannelCur1[1]=data_from_B_2[0];			
assign				adcChannelCur1[2]=data_from_A_2[1];
assign				adcChannelCur1[3]=data_from_B_2[1];
assign				adcChannelCur1[4]=data_from_A_2[2];
assign				adcChannelCur1[5]=data_from_B_2[2];
assign				adcChannelCur1[6]=data_from_A_2[3];
assign				adcChannelCur1[7]=data_from_B_2[3];
assign				adcChannelCur1[8]=data_from_A_2[4];
assign				adcChannelCur1[9]=data_from_B_2[4];
assign				adcChannelCur1[10]=data_from_A_2[5];
assign				adcChannelCur1[11]=data_from_B_2[5];
assign				adcChannelCur1[12]=data_from_A_2[6];
assign				adcChannelCur1[13]=data_from_B_2[6];
assign				adcChannelCur1[14]=data_from_A_2[7];
assign				adcChannelCur1[15]=data_from_B_2[7];
			
assign				adcChannelCur2[0]=data_from_A_2[8];
assign				adcChannelCur2[1]=data_from_B_2[8];			
assign				adcChannelCur2[2]=data_from_A_2[9];
assign				adcChannelCur2[3]=data_from_B_2[9];
assign				adcChannelCur2[4]=data_from_A_2[10];
assign				adcChannelCur2[5]=data_from_B_2[10];
assign				adcChannelCur2[6]=data_from_A_2[11];
assign				adcChannelCur2[7]=data_from_B_2[11];
assign				adcChannelCur2[8]=data_from_A_2[12];
assign				adcChannelCur2[9]=data_from_B_2[12];
assign				adcChannelCur2[10]=data_from_A_2[13];
assign				adcChannelCur2[11]=data_from_B_2[13];
assign				adcChannelCur2[12]=data_from_A_2[14];
assign				adcChannelCur2[13]=data_from_B_2[14];
assign				adcChannelCur2[14]=data_from_A_2[15];
assign				adcChannelCur2[15]=data_from_B_2[15];

 
assign				adcChannelCur5[0]=data_from_A_3[0];
assign				adcChannelCur5[1]=data_from_B_3[0];			
assign				adcChannelCur5[2]=data_from_A_3[1];
assign				adcChannelCur5[3]=data_from_B_3[1];
assign				adcChannelCur5[4]=data_from_A_3[2];
assign				adcChannelCur5[5]=data_from_B_3[2];
assign				adcChannelCur5[6]=data_from_A_3[3];
assign				adcChannelCur5[7]=data_from_B_3[3];
assign				adcChannelCur5[8]=data_from_A_3[4];
assign				adcChannelCur5[9]=data_from_B_3[4];
assign				adcChannelCur5[10]=data_from_A_3[5];
assign				adcChannelCur5[11]=data_from_B_3[5];
assign				adcChannelCur5[12]=data_from_A_3[6];
assign				adcChannelCur5[13]=data_from_B_3[6];
assign				adcChannelCur5[14]=data_from_A_3[7];
assign				adcChannelCur5[15]=data_from_B_3[7];
			
assign				adcChannelCur6[0]=data_from_A_3[8];
assign				adcChannelCur6[1]=data_from_B_3[8];			
assign				adcChannelCur6[2]=data_from_A_3[9];
assign				adcChannelCur6[3]=data_from_B_3[9];
assign				adcChannelCur6[4]=data_from_A_3[10];
assign				adcChannelCur6[5]=data_from_B_3[10];
assign				adcChannelCur6[6]=data_from_A_3[11];
assign				adcChannelCur6[7]=data_from_B_3[11];
assign				adcChannelCur6[8]=data_from_A_3[12];
assign				adcChannelCur6[9]=data_from_B_3[12];
assign				adcChannelCur6[10]=data_from_A_3[13];
assign				adcChannelCur6[11]=data_from_B_3[13];
assign				adcChannelCur6[12]=data_from_A_3[14];
assign				adcChannelCur6[13]=data_from_B_3[14];
assign				adcChannelCur6[14]=data_from_A_3[15];
assign				adcChannelCur6[15]=data_from_B_3[15];
 
 
always @(posedge CLKFROMADCREAL) begin 
  if (!reset) begin
    outDataToWrite<='d0;	
	 fifowr_en<=0;	
	 strobe_counter <= 'd0;
	 soa_counter <= 'd0;
	 reflength_counter <= 'd0;	
	 real_strobe_signal <= 0;
	 real_soa_signal <= 0;	

	 wasfifoerror <= 'd0;			
	 fifowasoverflowonvalue <= 'd0;
	 fifowasoverflow <=0;
	 leds<='d0;
	 tempCounter<='d0;
	 fromADC<='d0;				
	 adcChannel1<=0;
	 adcChannel2<=0;
	 adcChannel3<=0;
	 adcChannel4<=0;
  end else begin
	 tempCounter <=tempCounter+1;
	 if (tempCounter>'d100000000) begin
		leds[0] <= 0;
		leds[1] <= 1;
		leds[2] <= 0;
		if (tempCounter>'d200000000) begin
		  tempCounter<=0;
		end
	 end else begin
		leds[0] <= 1;
		leds[1] <= 0;
		leds[2] <= 1;
	 end
    if ( reg02_rd_work_status == 0 ) begin
		strobe_counter <=0;
		soa_counter <=0;
		reflength_counter <=0;				
		real_strobe_signal <= 0;
		real_soa_signal <= 0;

		fifowasoverflowonvalue <= 'd0;
		fifowasoverflow <=0;
		wasfifoerror <= 0;
		countTact <= 0;
	 end else begin 
		 // CPLD Control
	   if (reflength_counter == reg01_rd_current_reflength) begin
		  reflength_counter <= 0;
		  strobe_counter <=0;
		  soa_counter <=0; 
		  real_strobe_signal <= 1;
		  real_soa_signal <= 1;			
						
		  fifowr_en <= 0;
		  countTact<=0;
	   end else begin
		  reflength_counter <= reflength_counter +1;
		  if ( strobe_counter < reg03_strobe_length_cur ) begin
		    strobe_counter <= strobe_counter + 1;
		    real_strobe_signal <= 1;

		  end else begin
		    real_strobe_signal <= 0; 

		  end
		  if ( soa_counter < reg04_soa_length_cur ) begin
	       soa_counter <= soa_counter + 1;
		    real_soa_signal <= 1;
		    //real_soa_signal2 <= 1;
		  end else begin
		    real_soa_signal <= 0; 
		    //real_soa_signal2 <= 0;
		  end
        if (countTact < 'd1) begin
		    fifowr_en <= 0;
		    countTact <= countTact+1;
		    
			 outDataToWrite[15:0]  <= adcChannelCur1;
		     outDataToWrite[31:16] <= adcChannelCur2;
             outDataToWrite[47:32] <=  adcChannelCur3;
		     outDataToWrite[63:48] <=  adcChannelCur4;
		   //outDataToWrite[15:0]  <= adcChannelCur5;
           //outDataToWrite[31:16] <= adcChannelCur6;
		    													
		  end else begin				
	       countTact<='d0;
	       outDataToWrite[15:0] <=  adcChannelCur5;
           outDataToWrite[31:16] <=  adcChannelCur6;
		    //outDataToWrite[15:0]  <= adcChannelCur5;
		    //outDataToWrite[31:16] <= adcChannelCur6;
		  if (fifofull == 1) begin
		    fifowr_en <= 0;
		    wasfifoerror <= wasfifoerror + 1;
		  if (fifowasoverflow == 0) begin
		    fifowasoverflow <= 1;
		    fifowasoverflowonvalue<=reflength_counter;
		  end
	   end else begin
		  if (fifowasoverflow==0) begin
		    fifowr_en <= 1;
        end else begin
		    if (fifowasoverflowonvalue == reflength_counter) begin
            fifowr_en <= 1;																
            fifowasoverflow <= 0;
            fifowasoverflowonvalue<='d0;
		    end else begin
		      fifowr_en <= 0;
		    end
	     end 
      end 
    end	
  end					
    if (reg06_rd_testbandwith_speed==1) begin
      fifowr_en<=1;
    end
    end						 
  end
end	 
  
     
assign fifowr_clk = CLKFROMADCREAL;//tmp_cntr_1[1];

  assign fifodin[7:0] = outDataToWrite[15:8];
  assign fifodin[15:8] = outDataToWrite[7:0];
  assign fifodin[23:16] = outDataToWrite[31:24];
  assign fifodin[31:24] = outDataToWrite[23:16];
  assign fifodin[39:32] = outDataToWrite[47:40];
  assign fifodin[47:40] = outDataToWrite[39:32];
  assign fifodin[55:48] = outDataToWrite[63:56];
  assign fifodin[63:56] = outDataToWrite[55:48];

  
	endmodule
