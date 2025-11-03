class generator;
  transaction trans;
  mailbox gen_drv;
  event trigger;
  
  function new(mailbox gen_drv);
    this.gen_drv=gen_drv;
  endfunction
  
  task run();
    trans=new();
    repeat(100)begin
      trans.randomize();
      gen_drv.put(trans);
      trans.display("GENERATOR");
      @trigger;
      
    end
  endtask
endclass
