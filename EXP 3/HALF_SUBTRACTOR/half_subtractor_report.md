# 1-Bit Half Subtractor Using Dataflow Modeling

## Aim

To design and verify a 1-bit half subtractor in Verilog using dataflow modeling.

## Code

```verilog
module half_subtractor(
    input A,
    input B,
    output Difference,
    output Borrow
);

assign Difference = A ^ B;
assign Borrow = (~A) & B;

endmodule
```

## Truth Table / Observation

| A | B | Difference | Borrow |
|---:|---:|---:|---:|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 |

**Observation:** All 4 input combinations were simulated and matched the expected half-subtractor behavior. The simulation generated `half_subtractor.vcd` and completed at 40 ns.

## Conclusion

The 1-bit half subtractor was successfully implemented using Verilog dataflow modeling. XOR generates the difference, while the inverted minuend combined with the subtrahend generates the borrow. Exact synthesis and timing results were not measured.