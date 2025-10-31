`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "Scoreboard.sv"

class environment;
  transaction trans;
  generator gen;
  driver driv;
  monitor moni;
  scoreboard score;
  
  mailbox gen_drv;
  mailbox mon_sco;
  virtual inter interf;
  
  function new(virtual inter interf);
    
    this.interf=interf;
    gen_drv=new();
    mon_sco=new();
   
    gen=new(gen_drv);
    driv=new(interf,gen_drv);
    moni=new(interf,mon_sco);
    score=new(mon_sco);
    
  endfunction
  task test();
    fork
    gen.run();
    driv.driv();
    moni.monitor();
    score.score();
    join
  endtask
  
endclass
