module D_FlipFlop (
 //ports declaration
 input wire A,B,
 input wire CLK,
 input wire RST,PRESET,
 output reg Q,
 output wire Q_bar
);

 //internal signals
 wire D ;

always @ (posedge CLK or negedge RST or negedge PRESET)
  begin
   if(!RST)   // !RST --> Active low Asynchronous reset
     begin
       Q <= 1'b0;
     end
   else if(!PRESET) // !PRESET --> Active low Asynchronous PRESET
     begin
       Q <= 1'b1;
     end
   else
     begin
       Q <= D ;   // you can replace D by any Comb_Logic
     end
  end

 assign D = ((~A) & B) ;
 assign Q_bar = ~Q ;

endmodule

/* if you put Q_bar <= ~Q inside always block of edge clk it produce another D flipflop 
but we want it combinational logic so use always @(*) or assign */
