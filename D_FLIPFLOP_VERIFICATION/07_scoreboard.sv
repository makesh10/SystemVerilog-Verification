class scoreboard;
  transaction trans;
  mailbox mon_sco;
  event triggering;
  
  function new(mailbox mon_sco);
    this.mon_sco=mon_sco;
  endfunction
  
  task run();
    trans=new();
    repeat(30)begin
      mon_sco.get(trans);
      trans.display("SCOREBOARD");
      if ((trans.rst==1)&&(trans.q==0)||(trans.rst==0)&&(trans.q==trans.d))
        $display("PASS");
      else
        $display("FAIL");
      ->triggering;
    end
  endtask
endclass
