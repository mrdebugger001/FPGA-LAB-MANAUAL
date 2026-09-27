# 4-Bit to 2-Bit Priority Encoder — Theory of Operation

## Functional Description

A 4-bit to 2-bit priority encoder is a combinational logic circuit that accepts 4 input lines ($I_3, I_2, I_1, I_0$) and encodes them into a 2-bit binary output ($Y_1, Y_0$) representing the index of the active input. 

In a standard binary encoder, only one input line can be active at a time; if multiple inputs are asserted simultaneously, the output becomes corrupted. A priority encoder overcomes this limitation by assigning a pre-determined priority hierarchy to the inputs. In this specific design, the priority is defined as:

$$\mathbf{I_3 > I_2 > I_1 > I_0}$$

This means that if $I_3$ (the highest priority input) is active, the output is forced to `2'b11` (decimal 3), regardless of whether $I_2, I_1,$ or $I_0$ are active.

### Meaning of "Selected Input"

In the truth table, the **Selected Input** column represents the specific input line that has been granted access to the output encoder by the priority logic. Because multiple inputs can be high (`1`) at the same time in real-world hardware, the priority logic must select exactly one input to encode. For example:
- If the input vector is $1011$ (both $I_3, I_1,$ and $I_0$ are active), the logic selects $I_3$ because it holds the highest priority. The Selected Input is $I_3$, and the output is `2'b11`.
- If the input vector is $0101$ (both $I_2$ and $I_0$ are active), the logic selects $I_2$ because $I_2 > I_0$. The Selected Input is $I_2$, and the output is `2'b10`.

The `valid` output is an active-high status signal that indicates whether any of the inputs are active. It is asserted (`1`) when one or more inputs are `1`, and cleared (`0`) only when all inputs are `0` (`4'b0000`). When `valid` is `0`, the state of the outputs $Y_1, Y_0$ is considered a "don't care" ($X$) in logic design, as no valid request is being made.

## Circuit Diagram

