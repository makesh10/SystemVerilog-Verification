class transaction;
  rand bit a;
  rand bit b;
  rand bit cin;
  bit sum;
  bit carry;
  
  function void display(string fulladder);
    $display("%s",fulladder);
    $display("time=%0t a=%b b=%b cin=%b sum=%b carry=%b",$time,a,b,cin,sum,carry);
  endfunction
  
endclass
