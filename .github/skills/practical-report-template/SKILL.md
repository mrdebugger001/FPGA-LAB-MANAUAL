---
name: practical-report-template
description: Use when generating the final Verilog RTL practical/lab-report Markdown document — provides the complete 24-section structure (aim, theory, architecture, FSM, timing, RTL code, testbench, verification, resource considerations, checklist, viva questions). Load whenever the RTL Documentation Engineer produces a final report.
---

# Practical Report Template

Generate the report using this exact structure. It must read like a
normal university/industry engineering practical submission — technically
accurate, print-friendly, no AI-narrator language, no fabricated results.

```markdown
# VERILOG RTL DESIGN PRACTICAL

## 1. Experiment Title
## 2. Aim
## 3. Objective
## 4. Problem Statement
## 5. Hardware Specification
### Inputs
### Outputs
### Clock
### Reset
### Parameters
## 6. Theory
(Explain the digital hardware concepts used.)
## 7. Design Requirements
(Clearly list functional requirements.)
## 8. Hardware Architecture
(Explain the architecture.)
## 9. Block Diagram
(Mermaid diagram when useful.)
## 10. Signal Description
| Signal | Direction | Width | Description |
|--------|-----------|-------|-------------|
## 11. Working Principle
(Step-by-step explanation.)
## 12. FSM Design
(If an FSM exists — see the fsm-design skill for table/diagram format.)
### States
### State Transitions
### State Transition Table
| Current State | Input | Next State | Output |
|---------------|-------|------------|--------|
## 13. Timing Behavior
(Cycle-level reasoning; tables where useful.)
## 14. RTL Design Considerations
(Sequential logic, combinational logic, reset, width, signedness, timing, synthesizability.)
## 15. Verilog RTL Code
```verilog
// Complete synthesizable RTL
```
## 16. Testbench
```verilog
// Complete testbench
```
## 17. Verification
(Test cases, expected results, actual results, corner cases — see verification-checklist skill.)
## 18. Simulation Results
(Textual/tabular results. Reference waveform screenshots if they exist.)
## 19. Hardware Resource Considerations
(Flip-flops, LUTs, registers, memories, DSPs, critical paths. Only actual measured numbers — otherwise state "Not measured — synthesis/simulation was not executed.")
## 20. Design Verification Checklist
- [ ] Functional behavior verified
- [ ] Reset verified
- [ ] Boundary conditions verified
- [ ] Widths verified
- [ ] No unintended latches
- [ ] No multiple drivers
- [ ] Synthesizability checked
- [ ] Testbench executed
## 21. Result
(State whether the design satisfies the specification.)
## 22. Conclusion
## 23. Possible Improvements
## 24. Viva Questions
(5–15 relevant questions with concise answers.)
```

## Writing rules

- Explain code, don't just dump it: for important RTL sections, state
  what it does, why it exists, what hardware it creates, when it executes,
  and what happens on the clock edge. Don't explain trivial syntax tokens
  — focus on hardware behavior (e.g. explain `always @(posedge clk)` as
  describing edge-triggered sequential hardware, once, not every time it
  appears).
- Section 19 (resource considerations) and section 18 (simulation
  results): never invent numbers. If the toolchain wasn't run this
  session, say so explicitly rather than estimating and presenting it as
  measured.
- Free of conversational or AI-related language throughout — no "I
  generated", "the agent decided", "as an AI".
- The file should be named `<project_name>_practical.md` and contain both
  the full explanation and the complete RTL/testbench code — it must be
  self-contained, not reference code that lives only in chat history.
