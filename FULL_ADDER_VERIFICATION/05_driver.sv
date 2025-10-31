class driver;
  transaction trans;
  mailbox gen_drv;
  virtual inter interf;
  
  function new(mailbox gen_drv,virtual inter interf);
    this.gen_drv=gen_drv;
    this.interf=interf;
  endfunction
  
  task driv();
    trans=new();
    repeat(10)begin
      #5;
      gen_drv.get(trans);
      interf.a=trans.a;
      interf.b=trans.b;
      interf.cin=trans.cin;
      trans.display("DRIVER");
      #2;
    end
  endtask
endclass