<div style="background-color: white; padding: 20px; display: inline-block; border: 1px solid #ddd;">
<svg width="600" height="420" viewBox="0 0 600 420" xmlns="http://www.w3.org/2000/svg">
  <!-- Inputs -->
  <text x="20" y="55" font-family="Arial, sans-serif" font-size="14" font-weight="bold">I3</text>
  <text x="20" y="115" font-family="Arial, sans-serif" font-size="14" font-weight="bold">I2</text>
  <text x="20" y="175" font-family="Arial, sans-serif" font-size="14" font-weight="bold">I1</text>
  <text x="20" y="235" font-family="Arial, sans-serif" font-size="14" font-weight="bold">I0</text>
  
  <!-- Outputs -->
  <text x="540" y="85" font-family="Arial, sans-serif" font-size="14" font-weight="bold">Y1</text>
  <text x="540" y="185" font-family="Arial, sans-serif" font-size="14" font-weight="bold">Y0</text>
  <text x="540" y="325" font-family="Arial, sans-serif" font-size="14" font-weight="bold">valid</text>

  <!-- NOT Gates -->
  <!-- NOT1 (~I3) -->
  <path d="M 80,40 L 100,50 L 80,60 Z" fill="none" stroke="#000" stroke-width="2" />
  <circle cx="104" cy="50" r="4" fill="white" stroke="#000" stroke-width="2" />
  
  <!-- NOT2 (~I2) -->
  <path d="M 140,110 L 160,120 L 140,130 Z" fill="none" stroke="#000" stroke-width="2" />
  <circle cx="164" cy="120" r="4" fill="white" stroke="#000" stroke-width="2" />

  <!-- AND Gates -->
  <!-- AND1 -->
  <path d="M 240,90 L 260,90 A 15,15 0 0,1 260,120 L 240,120 Z" fill="none" stroke="#000" stroke-width="2" />
  
  <!-- AND2 -->
  <path d="M 240,170 L 265,170 A 20,20 0 0,1 265,210 L 240,210 Z" fill="none" stroke="#000" stroke-width="2" />

  <!-- OR Gates -->
  <!-- OR1 -->
  <path d="M 400,65 C 405,65 415,67 425,80 C 415,93 405,95 400,95 C 405,85 405,75 400,65 Z" fill="none" stroke="#000" stroke-width="2" />

  <!-- OR2 -->
  <path d="M 400,165 C 405,165 415,167 425,180 C 415,193 405,195 400,195 C 405,185 405,175 400,165 Z" fill="none" stroke="#000" stroke-width="2" />

  <!-- OR VALID -->
  <path d="M 400,305 C 405,305 415,307 425,330 C 415,353 405,355 400,355 C 405,340 405,320 400,305 Z" fill="none" stroke="#000" stroke-width="2" />

  <!-- Wiring -->
  <!-- I3 to NOT1, OR1, OR2, VALID -->
  <line x1="40" y1="50" x2="80" y2="50" stroke="#000" stroke-width="2" />
  <circle cx="60" cy="50" r="3" fill="#000" />
  <line x1="60" y1="50" x2="60" y2="75" stroke="#000" stroke-width="2" />
  <line x1="60" y1="75" x2="400" y2="75" stroke="#000" stroke-width="2" />
  <circle cx="60" cy="175" r="3" fill="#000" />
  <line x1="60" y1="75" x2="60" y2="175" stroke="#000" stroke-width="2" />
  <line x1="60" y1="175" x2="400" y2="175" stroke="#000" stroke-width="2" />
  <circle cx="60" cy="315" r="3" fill="#000" />
  <line x1="60" y1="175" x2="60" y2="315" stroke="#000" stroke-width="2" />
  <line x1="60" y1="315" x2="400" y2="315" stroke="#000" stroke-width="2" />

  <!-- ~I3 Output -->
  <line x1="108" y1="50" x2="200" y2="50" stroke="#000" stroke-width="2" />
  <line x1="200" y1="50" x2="200" y2="100" stroke="#000" stroke-width="2" />
  <line x1="200" y1="100" x2="240" y2="100" stroke="#000" stroke-width="2" />
  <circle cx="200" cy="100" r="3" fill="#000" />
  <line x1="200" y1="100" x2="200" y2="180" stroke="#000" stroke-width="2" />
  <line x1="200" y1="180" x2="240" y2="180" stroke="#000" stroke-width="2" />

  <!-- I2 to NOT2, AND1, VALID -->
  <line x1="40" y1="110" x2="140" y2="110" stroke="#000" stroke-width="2" />
  <circle cx="120" cy="110" r="3" fill="#000" />
  <line x1="120" y1="110" x2="120" y2="110" stroke="#000" stroke-width="2" />
  <line x1="120" y1="110" x2="240" y2="110" stroke="#000" stroke-width="2" />
  <circle cx="90" cy="110" r="3" fill="#000" />
  <line x1="90" y1="110" x2="90" y2="325" stroke="#000" stroke-width="2" />
  <line x1="90" y1="325" x2="400" y2="325" stroke="#000" stroke-width="2" />

  <!-- ~I2 Output -->
  <line x1="168" y1="120" x2="185" y2="120" stroke="#000" stroke-width="2" />
  <line x1="185" y1="120" x2="185" y2="190" stroke="#000" stroke-width="2" />
  <line x1="185" y1="190" x2="240" y2="190" stroke="#000" stroke-width="2" />

  <!-- I1 to AND2, VALID -->
  <line x1="40" y1="200" x2="240" y2="200" stroke="#000" stroke-width="2" />
  <circle cx="110" cy="200" r="3" fill="#000" />
  <line x1="110" y1="200" x2="110" y2="335" stroke="#000" stroke-width="2" />
  <line x1="110" y1="335" x2="400" y2="335" stroke="#000" stroke-width="2" />

  <!-- I0 to VALID -->
  <line x1="40" y1="345" x2="400" y2="345" stroke="#000" stroke-width="2" />

  <!-- Internal Gate Wiring -->
  <line x1="275" y1="105" x2="330" y2="105" stroke="#000" stroke-width="2" />
  <line x1="330" y1="105" x2="330" y2="85" stroke="#000" stroke-width="2" />
  <line x1="330" y1="85" x2="400" y2="85" stroke="#000" stroke-width="2" />

  <line x1="285" y1="190" x2="340" y2="190" stroke="#000" stroke-width="2" />
  <line x1="340" y1="190" x2="340" y2="185" stroke="#000" stroke-width="2" />
  <line x1="340" y1="185" x2="400" y2="185" stroke="#000" stroke-width="2" />

  <!-- Final Outputs -->
  <line x1="425" y1="80" x2="530" y2="80" stroke="#000" stroke-width="2" />
  <line x1="425" y1="180" x2="530" y2="180" stroke="#000" stroke-width="2" />
  <line x1="425" y1="330" x2="530" y2="330" stroke="#000" stroke-width="2" />
</svg>
</div>

<figcaption>
Figure: Gate-level hardware representation of the implemented RTL.
</figcaption>

### Gate-Level Structure Description
- **NOT Gate 1** inverts $I_3$ to produce $\overline{I_3}$, which acts as a disabling mask for lower-priority terms.
- **NOT Gate 2** inverts $I_2$ to produce $\overline{I_2}$, which masks inputs of lower priority than $I_2$.
- **2-Input AND Gate** combines $\overline{I_3}$ and $I_2$ to assert output $Y_1$ when $I_2$ is high and $I_3$ is inactive.
- **3-Input AND Gate** combines $\overline{I_3}$, $\overline{I_2}$, and $I_1$ to assert output $Y_0$ when $I_1$ is high and both higher-priority inputs ($I_3, I_2$) are inactive.
- **OR Gates** sum the masked terms with the highest priority input ($I_3$) to compute the final binary codes $Y_1$ and $Y_0$.
- **4-Input OR Gate** monitors all four input lines to compute the `valid` status signal.

