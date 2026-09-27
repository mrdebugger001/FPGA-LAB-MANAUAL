# 1-Bit Full Adder Using Dataflow Modeling

## Aim

To design and verify a 1-bit full adder in Verilog using dataflow modeling.

## Code

```verilog
module full_adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Carry
);

assign Sum = A ^ B ^ Cin;
assign Carry = (A & B) | (B & Cin) | (A & Cin);

endmodule
```

## Truth Table / Observation

| A | B | Cin | Sum | Carry |
|---:|---:|---:|---:|---:|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

**Observation:** All 8 input combinations were simulated and matched the expected full-adder truth table. The simulation generated `full_adder.vcd` and completed at 80 ns.

## Conclusion

The 1-bit full adder was successfully implemented using Verilog dataflow modeling. The `Sum` output correctly represents odd input parity, and the `Carry` output is high whenever at least two inputs are high.