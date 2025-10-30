class monitor;
  transaction trans;
  mailbox mon_sco;
  virtual inter interf;
  
  function new(virtual inter interf, mailbox mon_sco);
    this.interf=interf;
    this.mon_sco=mon_sco;
  endfunction
  
  task run();
    trans=new();
    repeat(30)begin
      @(posedge interf.clk);
      trans.rst=interf.rst;
      trans.d=interf.d;
      trans.q=interf.q;
      mon_sco.put(trans);
      trans.display("MONITOR");
    end
  endtask
endclass
