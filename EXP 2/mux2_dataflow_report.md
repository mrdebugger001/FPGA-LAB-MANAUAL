# 2-to-1 Multiplexer Using Dataflow Modeling

## Aim

To design and verify a 2-to-1 multiplexer in Verilog using dataflow modeling (continuous assignment with boolean operators).

## Code

```verilog
module mux2_dataflow (
    input  wire d0,
    input  wire d1,
    input  wire sel,
    output wire y
);
    assign y = (~sel & d0) | (sel & d1);
endmodule
```

## Truth Table / Observation

| sel | d1 | d0 | y | Selected Input |
|:---:|:---:|:---:|:---:|:---|
| 0 | 0 | 0 | 0 | d0 |
| 0 | 0 | 1 | 1 | d0 |
| 0 | 1 | 0 | 0 | d0 |
| 0 | 1 | 1 | 1 | d0 |
| 1 | 0 | 0 | 0 | d1 |
| 1 | 0 | 1 | 0 | d1 |
| 1 | 1 | 0 | 1 | d1 |
| 1 | 1 | 1 | 1 | d1 |

**Observation:** All 8 test vectors passed in simulation. The continuous assignment equation correctly implements the Boolean sum-of-products expression for a 2-to-1 MUX.

## Conclusion

The 2-to-1 multiplexer was successfully implemented using Verilog dataflow modeling. Continuous assignment provides a concise, gate-level equivalent representation that maps directly onto standard logic cells during synthesis.
