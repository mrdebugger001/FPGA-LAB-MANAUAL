# 4-Bit to 2-Bit Priority Encoder — Theory of Operation

## Functional Description

A 4-bit to 2-bit priority encoder is a combinational circuit that accepts four input lines, \(I_3, I_2, I_1, I_0\), and produces a 2-bit encoded output \(Y_1Y_0\). The priority order in this implementation is \(I_3 > I_2 > I_1 > I_0\), so a higher-priority active input masks all lower-priority inputs.

The `valid` output indicates whether at least one input is active. When \(I_3\) is active, the encoded output is `11`; when \(I_3=0\) and \(I_2=1\), it is `10`; when only the lower-priority conditions are satisfied, the encoder produces the corresponding lower code. With all inputs low, `valid=0` and \(Y_1Y_0\) is treated as don't-care by the priority specification.

The circuit diagram below represents the explicit gate-level structure used by the RTL: two NOT gates generate the priority masks, AND gates form the masked lower-priority terms, OR gates form \(Y_1\) and \(Y_0\), and a 4-input OR generates `valid`. This is an RTL-derived structural representation; synthesis may legally simplify equivalent Boolean expressions.

## Circuit Diagram

<figure>
<svg xmlns="http://www.w3.org/2000/svg" width="1500" height="850" viewBox="0 0 1500 850" role="img" aria-label="RTL-derived gate-level schematic for a 4-bit to 2-bit priority encoder">
<style>
  .bg{fill:#ffffff;stroke:#d0d0d0;stroke-width:1.5}
  .wire{fill:none;stroke:#222;stroke-width:2.6;stroke-linecap:square;stroke-linejoin:miter}
  .gate{fill:#fafafa;stroke:#111;stroke-width:2.2;stroke-linejoin:round}
  .bubble{fill:#fff;stroke:#111;stroke-width:2.2}
  .junction{fill:#111}
  .io{fill:#fff;stroke:#111;stroke-width:2.2}
  .label{font-family:Arial,Helvetica,sans-serif;font-size:20px;fill:#111}
  .small{font-family:Arial,Helvetica,sans-serif;font-size:17px;fill:#333}
  .gate_label{font-family:Arial,Helvetica,sans-serif;font-size:16px;font-weight:600;fill:#111}
  .title{font-family:Arial,Helvetica,sans-serif;font-size:23px;font-weight:700;fill:#111}
  .section{font-family:Arial,Helvetica,sans-serif;font-size:18px;font-weight:700;fill:#333}
</style>
<rect x="0.75" y="0.75" width="1498.5" height="848.5" rx="8" class="bg"/>
<text x="40" y="42" class="title" text-anchor="start">4-Bit to 2-Bit Priority Encoder — RTL-Derived Gate-Level Schematic</text>
<text x="40" y="72" class="section" text-anchor="start">Priority: I3 &gt; I2 &gt; I1 &gt; I0</text>
<text x="65" y="120" class="section" text-anchor="start">INPUTS</text>
<text x="1125" y="120" class="section" text-anchor="start">OUTPUTS</text>
<circle cx="90" cy="180" r="22" class="io"/><text x="90" y="187" class="label" text-anchor="middle">I3</text><circle cx="90" cy="320" r="22" class="io"/><text x="90" y="327" class="label" text-anchor="middle">I2</text><circle cx="90" cy="460" r="22" class="io"/><text x="90" y="467" class="label" text-anchor="middle">I1</text><circle cx="90" cy="600" r="22" class="io"/><text x="90" y="607" class="label" text-anchor="middle">I0</text><path d="M 112 180 H 150" class="wire"/><path d="M 112 320 H 150" class="wire"/><path d="M 112 460 H 150" class="wire"/><path d="M 112 600 H 150" class="wire"/><path d="M 200 153.0 L 270 180 L 200 207.0 Z" class="gate"/><path d="M 145 180 H 200" class="wire"/><circle cx="279" cy="180" r="9" class="bubble"/><text x="232.0" y="186" class="gate_label" text-anchor="middle">NOT</text><path d="M 150 180 H 200" class="wire"/><path d="M 200 293.0 L 270 320 L 200 347.0 Z" class="gate"/><path d="M 145 320 H 200" class="wire"/><circle cx="279" cy="320" r="9" class="bubble"/><text x="232.0" y="326" class="gate_label" text-anchor="middle">NOT</text><path d="M 150 320 H 200" class="wire"/><text x="285" y="167" class="small" text-anchor="start">~I3</text><text x="285" y="307" class="small" text-anchor="start">~I2</text><path d="M 430 199.0 L 494.8 199.0 C 554.2 199.0 554.2 281.0 494.8 281.0 L 430 281.0 Z" class="gate"/><path d="M 375 226.0 H 430" class="wire"/><path d="M 375 254.0 H 430" class="wire"/><text x="486.7" y="246" class="gate_label" text-anchor="middle">AND</text><path d="M 430 365.0 L 502.0 365.0 C 568.0 365.0 568.0 475.0 502.0 475.0 L 430 475.0 Z" class="gate"/><path d="M 375 392.0 H 430" class="wire"/><path d="M 375 420.0 H 430" class="wire"/><path d="M 375 448.0 H 430" class="wire"/><text x="493.0" y="426" class="gate_label" text-anchor="middle">AND</text><path d="M 279 180 H 340" class="wire"/><path d="M 340 180 V 226.0" class="wire"/><path d="M 340 226.0 H 375" class="wire"/><path d="M 340 180 V 392.0" class="wire"/><path d="M 340 392.0 H 375" class="wire"/><circle cx="340" cy="180" r="4" class="junction"/><path d="M 150 320 H 360" class="wire"/><path d="M 360 320 V 254.0" class="wire"/><path d="M 360 254.0 H 375" class="wire"/><path d="M 150 320 V 680" class="wire"/><path d="M 150 680 H 1030" class="wire"/><circle cx="150" cy="320" r="4" class="junction"/><path d="M 279 320 H 320" class="wire"/><path d="M 320 320 V 420.0" class="wire"/><path d="M 320 420.0 H 375" class="wire"/><path d="M 150 460 H 350" class="wire"/><path d="M 350 460 V 448.0" class="wire"/><path d="M 350 448.0 H 375" class="wire"/><path d="M 350 460 V 710" class="wire"/><path d="M 350 710 H 1030" class="wire"/><circle cx="350" cy="460" r="4" class="junction"/><path d="M 150 600 H 390" class="wire"/><path d="M 390 600 V 740" class="wire"/><path d="M 390 740 H 1030" class="wire"/><path d="M 760 190.0 C 796.0 194.0, 838.0 198.0, 910 240 C 838.0 282.0, 796.0 286.0, 760 290.0 C 790.0 250, 790.0 230, 760 190.0 Z" class="gate"/><path d="M 705 228.0 H 760" class="wire"/><path d="M 705 252.0 H 760" class="wire"/><text x="823.0" y="246" class="gate_label" text-anchor="middle">OR</text><path d="M 760 370.0 C 796.0 374.0, 838.0 378.0, 910 420 C 838.0 462.0, 796.0 466.0, 760 470.0 C 790.0 430, 790.0 410, 760 370.0 Z" class="gate"/><path d="M 705 408.0 H 760" class="wire"/><path d="M 705 432.0 H 760" class="wire"/><text x="823.0" y="426" class="gate_label" text-anchor="middle">OR</text><path d="M 1020 615.0 C 1056.0 619.0, 1098.0 623.0, 1170 690 C 1098.0 757.0, 1056.0 761.0, 1020 765.0 C 1050.0 700, 1050.0 680, 1020 615.0 Z" class="gate"/><path d="M 965 654.0 H 1020" class="wire"/><path d="M 965 678.0 H 1020" class="wire"/><path d="M 965 702.0 H 1020" class="wire"/><path d="M 965 726.0 H 1020" class="wire"/><text x="1083.0" y="696" class="gate_label" text-anchor="middle">OR</text><path d="M 150 180 V 90" class="wire"/><path d="M 150 90 H 670" class="wire"/><path d="M 670 90 V 228.0" class="wire"/><path d="M 670 228.0 H 705" class="wire"/><path d="M 670 90 V 408.0" class="wire"/><path d="M 670 408.0 H 705" class="wire"/><circle cx="670" cy="90" r="4" class="junction"/><path d="M 670 90 H 980" class="wire"/><path d="M 980 90 V 654.0" class="wire"/><path d="M 980 654.0 H 965" class="wire"/><path d="M 565 240 V 252.0" class="wire"/><path d="M 580 420 V 432.0" class="wire"/><path d="M 910 240 H 1150" class="wire"/><circle cx="1200" cy="240" r="24" class="io"/><text x="1200" y="247" class="label" text-anchor="middle">Y1</text><path d="M 910 420 H 1150" class="wire"/><circle cx="1200" cy="420" r="24" class="io"/><text x="1200" y="427" class="label" text-anchor="middle">Y0</text><circle cx="1200" cy="690" r="24" class="io"/><text x="1200" y="697" class="label" text-anchor="middle">valid</text><path d="M 1170 690 H 1176" class="wire"/><text x="40" y="805" class="small" text-anchor="start">Gate symbols follow ANSI-style digital logic conventions; schematic mirrors the explicit priority-masking structure represented by the RTL.</text></svg>
<figcaption><strong>Figure:</strong> RTL-derived gate-level schematic using standard ANSI-style NOT, AND, and OR symbols.</figcaption>
</figure>

## How It Works, Step by Step

1. **Generate the priority masks.** The first NOT gate produces \(\overline{I_3}\). The second produces \(\overline{I_2}\). These inverted signals prevent lower-priority inputs from contributing when a higher-priority input is active.

2. **Form the \(I_2\) term.** The 2-input AND gate combines \(\overline{I_3}\) and \(I_2\). Its output is therefore \(1\) only when \(I_2\) is active while the higher-priority input \(I_3\) is inactive:
   \[
   \overline{I_3} \cdot I_2
   \]

3. **Form the \(I_1\) term.** The 3-input AND gate combines \(\overline{I_3}\), \(\overline{I_2}\), and \(I_1\). It becomes \(1\) only when both higher-priority inputs are inactive and \(I_1\) is active:
   \[
   \overline{I_3}\cdot\overline{I_2}\cdot I_1
   \]

4. **Generate \(Y_1\).** The upper OR gate combines \(I_3\) with the masked \(I_2\) term:
   \[
   Y_1 = I_3 + (\overline{I_3}\cdot I_2)
   \]
   Thus \(Y_1\) is asserted for either the highest-priority input \(I_3\) or the next-priority input \(I_2\) when \(I_3\) is inactive.

5. **Generate \(Y_0\).** The lower OR gate combines \(I_3\) with the masked \(I_1\) term:
   \[
   Y_0 = I_3 + (\overline{I_3}\cdot\overline{I_2}\cdot I_1)
   \]
   Therefore \(Y_0\) is high for \(I_3\), or for \(I_1\) when both higher-priority inputs are low.

6. **Generate `valid`.** The 4-input OR receives \(I_3\), \(I_2\), \(I_1\), and \(I_0\):
   \[
   valid = I_3 + I_2 + I_1 + I_0
   \]
   Consequently, `valid` becomes `1` whenever any request is present.

7. **Priority behavior.** For example, with \(I_3I_2I_1I_0=1011\), \(\overline{I_3}=0\), which disables both lower-priority AND paths. The two output OR gates therefore receive \(I_3=1\), giving \(Y_1Y_0=11\), while `valid=1`.
