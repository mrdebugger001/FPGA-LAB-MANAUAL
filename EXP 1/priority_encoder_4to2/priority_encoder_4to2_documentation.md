# VERILOG RTL DESIGN PRACTICAL

## 1. Experiment Title
4-to-2 Priority Encoder Using Dataflow Verilog

## 2. Aim
To design and verify a 4-to-2 priority encoder with `I3` as the highest-priority input.

## 3. Objective
Encode the highest asserted input into `Y1:Y0` and indicate whether any input is active using `valid`.

## 4. Problem Statement
For inputs `I3,I2,I1,I0`, select the highest asserted input. If all inputs are zero, output code `00` and deassert `valid`.

## 5. Hardware Specification
### Inputs
Four one-bit inputs: `I3`, `I2`, `I1`, and `I0`.

### Outputs
Two-bit code `Y1:Y0` and one-bit `valid` flag.


## 6. Theory
A priority encoder produces the binary index of the highest-priority asserted input. Unlike a regular encoder, multiple asserted inputs are allowed; lower-priority inputs do not affect the result once a higher-priority input is active. The `valid` output distinguishes the idle `0000` condition from a valid encoded input.

## 7. Design Requirements
- `1xxx` produces `11, valid=1`.
- `01xx` produces `10, valid=1`.
- `001x` produces `01, valid=1`.
- `0001` produces `00, valid=1`.
- `0000` produces `00, valid=0`.
- RTL must be synthesizable dataflow logic with no clock or reset.

## 8. Hardware Architecture
The architecture consists of three combinational equations. `Y1` is asserted for `I3` or `I2` when `I3` is low. `Y0` is asserted for `I3` or `I1` when both higher inputs are low. `valid` is the OR of all inputs.

## 10. Signal Description
| Signal | Direction | Width | Description |
|--------|-----------|-------|-------------|
| `I3` | input | 1 | Highest-priority input |
| `I2` | input | 1 | Second-priority input |
| `I1` | input | 1 | Third-priority input |
| `I0` | input | 1 | Lowest-priority input |
| `Y1` | output | 1 | Most significant encoded bit |
| `Y0` | output | 1 | Least significant encoded bit |
| `valid` | output | 1 | Indicates at least one active input |


## 15. Verilog RTL Code
```verilog
`timescale 1ns/1ps

module priority_encoder_4to2 (
    input  wire I3, input wire I2, input wire I1, input wire I0,
    output wire Y1, output wire Y0, output wire valid
);
assign Y1 = I3 | ((~I3) & I2);
assign Y0 = I3 | ((~I3) & (~I2) & I1);
assign valid = I3 | I2 | I1 | I0;
endmodule
```

## 16. Testbench
```verilog
for (input_value = 0; input_value < 16; input_value = input_value + 1) begin
    {I3, I2, I1, I0} = input_value[3:0];
    // Expected values are selected in descending priority order.
    #1;
    if ({Y1, Y0, valid} !== {expected_Y1, expected_Y0, expected_valid})
        $fatal(1, "Priority encoder mismatch");
end
```
The complete self-checking testbench is in `priority_encoder_4to2_tb.v`.

## 17. Verification
The testbench applies all 16 binary input combinations, computes the expected priority result, compares all three outputs, prints each result, and calls `$fatal` on any mismatch. The VCD dump captures the complete run.

## 18. Simulation Results
Observed after execution: all 16 input combinations pass, including `0000`, each one-hot input, and all multiple-input priority cases. The terminal table reports actual and expected outputs for every combination.


## 22. Conclusion
A synthesizable dataflow-style 4-to-2 priority encoder was implemented and tested for every possible input combination.
