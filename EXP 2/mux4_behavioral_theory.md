# 4-to-1 Multiplexer (Behavioral) — Theory of Operation

## Functional Description

A 4-to-1 multiplexer routes one of four 1-bit data inputs (`d[3:0]`) to a single output `y` based on a 2-bit select code (`sel[1:0]`). Behavioral modeling using `case` constructs provides clean, readable code for multi-way conditional routing, which synthesis tools automatically translate into efficient multiplexer trees (e.g., cascading 2-to-1 MUXes or LUT logic).

## Circuit Diagram

```mermaid
graph LR
    subgraph Data Inputs
        d0[d[0]]
        d1[d[1]]
        d2[d[2]]
        d3[d[3]]
    end

    sel[sel[1:0]] --> MUX[MUX 4-to-1]
    d0 --> MUX
    d1 --> MUX
    d2 --> MUX
    d3 --> MUX
    MUX --> y[y]
```

## How It Works, Step by Step

1. **Procedural Evaluation**: The `always @(*)` block monitors `d` and `sel`. Whenever a change occurs, the block executes.
2. **Case Branching**: The `case(sel)` statement checks the 2-bit binary value of `sel`:
   - `2'b00`: Routes `d[0]` to `y`.
   - `2'b01`: Routes `d[1]` to `y`.
   - `2'b10`: Routes `d[2]` to `y`.
   - `2'b11`: Routes `d[3]` to `y`.
3. **Default Safeguard**: The `default` clause assigns `1'bx` to prevent unintended inferred latches in case of unexpected input states.
