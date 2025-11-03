`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  transaction trans;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sco;
  
  mailbox gen_drv;
  mailbox mon_sco;
  
  virtual inter interf;
  event triggering;
  
  function new(virtual inter interf);
    this.interf=interf;
    
    gen_drv=new();
    mon_sco=new();
    gen=new(gen_drv);
    mon=new(interf,gen_drv);
    drv=new(interf,mon_sco);
    sco=new(mon_sco);
    
    gen.trigger=triggering;
    sco.triggering=triggering;
    
  endfunction
  
  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
      sco.run();
    join
  endtask
endclass
