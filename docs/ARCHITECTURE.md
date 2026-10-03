# 🏛️ Architecture & Epistemic Standards

This document specifies the technical and pedagogical architecture governing the **Interactive Masterclass Generator & Subject Mastery Engine**.

---

## 1. Pedagogical Rationale

Traditional academic slides, textbooks, and documentation often suffer from:
1. **The Reference Manual Syndrome:** Monolithic, disjointed facts without causal context.
2. **Premature Formalization:** Mathematical equations presented without an intuitive anchor or daily mental model.
3. **Symbol Ambiguity:** Dense Greek and Latin notation without parameter definitions or domain bounds.
4. **Slide Drift & Disconnect:** Mismatched citations, lack of traceable provenance, and synthetic page numbers.

The **LearnToLearn** architecture resolves these issues by enforcing strict epistemic discipline across all generated guides.

---

## 2. The 4-Layer Epistemic Stack

Every concept is structured in a 4-layer epistemic hierarchy:

| Layer | Focus | Representation |
|---|---|---|
| **Layer 1: Intuition & Everyday Anchor** | Plain-English physical analogies, intuitive mental models | Scannable visual summary cards & analogies |
| **Layer 2: Formal Axiomatic Rigor** | Canonical peer-reviewed mathematics, parameter dictionaries, proofs | LaTeX MathJax formulas with structured Parameter Dictionaries |
| **Layer 3: Production Pipeline & Gotchas** | Real-world engineering implementations, library quirks, data leakage guards | Copyable code blocks, architecture diagrams, callouts |
| **Layer 4: Viva Voce Defense** | Professor trick questions, edge-case probes, asymptotic behaviors | Collapsible defense simulator cards with model answers |

---

## 3. Two-Tier Progressive Disclosure

To prevent cognitive fatigue while preserving depth:
- **Tier 1 (In-Situ Badges $\to$ Slide-Over Knowledge Drawers):** Technical terms are wrapped in clickable badges (`<span class="stat-badge">`). Clicking opens an 880px slide-over drawer containing the full 4-layer breakdown without navigating away from the current paragraph.
- **Tier 2 (Collapsible Deep-Dive Accordions):** Extended derivations, proofs, and historical etymologies are contained in sleek `<details class="deep-dive-card">` accordions.

---

## 4. The 7-Stage Holistic Subtopic Blueprint

Every subtopic adheres to the 7-stage sequence:
1. **Stage 1: Executive Concept Blueprint:** Plain-English 360° identity, dilemma solved, core intuition, and cardinal mechanics table.
2. **Stage 2: Everyday Dilemma & Physical Analogy:** Grounded in everyday physical experiences before equations appear.
3. **Stage 3: Core Conceptual Mechanism:** Competing forces, dials, and asymptotic behavior ($0 \leftrightarrow \infty$).
4. **Stage 4: Formal Mathematical Formulation:** LaTeX equations accompanied by explicit Parameter Dictionary Tables.
5. **Stage 5: Visual Geometry / Constraint Surfaces:** SVG diagrams and interactive visual sandboxes.
6. **Stage 6: Concrete Numerical Walkthrough:** Step-by-step arithmetic from first principles with zero truncation.
7. **Stage 7: Fatal Exam Traps & Viva Defense:** High-risk student traps and professor oral defense probes.
