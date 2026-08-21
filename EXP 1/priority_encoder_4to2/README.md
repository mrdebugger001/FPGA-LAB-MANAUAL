# 4-to-2 Priority Encoder

## Purpose

This practical implements a 4-to-2 priority encoder using dataflow-style
Verilog. Input `I3` has the highest priority and `I0` has the lowest.

## Interface

| Signal | Direction | Description |
|--------|-----------|-------------|
| `I3:I0` | input | Four priority inputs; `I3` is highest |
| `Y1:Y0` | output | Two-bit encoded output |
| `valid` | output | `1` when any input is asserted |

## Truth Table

| Inputs | Y1 | Y0 | valid |
|--------|----|----|-------|
| `1xxx` | 1 | 1 | 1 |
| `01xx` | 1 | 0 | 1 |
| `001x` | 0 | 1 | 1 |
| `0001` | 0 | 0 | 1 |
| `0000` | 0 | 0 | 0 |

`x` means the lower-priority inputs are ignored.

## Compile and Run

From the workspace root:

```text
iverilog -g2012 -o "EXP 1/priority_encoder_4to2/priority_encoder_4to2_sim" "EXP 1/priority_encoder_4to2/priority_encoder_4to2.v" "EXP 1/priority_encoder_4to2/priority_encoder_4to2_tb.v"
vvp "EXP 1/priority_encoder_4to2/priority_encoder_4to2_sim"
```

The testbench creates `priority_encoder_4to2.vcd`. View it with:

```text
gtkwave "EXP 1/priority_encoder_4to2/priority_encoder_4to2.vcd"
```