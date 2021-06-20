class monitor;
      transactor tx;
      virtual inter intf;
      mailbox mon2scb;
      
      function new(virtual inter intf, mailbox mon2scb);
        this.intf=intf;
        this.mon2scb=mon2scb;
        tx=new();
      endfunction
 
      task samp_values();
        repeat(20)@(posedge intf.clk)
          begin
            tx.a=intf.a;
            tx.b=intf.b;
            tx.cin=intf.cin;
            tx.c=intf.c;
            mon2scb.put(tx);
          end
      endtask
    endclass
