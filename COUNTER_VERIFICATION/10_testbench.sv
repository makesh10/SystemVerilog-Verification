`include "interface.sv"
`include "test.sv"

module counter_tb;
  inter interf();
  test tst(interf);
  
  counter dut(.clk(interf.clk),
              .rst(interf.rst),
              .counter(interf.counter),
              .count(interf.count));
  
  initial begin
    interf.clk=0;
    forever #5 interf.clk=~interf.clk;
  end
  
  initial begin
    interf.rst=0;
    #20;
    interf.rst=1;
  end
  
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars();
    #500;
    $finish;
  end
endmodule
