---
name: verilog-style-guide
description: Use when writing, editing, or reviewing synthesizable Verilog/SystemVerilog RTL — covers blocking vs. nonblocking assignment rules, latch avoidance, multiple-driver avoidance, safe FSM coding, and parameterization conventions. Load before implementing or reviewing any RTL module.
---

# Verilog Style Guide (Synthesizable RTL)

## Assignment rules

- **Sequential logic** (`always @(posedge clk)` or `always_ff`): use
  **nonblocking** (`<=`) assignments exclusively. Mixing blocking and
  nonblocking in the same always block is a common source of simulation/
  synthesis mismatch.
- **Combinational logic** (`always @(*)` or `always_comb`): use
  **blocking** (`=`) assignments exclusively.
- Never assign the same signal from more than one always block (multiple
  drivers) — this is a synthesis error / undefined behavior, not a style
  preference.

## Latch avoidance

Every combinational `always @(*)` block must assign every output signal
on every possible path (all `if`/`case` branches, including a default/else).
An unassigned output on some path infers a latch — this is almost always
unintended. Use a default assignment at the top of the block as a
defensive pattern when case coverage is complex.

## Reset coding

- State reset polarity (active-high/active-low) and type (synchronous/
  asynchronous) explicitly in the module and its documentation.
- Asynchronous reset: `always @(posedge clk or posedge rst)` (or
  `negedge rst_n` for active-low async).
- Synchronous reset: reset condition checked only inside the
  `posedge clk` block, no separate sensitivity.
- Be consistent within a design — mixing sync and async reset styles
  across modules in the same clock domain is a common integration bug
  source.

## Safe FSM coding

- Use an explicit `parameter`/`localparam` or `enum` (SystemVerilog) for
  state encoding rather than bare magic numbers.
- Always define a `default` case in the state transition logic that
  returns to a safe/reset state — undefined states must have defined
  recovery behavior, not be left as "shouldn't happen."
- Prefer two-always-block (state register + next-state/output logic) or
  three-always-block (state register + next-state + output) style over
  a single monolithic always block, for clarity and to keep sequential/
  combinational logic separated per the assignment rules above.

## Width and constants

- Size constants explicitly (`8'hFF`, not bare `255`) in width-sensitive
  contexts to avoid unintended default-width inference.
- Be explicit about `signed`/`unsigned` on any operand that participates
  in signed arithmetic — Verilog's default net/reg types are unsigned,
  and mixing signed and unsigned operands silently produces unsigned
  results.

## Parameterization

Use `parameter`/`localparam` when it materially improves reuse (bus
widths, FIFO depth, counter width) — don't parameterize trivial,
single-use constants where it adds indirection without benefit.

## Synthesizability red flags to catch in review

`#` delays outside testbenches, `initial` blocks used for functional
(not simulation-setup) behavior, `force`/`release`, `$random` in
synthesizable RTL, unbounded `while`/`for` loops, and any construct
whose behavior depends on simulation event ordering rather than
clock-edge semantics.
