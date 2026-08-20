`timescale 1ns/1ps

module mux4_dataflow_tb;
    reg  [3:0] d;
    reg  [1:0] sel;
    wire       y;
    integer    i;

    mux4_dataflow dut (.d(d), .sel(sel), .y(y));

    initial begin
        $dumpfile("mux4_dataflow.vcd");
        $dumpvars(0, mux4_dataflow_tb);

        for (i = 0; i < 16; i = i + 1) begin
            d = i;
            sel = 2'b00;
            #10;
            sel = 2'b01;
            #10;
            sel = 2'b10;
            #10;
            sel = 2'b11;
            #10;
        end

        $finish;
    end
endmodule