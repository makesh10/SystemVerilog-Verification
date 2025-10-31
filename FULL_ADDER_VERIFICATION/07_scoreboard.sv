class scoreboard;
  transaction trans;
  mailbox mon_sco;
  
  function new(mailbox mon_sco);
    this.mon_sco=mon_sco;
  endfunction
  
  task score();
    trans=new();
    repeat(10)begin
      
      mon_sco.get(trans);
      trans.display("SCOREBOARD");
      if((trans.a^trans.b^trans.cin==trans.sum)&&((trans.a&trans.b)|(trans.b&trans.cin)|(trans.cin&trans.a)==trans.carry)))
         $display("PASS");
         else
           $display("FAIL");

    end
  endtask
endclass
