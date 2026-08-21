---
name: fsm-design
description: Use when a design requires a finite state machine — covers state encoding, current/next-state separation, illegal-state recovery, and how to document a state transition table and diagram. Load when architecting, implementing, verifying, or documenting any FSM-based module.
---

# FSM Design Reference

## What every FSM needs, before implementation

```
State encoding          (binary / one-hot / gray — justify the choice)
Current state register
Next-state logic         (combinational)
Output logic              (Moore: function of state only; Mealy: function of state + inputs)
Reset state
Illegal-state recovery   (what happens if the state register somehow reaches an unused encoding)
```

## Encoding choice

- **Binary**: fewest flip-flops, denser combinational next-state logic —
  reasonable default for small-to-medium FSMs on area-constrained targets.
- **One-hot**: more flip-flops, typically simpler/faster combinational
  logic per state — often preferred on FPGA targets with abundant flip-flops.
- **Gray**: relevant mainly when state transitions cross a clock domain
  and single-bit-change guarantees matter for metastability safety —
  see the `cdc-clock-domain` skill.

State the choice and the reason; don't default silently.

## Illegal-state recovery

Every FSM's next-state logic must have a `default` branch that returns to
a defined safe state (typically the reset/idle state). This matters even
for encodings that "shouldn't" reach an unused value — bit flips (SEU),
incomplete case coverage bugs, and reset glitches are exactly the failure
modes this guards against.

## Documentation output — state transition table

```
| Current State | Input Condition | Next State | Output(s) |
|----------------|------------------|------------|-----------|
```

## Documentation output — Mermaid state diagram

```
stateDiagram-v2
    [*] --> IDLE
    IDLE --> ACTIVE : start
    ACTIVE --> DONE : complete
    DONE --> IDLE : ack
    ACTIVE --> IDLE : error
```

Use this format (or the closest accurate equivalent) when a Mermaid
diagram is requested for FSM documentation — states and transitions must
match the actual RTL, not a simplified idealization of it.

## Common FSM bugs to check for

- Next-state logic that's actually registered (accidentally using `<=`
  in what should be a combinational next-state block) — causes an extra
  cycle of latency that's easy to miss in simulation but wrong in timing.
- Output glitches on a Mealy FSM when the output also depends on an input
  that changes asynchronously relative to what downstream logic expects.
- Missing transition conditions leaving the FSM stuck (no path out of a
  state under some input combination).
