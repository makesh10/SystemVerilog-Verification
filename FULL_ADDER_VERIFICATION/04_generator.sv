class generator;
  transaction trans;
  mailbox gen_drv;
  
  function new(mailbox gen_drv);
    this.gen_drv=gen_drv;
  endfunction
  
  task run();
    trans=new();
    repeat(10)begin
      void'(trans.randomize());
      gen_drv.put(trans);
      trans.display("GENERATOR");
      #5;
      
    end
  endtask
endclass
