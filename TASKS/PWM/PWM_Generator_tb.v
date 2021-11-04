module pwm_testbench();
 
    localparam T = 20;
     
    reg clk;
    reg [7:0] DUTY_CYCLE;
    wire pwm;
         
    uut(
        .clk(clk),
        .DUTY_CYCLE(DUTY_CYCLE),
        .PWM_OUT(PWM_OUT)
    );
 
    // generate clock signal    
    always
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
     
    initial
    begin
        // set the duty cycle to 50% (4 is half of 2 ^ 3)
        DUTY_CYCLE = 4;
 
        repeat (3000) @(negedge clk);
                         
        $stop; 
    end   
     
endmodule