# 2-to-1 Multiplexer Using Behavioral Modeling

## Aim

To design and verify a 2-to-1 multiplexer in Verilog using behavioral modeling (`always @(*)` and conditional logic).

## Code

```verilog
module mux2_behavioral (
    input  wire d0,
    input  wire d1,
    input  wire sel,
    output reg  y
);
    always @(*) begin
        if (sel == 1'b0)
            y = d0;
        else
            y = d1;
    end
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

**Observation:** All 8 input/select combinations were tested via simulation. The output `y` correctly tracks `d0` when `sel = 0` and `d1` when `sel = 1`.

## Conclusion

The 2-to-1 multiplexer was successfully implemented using behavioral modeling with procedural `if-else` constructs inside an `always @(*)` block. Simulation confirms correct selection behavior across all input test vectors.
