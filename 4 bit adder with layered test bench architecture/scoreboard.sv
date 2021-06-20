class scoreboard;
      mailbox mon2scb;
      int trans;
      
      function new(mailbox mon2scb);
       this.mon2scb=mon2scb;
      endfunction
    
      task comp();
        transactor tx;
                   mon2scb.get(tx);
            if((tx.a+tx.b+tx.cin)==tx.c)
              $display("Result correct, a=%d, b=%d,cin=%d, c=%d", tx.a,tx.b,tx.cin,tx.c);
            else
              $display("BUG");
          trans++;
              endtask
    endclass
