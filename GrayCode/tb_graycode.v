module tb_graycode;
    reg clk;
    reg reset;
    wire [3:0] out;
    
    GrayCodeCounter counter(clk, reset, out);

    always #10 clk = ~clk;
    initial
        begin
            $dumpfile("graycode.vcd");
			$dumpvars(0, tb_graycode);
            $monitor($time," %b", out);
            reset <= 1;  
            clk <= 0; 
            repeat (1) @ (posedge clk);  
            reset <= 0;  
            repeat (17) @ (posedge clk);  
            $finish;
        end
endmodule