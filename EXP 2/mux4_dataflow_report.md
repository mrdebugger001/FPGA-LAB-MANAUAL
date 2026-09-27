# 4-to-1 Multiplexer Using Dataflow Modeling

## Aim

To design and verify a 4-to-1 multiplexer in Verilog using dataflow modeling (conditional ternary operator chaining).

## Code

```verilog
module mux4_dataflow (
    input  wire [3:0] d,
    input  wire [1:0] sel,
    output wire        y
);
    assign y = (sel == 2'b00) ? d[0] :
               (sel == 2'b01) ? d[1] :
               (sel == 2'b10) ? d[2] : d[3];
endmodule
```

## Truth Table / Observation

| sel | d[3:0] | y | Selected Input |
|:---:|:---:|:---:|:---:|
| 00 | XXX1 | d[0] | d[0] |
| 01 | XX1X | d[1] | d[1] |
| 10 | X1XX | d[2] | d[2] |
| 11 | 1XXX | d[3] | d[3] |

**Observation:** All 64 test vectors (16 data inputs across 4 select states) were verified in simulation. The ternary conditional operator chain correctly selected the appropriate bit of `d`.

## Conclusion

The 4-to-1 multiplexer was successfully implemented using Verilog dataflow modeling with conditional ternary operators. The continuous assignment produces a clean combinatorial multiplexer circuit.
