`include "environment.sv"

program test(inter interf);
  environment envi;
 
  initial begin
    envi=new(interf);
    envi.test();
  end
  
endprogram
