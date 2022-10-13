module D_FlipFlop_tb ();
 reg A_tb,B_tb;
 reg CLK_tb ;
 reg RST_tb,PRESET_tb ;
 wire Q_tb,Q_bar_tb;

//initial block
initial 
  begin
    $dumpfile("D_FlipFlop.vcd") ;
    $dumpvars ;
    // initial values
    A_tb= 1'b0;
    B_tb=1'b1;
    RST_tb= 1'b0;
    PRESET_tb= 1'b1;
    CLK_tb= 1'b0;
    $display ("TEST CASE 1") ;            // test reset signal
    #8
    if(Q_tb == 1'b0 && Q_bar_tb == 1'b1)
      $display ("TEST CASE 1 IS PASSED") ;
    else
      $display ("TEST CASE 1 IS FAILED") ; 

    $display ("TEST CASE 2") ;           // test preset signal
    #6
    A_tb= 1'b1;
    RST_tb= 1'b1;
    PRESET_tb= 1'b0;
    #5
    if(Q_tb == 1'b1 && Q_bar_tb == 1'b0)
      $display ("TEST CASE 2 IS PASSED") ;
    else
      $display ("TEST CASE 2 IS FAILED") ; 
    
    $display ("TEST CASE 3") ;           // test with no reset and preset signals
    #5
    A_tb= 1'b0;
    RST_tb= 1'b1;
    PRESET_tb= 1'b1;
    #9
    if(Q_tb == 1'b1 && Q_bar_tb == 1'b0)
      $display ("TEST CASE 3 IS PASSED") ;
    else
      $display ("TEST CASE 3 IS FAILED") ;
 
    $display ("TEST CASE 4") ;           // test with no reset and preset signals
    #5
    B_tb= 1'b0;
    RST_tb= 1'b1;
    PRESET_tb= 1'b1;
    #9
    if(Q_tb == 1'b0 && Q_bar_tb == 1'b1)
      $display ("TEST CASE 4 IS PASSED") ;
    else
      $display ("TEST CASE 4 IS FAILED") ;
  end

// Clock Generator  
  always #5 CLK_tb = !CLK_tb ;
  
// DUT instaniation
  D_FlipFlop DUT (
    .A(A_tb),
    .B(B_tb),
    .CLK(CLK_tb),
    .RST(RST_tb),
    .PRESET(PRESET_tb),
    .Q(Q_tb),
    .Q_bar(Q_bar_tb)
  );


endmodule


