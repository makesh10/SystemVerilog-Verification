class scoreboard;
  transaction trans;
  mailbox mon_sco;
  event triggering;
  bit [6:0]prev_counter;
  
  function new(mailbox mon_sco);
    this.mon_sco=mon_sco;
  endfunction
  
  task run();
    trans=new();
    repeat(50) begin
      mon_sco.get(trans);
      trans.display("SCOREBOARD");
      if((trans.rst==0)&&(trans.count==0))begin
        $display("COUNTER IS RESETTED");
      end
      else if(trans.counter==1) begin
        if(trans.count<=prev_counter+1)
          $display("UPCOUNTER IS PASSED");
        else
          $display("UPCOUNTER IS FAILED");
      end
      else if(trans.counter==0)begin
        if(trans.count<=prev_counter-1)
          $display("DOWNCOUNTER IS PASSED");
        else
          $display("DOWNCOUNTER IS FAILED");
      end
      prev_counter=trans.count;
      ->triggering;
    end
  endtask
endclass
