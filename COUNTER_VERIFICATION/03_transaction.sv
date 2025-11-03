class transaction;
  bit rst;
  rand bit counter;
  bit [6:0]count;
  
  function void display(string updowncounter);
    $display("%s",updowncounter);
    $display("time=%0t rst=%0b counter=%0b count=%0d",$time,rst,counter,count);
  endfunction
endclass
