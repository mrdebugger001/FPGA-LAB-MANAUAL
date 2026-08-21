`timescale 1ns/1ps

module logic_gates_dataflow (
    input  wire A,
    input  wire B,
    output wire AND_GATE,
    output wire OR_GATE,
    output wire NOT_GATE,
    output wire NAND_GATE,
    output wire NOR_GATE,
    output wire XOR_GATE,
    output wire XNOR_GATE,
    output wire BUFFER_GATE
);

assign AND_GATE    = A & B;
assign OR_GATE     = A | B;
assign NOT_GATE    = ~A;
assign NAND_GATE   = ~(A & B);
assign NOR_GATE    = ~(A | B);
assign XOR_GATE    = A ^ B;
assign XNOR_GATE   = ~(A ^ B);


endmodule
