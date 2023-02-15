 
 


 module FIR #( parameter order = 4, parameter integer coef[order:0] = init())
                       (output reg [8:0] OUT, input [7:0] IN,input clk);


 // initializing the parameter coefficients 
typedef integer coef_data_type [order:0]; // defining a datatype 
// generating the coefficients using function init()
function coef_data_type init();
coef_data_type val;
integer i;
for(i = 0;i<=order;i=i+1) val[i] = 2; 
endfunction : init
 
 ////////////////////////////////////////////////////////
 
 reg  [7:0] PIP_REG[order-1:0];
 reg carry[order-1:0];
 integer i;
 

 always@(posedge clk) begin 
 
 PIP_REG[0] <= IN*(coef[0]);
 
 for(i = 1;i < order;i=i+1) begin
 {carry[i],PIP_REG[i]} <= (IN*coef[i]) + PIP_REG[i-1] + carry[i-1];
 end
 
 OUT <= (IN*coef[order]) + PIP_REG[order-1] + carry[order-1];
	
 end
 endmodule
 
 
 
