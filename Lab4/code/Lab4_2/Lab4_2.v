module Lab4_2( DIGIT, DISPLAY, cout, en, reset, clk, dir);
		
input en;
input reset;
input clk;
input dir;
output [3:0] DIGIT; 
output [6:0] DISPLAY;
output cout;

wire [3:0] BCD0, BCD1; 


clock_divider CD(clk13, clk25, clk);
BCD_counter BC(clk25, reset_debounced, en_debounced, dir, BCD0, BCD1, cout);
seven_segment SS(DIGIT, DISPLAY, BCD0, BCD1, clk13);	
debounce DB1(en_debounced, en, clk13);
debounce DB2(reset_debounced, reset, clk13);

endmodule