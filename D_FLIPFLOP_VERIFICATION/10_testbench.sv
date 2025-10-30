`include "interface.sv"
`include "test.sv"

module d_flipflop_tb;
 
  initial begin
    interf.clk=0;
  end
  
  always #5 interf.clk=~interf.clk;
  
  inter interf();
  test tst(interf);
  
  d_flipflop dut(.clk(interf.clk),.rst(interf.rst),.q(interf.q),.d(interf.d));
  
  initial begin
    interf.rst=1;
    #20; interf.rst=0;
  end
  
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars;
    #200;
    $finish;
  end
  
endmodule
