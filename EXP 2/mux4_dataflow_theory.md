# 4-to-1 Multiplexer (Dataflow) — Theory of Operation

## Functional Description

The 4-to-1 multiplexer implemented via dataflow modeling uses nested conditional ternary operators (`? :`). This provides a compact, continuous-assignment equivalent to a multi-way `case` statement. 

Mathematically, the output is selected as:
$$y = (\overline{sel_1} \cdot \overline{sel_0} \cdot d_0) + (\overline{sel_1} \cdot sel_0 \cdot d_1) + (sel_1 \cdot \overline{sel_0} \cdot d_2) + (sel_1 \cdot sel_0 \cdot d_3)$$

## Circuit Diagram

```mermaid
graph LR
    subgraph Data Inputs
        d0[d[0]]
        d1[d[1]]
        d2[d[2]]
        d3[d[3]]
    end

    sel[sel[1:0]] --> MUX[MUX 4-to-1 Dataflow]
    d0 --> MUX
    d1 --> MUX
    d2 --> MUX
    d3 --> MUX
    MUX --> y[y]
```

## How It Works, Step by Step

1. **First Condition (`sel == 2'b00`)**: If true, `y` takes the value of `d[0]`.
2. **Second Condition (`sel == 2'b01`)**: If true, `y` takes `d[1]`.
3. **Third Condition (`sel == 2'b10`)**: If true, `y` takes `d[2]`.
4. **Default/Else Branch (`d[3]`)**: If none of the above conditions match (i.e., `sel == 2'b11`), `y` defaults to `d[3]`.
5. **Hardware Mapping**: The continuous assignment compiles into a set of multiplexer select gates that continuously evaluate input changes with zero propagation delay modeled ideally.
