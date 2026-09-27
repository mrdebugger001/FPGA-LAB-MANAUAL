`timescale 1ns/1ps

module mux4_dataflow_tb;
    reg  [3:0] d;
    reg  [1:0] sel;
    wire       y;

    mux4_dataflow dut (.d(d), .sel(sel), .y(y));

    initial begin
        $dumpfile("mux4_dataflow.vcd");
        $dumpvars(0, mux4_dataflow_tb);

        // Test all select lines once with a fixed input pattern (4'b1010)
        d = 4'b1010; 
        
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end
endmodule