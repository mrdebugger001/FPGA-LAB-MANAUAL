# 1-Bit Full Subtractor Using Dataflow Modeling

## Aim

To design and verify a 1-bit full subtractor in Verilog using dataflow modeling.

## Code

```verilog
module full_subtractor(
    input A,
    input B,
    input Bin,
    output Difference,
    output Borrow
);

assign Difference = A ^ B ^ Bin;

assign Borrow = ((~A) & B) | ((~A) & Bin) | (B & Bin);

endmodule
```

## Truth Table / Observation

| A | B | Bin | Difference | Borrow |
|---:|---:|---:|---:|---:|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 1 |
| 0 | 1 | 0 | 1 | 1 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 0 |
| 1 | 1 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 | 1 |

**Observation:** All 8 input combinations were simulated and matched the expected full-subtractor behavior. The simulation generated `full_subtractor.vcd` and completed at 80 ns.

## Conclusion

The 1-bit full subtractor was successfully implemented using Verilog dataflow modeling. The XOR network produces the difference, and the borrow equation correctly identifies when subtraction requires a borrow. 