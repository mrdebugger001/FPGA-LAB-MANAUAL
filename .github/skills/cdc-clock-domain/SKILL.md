---
name: cdc-clock-domain
description: Use whenever a design involves more than one clock, or any asynchronous input reaching synchronous logic — covers CDC hazards, synchronizer patterns, metastability, handshake/pulse transfer, and CDC FIFOs. Load when architecting, implementing, debugging, or reviewing any multi-clock or asynchronous-input design.
---

# Clock Domain Crossing (CDC) Reference

## When this applies

Any design with more than one clock domain, or any single-bit or
multi-bit signal originating asynchronously relative to the clock that
samples it (external inputs, buttons, cross-chip signals, or signals from
a different internal clock domain).

## Core hazard: metastability

A flip-flop sampling a signal that changes near its clock edge can enter
a metastable state (neither valid 0 nor 1) that may resolve unpredictably
and propagate. Never connect an asynchronous signal directly into
synchronous combinational or sequential logic without a synchronizer.

## Single-bit synchronizer

Standard pattern: two (or more, for higher-frequency/higher-reliability
designs) flip-flops in series in the destination clock domain:

```
always @(posedge clk_dst) begin
    sync_ff1 <= async_signal;
    sync_ff2 <= sync_ff1;
end
```

Only `sync_ff2` (the synchronized output) is safe to use in destination-
domain logic. Never use `sync_ff1` directly.

## Multi-bit signals

A plain two-flop synchronizer is **not** safe for multi-bit buses — bits
can resolve on different clock edges, producing a transient invalid
combination. Use one of:

- **Gray-code encoding** before crossing (only one bit changes per
  transition, bounding the error to one Gray-code step) — common for
  pointers in async FIFOs.
- **Handshake protocol** (req/ack) to transfer a multi-bit value only
  once both domains have agreed it's stable.
- **Asynchronous/CDC FIFO** with Gray-coded read/write pointers — the
  standard pattern for bulk data transfer between clock domains.

## Pulse transfer

A single-cycle pulse in the source domain may be missed entirely by a
slower destination clock, or (if the destination is faster) sampled
correctly but needs width-matching. Use a toggle-and-synchronize pattern
(toggle a flip-flop on the pulse, synchronize the toggle signal, detect
the transition in the destination domain) rather than passing the raw
pulse through a plain synchronizer.

## Reset domain crossing

Deasserting reset is itself an async-to-sync event if the reset signal
isn't synchronized per clock domain. Use "asynchronous assert, synchronous
deassert" reset synchronizers per clock domain rather than sharing one
raw reset signal across domains without domain-local synchronization.

## Checklist to apply during architecture/review

```
[ ] Every clock domain identified
[ ] Every signal crossing domains identified
[ ] Single-bit crossings: synchronizer present
[ ] Multi-bit crossings: Gray-code, handshake, or async FIFO used
[ ] Pulse crossings: toggle-and-synchronize (not raw pulse) used
[ ] Reset synchronized per destination clock domain
```