## How It Works, Step by Step

The design process and hardware operation can be broken down into systematic engineering steps:

### Step 1: Formulating the Priority Requirements
We map the physical priority requirement ($I_3 > I_2 > I_1 > I_0$) directly to the output binary codes and the `valid` line:
- If $I_3 = 1 \implies$ Output $Y_1 Y_0 = 11$, `valid = 1` (regardless of $I_2, I_1, I_0$).
- If $I_3 = 0, I_2 = 1 \implies$ Output $Y_1 Y_0 = 10$, `valid = 1` (regardless of $I_1, I_0$).
- If $I_3 = 0, I_2 = 0, I_1 = 1 \implies$ Output $Y_1 Y_0 = 01$, `valid = 1` (regardless of $I_0$).
- If $I_3 = 0, I_2 = 0, I_1 = 0, I_0 = 1 \implies$ Output $Y_1 Y_0 = 00$, `valid = 1`.
- If $I_3 = I_2 = I_1 = I_0 = 0 \implies$ Output $Y_1 Y_0 = XX$ (inactive/don't care), `valid = 0`.

### Step 2: Deriving the Boolean Equations
Using Boolean minimization or algebraic simplification on the priority truth table conditions:
1. **For $Y_1$:**
   $Y_1$ must be active if $I_3$ is high OR if $I_2$ is high while $I_3$ is low.
   $$Y_1 = I_3 + (\overline{I_3} \cdot I_2)$$
   Using the distributive law or the Boolean absorption identity $A + \overline{A}B = A + B$, we can simplify this to:
   $$Y_1 = I_3 + I_2$$
   *Note on RTL:* The Verilog code preserves the form `I3 | ((~I3) & I2)` using dataflow modeling to explicitly document the priority multiplexing structure in hardware gates, though synthesis tools will simplify it to a simple 2-input OR gate.

2. **For $Y_0$:**
   $Y_0$ must be active if $I_3$ is high OR if $I_1$ is high while both $I_3$ and $I_2$ are low.
   $$Y_0 = I_3 + (\overline{I_3} \cdot \overline{I_2} \cdot I_1)$$

3. **For $valid$:**
   The valid signal is active if any of the inputs is high.
   $$valid = I_3 + I_2 + I_1 + I_0$$

### Step 3: Hardware Signal Propagation Trace
To see how the hardware enforces priority on a cycle-by-cycle basis, consider the following physical scenarios:

- **Scenario A: High Priority Active ($I_3 = 1$, $I_2 = 1$, $I_1 = 0$, $I_0 = 1$)**
  1. $I_3 = 1 \implies$ **NOT Gate 1** outputs $\overline{I_3} = 0$.
  2. The term $\overline{I_3} = 0$ is connected to both AND gates. This forces the outputs of both **AND Gates** to $0$, completely masking/disabling $I_2$ and $I_1$.
  3. The **OR Gate for Y1** receives $I_3 = 1$ and AND Gate output $0 \implies Y_1 = 1$.
  4. The **OR Gate for Y0** receives $I_3 = 1$ and AND Gate output $0 \implies Y_0 = 1$.
  5. The **4-input OR Gate** receives $I_3 = 1 \implies valid = 1$.
  6. Final output is `2'b11`, correctly selecting $I_3$ and ignoring the active $I_2$ and $I_0$.

- **Scenario B: Medium Priority Active ($I_3 = 0$, $I_2 = 1$, $I_1 = 1$, $I_0 = 0$)**
  1. $I_3 = 0 \implies$ **NOT Gate 1** outputs $\overline{I_3} = 1$. This enables the lower priority stages.
  2. $I_2 = 1 \implies$ **NOT Gate 2** outputs $\overline{I_2} = 0$. This disables the 3-Input AND Gate, masking $I_1$.
  3. The **2-Input AND Gate** receives $\overline{I_3} = 1$ and $I_2 = 1 \implies$ its output is $1$.
  4. The **OR Gate for Y1** receives $I_3 = 0$ and AND Gate output $1 \implies Y_1 = 1$.
  5. The **OR Gate for Y0** receives $I_3 = 0$ and 3-Input AND Gate output $0 \implies Y_0 = 0$.
  6. The **4-input OR Gate** receives $I_2 = 1 \implies valid = 1$.
  7. Final output is `2'b10`, correctly selecting $I_2$ and masking $I_1$.
