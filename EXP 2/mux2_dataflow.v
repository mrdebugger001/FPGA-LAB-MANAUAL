module mux2_dataflow (
    input  wire d0,
    input  wire d1,
    input  wire sel,
    output wire y
);
    assign y = (~sel & d0) | (sel & d1);
endmodule