# 4-to-1 Multiplexer Using Behavioral Modeling

## Aim

To design and verify a 4-to-1 multiplexer in Verilog using behavioral modeling (`case` statement inside an `always @(*)` block).

## Code

```verilog
module mux4_behavioral (
    input  wire [3:0] d,
    input  wire [1:0] sel,
    output reg        y
);
    always @(*) begin
        case (sel)
            2'b00: y = d[0];
            2'b01: y = d[1];
            2'b10: y = d[2];
            2'b11: y = d[3];
            default: y = 1'bx;
        endcase
    end
endmodule
```

## Truth Table / Observation

| sel | d[3:0] | y | Selected Input |
|:---:|:---:|:---:|:---:|
| 00 | XXX1 | d[0] | d[0] |
| 01 | XX1X | d[1] | d[1] |
| 10 | X1XX | d[2] | d[2] |
| 11 | 1XXX | d[3] | d[3] |

**Observation:** Tested with all 16 data values across all 4 select states (64 total test vectors). The output `y` correctly selects `d[0]`, `d[1]`, `d[2]`, or `d[3]` matching the 2-bit binary value of `sel`.

## Conclusion

The 4-to-1 multiplexer was successfully implemented using behavioral modeling with a `case` statement. Simulation results verify that the correct data bit is routed to the output for every select combination.
