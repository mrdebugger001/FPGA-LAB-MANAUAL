---
description: "Core hardware-first, priority-order, and anti-hallucination rules for all Verilog/SystemVerilog RTL work in this repo. Applies automatically to .v/.sv/.vh edits."
applyTo: "**/*.v,**/*.sv,**/*.vh,**/*.svh"
---

# RTL General Instructions

These rules apply to every agent in this repository, whether invoked
directly or as a subagent. They are repo-wide conventions, not persona
traits — see `docs/agent-architecture.md` for why this lives here instead
of being repeated in every `.agent.md`.

## Absolute priority order (non-negotiable)

```
1. Functional correctness
2. Synthesizability
3. Hardware safety
4. Clock/reset correctness
5. Timing correctness
6. Width/sign correctness
7. Verification
8. Hardware efficiency
9. Maintainability
10. Readability
11. Code brevity
```

Never optimize before functional correctness is proven. Never reduce code
size at the cost of hardware correctness.

## Hardware-first principle

Verilog is not software. Before writing or reviewing any RTL, think in
terms of: clock, reset (type/polarity/sync), sequential vs. combinational
elements, FSM state, datapath vs. control path, width/signedness, and
whether the described behavior maps to real synthesizable hardware —
not just "code that produces the right values in simulation."

## Anti-hallucination rule (non-negotiable)

Never fabricate: simulation results, waveform results, FPGA/ASIC
utilization (LUTs, flip-flops, DSPs, BRAM), timing slack, maximum
frequency, or synthesis results. If the toolchain was not actually
executed this session, state explicitly:

> Not measured — synthesis/simulation was not executed.

Compilation succeeding is not verification. Never claim a design is
verified because it compiled without error.

## Reset discipline

Every stateful module's reset type, polarity, synchronicity, and
post-reset register values must be explicit — either directly specified
by the user or clearly stated as an assumption. Never silently assume
reset behavior that wasn't specified.

## Width and sign discipline

Never silently truncate meaningful bits. Check operand width, result
width, carry, overflow, and signed/unsigned mismatches on every
arithmetic-heavy block. If truncation is intentional, document it
explicitly rather than leaving it implicit.

## Synthesis safety

Flag or reject in synthesizable RTL: `#` delays, `initial` blocks used for
functional behavior (as opposed to simulation-only files), non-synthesizable
system tasks, dynamic memory, unbounded loops, and other simulation-only
constructs. Testbenches may use these freely — keep synthesizable RTL and
testbench code in clearly separate files/modules.

## Clock-domain rule

If a design involves more than one clock, or any asynchronous input to
synchronous logic, clock-domain-crossing analysis is mandatory before the
design is considered complete — never connect an asynchronous signal
directly into synchronous logic without a synchronizer.

## Evidence labeling

Label claims as **Observed** (from actual simulation/compilation output
this session), **Inferred** (a reasonable conclusion from Observed facts),
**Hypothesized** (plausible but unchecked), or **Unknown**. A claim like
"this meets timing" without a synthesis/STA run behind it is Hypothesized
at best.

## No AI-narrator language in deliverables

Generated Verilog, testbenches, and the practical documentation report
must read like normal engineering artifacts — no "the AI generated...",
"as an AI...", or similar meta-commentary inside code comments or the
documentation body.
