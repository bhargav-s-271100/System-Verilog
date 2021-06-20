class generator;
  transactor tx;
  mailbox gen2drv;
  virtual inter intf;
  
  function new(mailbox gen2drv, virtual inter intf);
    this.gen2drv=gen2drv;
    this.intf=intf;
     tx=new();
  endfunction
  
 task create();
    repeat(20)@(posedge intf.clk)
      begin
        if(tx.randomize())
          begin
            $display(tx.a, tx.b, tx.cin);
            gen2drv.put(tx);
          end
        else
          $display("Randomization error");
      end
  endtask
endclass
