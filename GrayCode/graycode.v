module SRFlipFlop(S, R, clk, reset, Q);
    input S, R, clk, reset;
    output reg Q;

    always @(posedge clk or posedge reset)
        if(reset) Q <= 0;
        else begin
        case ({S,R})
            2'b00 :  Q <= Q;  
            2'b01 :  Q <= 0;
            2'b10 :  Q <= 1;
          endcase 
        end
endmodule

module GrayCodeCounter(clk, reset, out);
    input clk, reset;
    output [3:0] out;

    wire [3:0] Q;
    wire [3:0] S;
    wire [3:0] R;

    assign S[3] = (Q[2] & ~Q[1] & ~Q[0]);
    assign R[3] =(~Q[2] & ~Q[1] & ~Q[0]);

    assign S[2] = (~Q[3] & Q[1] & ~Q[0]);
    assign R[2] = (Q[3] & Q[1] & ~Q[0]);

    assign S[1] = (~Q[3] & ~Q[2] & Q[0]) | (Q[3] & Q[2] & Q[0]);
    assign R[1] = (~Q[3] & Q[2] & Q[0]) | (Q[3] & ~Q[2] & Q[0]);
    
    assign S[0] = (~Q[3] & ~Q[2] & ~Q[1]) | (~Q[3] & Q[2] & Q[1]) | (Q[3] & ~Q[2] & Q[1]) | (Q[3] & Q[2]& ~Q[1]);
    assign R[0] = (~Q[3] & ~Q[2] & Q[1]) | (~Q[3] & Q[2] & ~Q[1]) | (Q[3] & ~Q[2] & ~Q[1]) | (Q[3] & Q[2] & Q[1]);

    SRFlipFlop sr0 (S[0], R[0], clk, reset, Q[0]);
    SRFlipFlop sr1 (S[1], R[1], clk, reset, Q[1]);
    SRFlipFlop sr2 (S[2], R[2], clk, reset, Q[2]);
    SRFlipFlop sr3 (S[3], R[3], clk, reset, Q[3]);

    assign out=Q;
endmodule
