module tb_ringcounter;
    reg Xin;
    reg clk;
    reg reset;
    wire Yout;

    SequenceGenerator generator(clk, reset, init, out);

    always #10 clk = ~clk;
    initial
        begin
            $dumpfile("sequence.vcd");
			$dumpvars(0, tb_sequence);
            $monitor($time," %b", Yout);
            reset <= 1;  
            clk <= 0; 
            repeat (1) @ (posedge clk);  
            reset <= 0;  
            Xin <= 1;
            repeat (17) @ (posedge clk);  
            $finish;
        end
endmodule