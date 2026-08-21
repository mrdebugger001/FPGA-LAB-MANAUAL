---
name: verification-checklist
description: Use when creating or reviewing a testbench, or judging whether an RTL design's verification is adequate — provides the minimum verification categories every design must cover and what counts as evidence vs. a bare compile pass. Load before writing a testbench or issuing a verification verdict.
---

# Verification Checklist

Compilation succeeding is not verification. A design is only "Verified"
when there's Observed simulation (or, where available, formal/assertion)
evidence for each applicable category below.

## Minimum categories

```
Normal operation           — the design's core intended behavior
Boundary conditions        — min/max valid inputs, edge-of-range values
Reset behavior             — correct state immediately after reset release
Repeated operation         — back-to-back operations, no residual state bugs
Invalid inputs             — how the design behaves on out-of-spec input
Maximum values              — widest/largest representable values
Minimum values               — zero, smallest representable values
Transition conditions        — FSM state changes, handshake edges
Timing-sensitive cases       — back-to-back clock edges, setup/hold-adjacent scenarios in simulation
```

Not every category applies to every design (e.g. a purely combinational
block has no "reset behavior" category) — state explicitly which
categories were judged not applicable and why, rather than silently
omitting them.

## What counts as evidence

- A testbench run with a pass/fail result captured this session — Observed.
- A waveform inspected and matching expected behavior — Observed.
- An assertion (SVA or simple `if`-based check) that fired or didn't —
  Observed.
- "The logic looks correct by inspection" — Hypothesized, not Verified.

## Testbench structure expectations

A minimally complete testbench includes: clock generation, an explicit
reset sequence, directed stimulus for each category above, a way to
detect pass/fail (self-checking preferred over eyeballing waveforms), and
coverage of at least one full operational cycle of the design's intended
use (e.g. a counter wrapping around, a FIFO filling and draining, an FSM
completing a full state cycle).

## Verdict rules

- **Verified**: all applicable categories have Observed evidence.
- **Partially Verified**: some categories Observed, others Not Run/Unknown
  — list exactly which.
- **Not Verified**: little or no Observed evidence beyond compilation.

Never round "Partially Verified" up to "Verified" for the sake of a clean
report.
