class Base;

    rand integer Var;
    constraint range { Var < 100 ; Var > 0 ;}

endclass


class baseA extends Base;

    constraint range { Var < 150 ; Var > 50 ;} // Overrighting the Base class constraints.

endclass


program main;
    baseA obj1;

    initial begin
        obj1= new();
        for(int i=0 ; i < 100 ; i++)
            if(obj1.randomize())
                $display(" Randomization sucsessfull : Var = %0d ",obj1.Var);
            else
                $display("Randomization failed");
    end

endprogram