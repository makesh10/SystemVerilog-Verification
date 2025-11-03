class monitor;
  transaction trans;
  mailbox mon_sco;
  virtual inter interf;
  
  function new(virtual inter interf,mailbox mon_sco);
    this.interf=interf;
    this.mon_sco=mon_sco;
  endfunction
  
  task run();
    trans=new();
    repeat(100)begin
      #1;
      @(posedge interf.clk)
      trans.rst=interf.rst;
      trans.counter=interf.counter;
      trans.count=interf.count;
      
      mon_sco.put(trans);
      trans.display("MONITOR");
    end
  endtask
endclass
