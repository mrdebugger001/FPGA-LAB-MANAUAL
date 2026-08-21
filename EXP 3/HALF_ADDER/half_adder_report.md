# 1-Bit Half Adder Using Dataflow Modeling

## Aim

To design and verify a 1-bit half adder in Verilog using dataflow modeling.

## Code

```verilog
module half_adder(
    input A,
    input B,
    output Sum,
    output Carry
);

assign Sum = A ^ B;
assign Carry = A & B;

endmodule
```

## Truth Table / Observation

| A | B | Sum | Carry |
|---:|---:|---:|---:|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

**Observation:** All 4 input combinations were simulated and matched the expected half-adder behavior. The simulation generated `wave.vcd` and completed at 40 ns.

## Conclusion

The 1-bit half adder was successfully implemented using Verilog dataflow modeling. XOR generates the sum and AND generates the carry. Exact synthesis and timing results were not measured.