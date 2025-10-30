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
  event trigger;
  
  function new (virtual inter interf);
    this.interf=interf;
  
    gen_drv=new();
    mon_sco=new();
    
    gen=new(gen_drv);
    drv=new(interf,gen_drv);
    mon=new(interf,mon_sco);
    sco=new(mon_sco);
    
    gen.trigger=this.trigger;
    sco.triggering=this.trigger;
    
  endfunction
  
  task test();
    fork
      gen.run();
      drv.run();
      mon.run();
      sco.run();
    join
  endtask
  
endclass
