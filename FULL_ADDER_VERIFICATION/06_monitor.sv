class monitor;
  transaction trans;
  mailbox mon_sco;
  virtual inter interf;
  
  function new(mailbox mon_sco,virtual inter interf);
    this.mon_sco=mon_sco;
    this.interf=interf;
    endfunction
  
  task monitor();
    trans=new();
    repeat(10)begin
      #3;
      trans.a=interf.a;
      trans.b=interf.b;
      trans.cin=interf.cin;
      trans.sum=interf.sum;
      trans.carry=interf.carry;
      
      mon_sco.put(trans);
      trans.display("MONITOR");
      #3;
      
    end
  endtask 
endclass
