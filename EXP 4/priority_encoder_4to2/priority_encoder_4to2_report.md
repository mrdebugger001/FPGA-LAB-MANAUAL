# 4-Bit to 2-Bit Priority Encoder Using Dataflow Modeling

## Aim

To design and verify a 4-bit-to-2-bit priority encoder in Verilog using dataflow modeling.

## Code

```verilog
`timescale 1ns/1ps

module priority_encoder_4to2 (
    input  wire I3,
    input  wire I2,
    input  wire I1,
    input  wire I0,
    output wire Y1,
    output wire Y0,
    output wire valid
);

assign Y1    = I3 | ((~I3) & I2);
assign Y0    = I3 | ((~I3) & (~I2) & I1);
assign valid = I3 | I2 | I1 | I0;

endmodule
```

## Truth Table / Observation

Priority: **I3 > I2 > I1 > I0**

| I3 | I2 | I1 | I0 | Selected Input | Y1 | Y0 | Valid |
|---:|---:|---:|---:|---|---:|---:|---:|
| 0 | 0 | 0 | 0 | None | 0 | 0 | 0 |
| 0 | 0 | 0 | 1 | I0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 0 | I1 | 0 | 1 | 1 |
| 0 | 0 | 1 | 1 | I1 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 | I2 | 1 | 0 | 1 |
| 0 | 1 | 0 | 1 | I2 | 1 | 0 | 1 |
| 0 | 1 | 1 | 0 | I2 | 1 | 0 | 1 |
| 0 | 1 | 1 | 1 | I2 | 1 | 0 | 1 |
| 1 | 0 | 0 | 0 | I3 | 1 | 1 | 1 |
| 1 | 0 | 0 | 1 | I3 | 1 | 1 | 1 |
| 1 | 0 | 1 | 0 | I3 | 1 | 1 | 1 |
| 1 | 0 | 1 | 1 | I3 | 1 | 1 | 1 |
| 1 | 1 | 0 | 0 | I3 | 1 | 1 | 1 |
| 1 | 1 | 0 | 1 | I3 | 1 | 1 | 1 |
| 1 | 1 | 1 | 0 | I3 | 1 | 1 | 1 |
| 1 | 1 | 1 | 1 | I3 | 1 | 1 | 1 |

**Observation:** All 16 input combinations were tested and matched the expected priority encoding.

## Conclusion

The 4-bit-to-2-bit priority encoder was successfully implemented using Verilog dataflow modeling. The highest-priority active input is correctly encoded at the output, and the `valid` signal correctly indicates whether any input is active. All 16 input combinations passed simulation.
