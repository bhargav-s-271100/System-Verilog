
//transactor
class transactor;
  randc bit [3:0]a,b;
  randc bit cin;
  bit valid;
  bit [4:0] c;
endclass

//generator
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

//driver
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

//monitor class
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

//scoreboard
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
      $display("Result correct, a=%d, b=%d,cin=%d, c=%d",tx.a,tx.b,tx.cin,tx.c);
    else
      $display("BUG");
    trans++;
  endtask
endclass

//environment class
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

//test class
program test(inter.tb T1);
  environment env;
  initial
    begin
      env=new(T1);
      env.build();
      env.start();
    end
endprogram