module DFlipFlop(D, clk, reset, Q);
    input D, clk, reset;
    output reg Q;

    always @ (posedge clk or posedge reset)
        if(reset) Q <= 0;
        else Q <= D;
endmodule

module SequenceGenerator(Xin, clk, reset, Yout);
    input Xin, clk, reset;
    output Yout;

    wire [2:0] Q;
    wire [2:0] D;

    assign D[2] = (Q[2] & ~Q[0]) | (Q[1] & Q[0]);
    assign D[1] = (Q[1] & ~Q[0]) | (~Q[2] & ~Q[1] & Q[0]);
    assign D[0] = (Q[1] & ~Q[0]) | (Q[2] & ~Q[0]) | (~Q[0] & Xin);

    DFlipFlop d0 (D[0], clk, reset, Q[0]);
    DFlipFlop d1 (D[1], clk, reset, Q[1]);
    DFlipFlop d2 (D[2], clk, reset, Q[2]);

    assign Yout = (Q[2] & Q[0]) | (Q[1] & Q[0]);
endmodule