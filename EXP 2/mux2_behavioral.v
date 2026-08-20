module mux2_behavioral (
    input  wire d0,
    input  wire d1,
    input  wire sel,
    output reg  y
);
    always @(*) begin
        if (sel == 1'b0)
            y = d0;
        else
            y = d1;
    end
endmodule