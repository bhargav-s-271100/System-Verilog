class driver;
   transactor tx;
   virtual inter intf;
   mailbox gen2drv;
   mailbox drv2scb;
   
   function new(virtual inter intf, mailbox gen2drv, mailbox drv2scb);
     this.intf=intf;
     this.gen2drv=gen2drv;
     this.drv2scb=drv2scb;
   endfunction
   
   
task drive_data();
     repeat(20)@(posedge intf.clk)
       begin
         gen2drv.get(tx);
         $display(tx.a, tx.b, tx.cin);
         intf.valid<=1;
         intf.a<=tx.a;
         intf.b<=tx.b;
         intf.cin<=tx.cin;
         drv2scb.put(tx);
       end
   
   endtask
   
    endclass
