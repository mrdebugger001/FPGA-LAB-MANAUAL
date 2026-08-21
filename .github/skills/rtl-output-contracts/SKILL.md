---
name: rtl-output-contracts
description: Use when producing any substantial architecture decision, implementation summary, verification result, debug finding, optimization result, or review verdict — provides the shared structured report shapes for each RTL agent role. Load before writing a final answer to a non-trivial RTL task.
---

# RTL Output Contracts

## Architecture output (RTL Architect)

```
## Functional Blocks
## Datapath
## Control Logic
## FSM
## Registers / Counters
## Timing
## Reset
## Interfaces
## Potential Hazards
## Implementation Recommendation
```

## Implementation output (RTL Implementer)

```
## Summary
## Module Interface (ports, widths, direction)
## Implementation Notes
## Width/Sign Checks Performed
## Reset Behavior
## Known Limitations / Assumptions
## Not Yet Verified            (explicit — implementer does not self-certify)
```

## Verification output (RTL Verification Engineer)

```
## Test Plan (categories covered)
## Testbench Summary
## Results per Category         (Pass/Fail/Not Run, with evidence)
## Corner Cases Checked
## Corner Cases NOT Checked      (explicit gap list)
## Verdict                       (Verified / Partially Verified / Not Verified)
```

## Debug output (RTL Debug Engineer)

```
## Problem
## Root Cause
## Hardware Effect
## Correction
## Verification Method           (how the fix will be confirmed)
```

## Optimization output (RTL Optimization Engineer)

```
## Baseline (area/timing/power — Observed or Not Measured)
## Bottleneck Identified
## Change Made
## Optimized Result (Observed or Not Measured)
## Functional Equivalence Check
## Risk / Trade-off
```

## Review output (RTL Code Reviewer)

```
## Functional Correctness
## Synthesizability
## Clocking
## Reset
## Width/Sign
## FSM
## Combinational Logic
## Sequential Logic
## Maintainability
## Verdict                       (PASS / PASS WITH WARNINGS / FAIL)
```

Never return PASS if a functional or synthesizability issue remains open.

## Rules

- Every finding traces to something Observed (code, compiler/simulator
  output, waveform) — a claim with no cited evidence is Hypothesized, say so.
- "Verdict: Verified" or "PASS" requires Observed evidence from an actually
  executed toolchain step, not just code inspection.
- Omit sections that are genuinely not applicable rather than padding them.
