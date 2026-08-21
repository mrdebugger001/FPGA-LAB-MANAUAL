`timescale 1ns/1ps

module logic_gates_dataflow_tb;

reg A;
reg B;

wire AND_GATE;
wire OR_GATE;
wire NOT_GATE;
wire NAND_GATE;
wire NOR_GATE;
wire XOR_GATE;
wire XNOR_GATE;

logic_gates_dataflow uut (
    .A(A),
    .B(B),
    .AND_GATE(AND_GATE),
    .OR_GATE(OR_GATE),
    .NOT_GATE(NOT_GATE),
    .NAND_GATE(NAND_GATE),
    .NOR_GATE(NOR_GATE),
    .XOR_GATE(XOR_GATE),
    .XNOR_GATE(XNOR_GATE),
);

initial begin
    $dumpfile("EXP 1/logic_gates_dataflow.vcd");
    $dumpvars(0, logic_gates_dataflow_tb);

    $display("---------------------------------------------------------------");
    $display(" A  B | AND OR NOT NAND NOR XOR XNOR BUFFER");
    $display("---------------------------------------------------------------");
    $monitor(" %b  %b |  %b   %b   %b    %b    %b   %b    %b     %b",
             A, B, AND_GATE, OR_GATE, NOT_GATE, NAND_GATE, NOR_GATE,
             XOR_GATE, XNOR_GATE);

    A = 1'b0; B = 1'b0;
    #10;
    A = 1'b0; B = 1'b1;
    #10;
    A = 1'b1; B = 1'b0;
    #10;
    A = 1'b1; B = 1'b1;
    #10;

    $finish;
end

endmodule
