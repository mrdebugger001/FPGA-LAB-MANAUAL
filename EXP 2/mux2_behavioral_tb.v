`timescale 1ns/1ps

module mux2_behavioral_tb;
    reg  d0, d1, sel;
    wire y;
    integer i;

    mux2_behavioral dut (.d0(d0), .d1(d1), .sel(sel), .y(y));

    initial begin
        $dumpfile("mux2_behavioral.vcd");
        $dumpvars(0, mux2_behavioral_tb);

        for (i = 0; i < 8; i = i + 1) begin
            {d1, d0, sel} = i;
            #10;
        end

        $finish;
    end
endmodule