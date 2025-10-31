`include "interface.sv"
`include "test.sv"

module fulladder_tb;
  inter interf();
  test tst(interf);
  
  fulladder dut(.a(interf.a),
                .b(interf.b),
                .c(interf.c),
                .sum(interf.sum),
                .carry(interf.carry));
  
endmodule
