class environment;
      virtual inter intf;
      mailbox drv2scb;
      mailbox gen2drv;
      mailbox mon2scb;
      
      generator gen;
      driver drv;
      monitor mon;
      scoreboard scb;
      
      function new(virtual inter intf);
        this.intf=intf;
      endfunction
      function void build();
        drv2scb=new();
        gen2drv=new();
        mon2scb=new();
        
        gen=new(gen2drv,intf);
        drv=new(intf,gen2drv,drv2scb);
        mon=new(intf,mon2scb);
        scb=new(mon2scb);
      endfunction      
 task rst();
        intf.reset<=0;
        #10 intf.reset<=1;
        #10 intf.reset<=0;
      endtask
      
      task start();
        rst();
        fork
          gen.create();    
          drv.drive_data();
          mon.samp_values();
          scb.comp();
        join
      endtask
    endclass
