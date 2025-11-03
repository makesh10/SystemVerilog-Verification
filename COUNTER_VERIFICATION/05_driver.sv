class driver;
   transaction trans;
   mailbox gen_drv;
   virtual inter interf;
  
  function new(virtual inter interf,mailbox gen_drv);
    this.interf=interf;
    this.gen_drv=gen_drv;
  endfunction
  
  task run();
    trans=new();
    repeat(100)begin
      gen_drv.get(trans);
      @(posedge interf.clk);
      interf.counter<=trans.counter;
      trans.display("DRIVER");

    end
  endtask
endclass
