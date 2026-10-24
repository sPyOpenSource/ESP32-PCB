# Design Spec: KiCad Blog — Solar Controller & Motor Driver Deep-Dive

**Date:** 2026-10-24  
**Status:** Draft (awaiting user review)  
**Repo:** `/Users/xuyi/Source/KiCad/ESP32-PCB`  
**Branch:** `remote` (HEAD `72f7df8 save`)

## 1. Purpose

Write a single blog post that takes a reader through two ESP32-based boards from this KiCad repository — the **solar controller** (`solar/`) and the **motor driver** (`motordriver/` / `1CHmotordriver/`) — as worked examples. The post is a project showcase, not a KiCad tutorial: it explains *why* each board was designed the way it was, what layout/fabrication choices were made, and what lessons were learned, so fellow KiCad users can borrow patterns and avoid mistakes.

**Non-goal (YAGNI):** Teach KiCad from scratch (installation, schematic capture, DRC, Gerber generation). Link to KiCad docs for that instead.

## 2. Audience

- Fellow KiCad / ESP32 hobbyists who have built at least one board and want real-world design patterns.
- The author's future self, documenting decisions made in this repo.

## 3. Structure (single combined post)

| Section | Content | Source of truth |
|---|---|---|
| Intro | What this repo is (ESP32-PCBs: drone, rc car, solar controller, Tesla coil, feetlamp, miniKame), why these two boards were chosen, where the files live. | `README.md`, directory listing |
| Solar controller deep-dive | Purpose, schematic walkthrough (power rails, key components), layout choices, fabrication notes (Gerbers, pos files, BOM), one lesson learned / what you'd redo. | `solar/*.kicad_sch`, `solar/*.kicad_pcb`, `solar/gerber`, `solar/*.csv`, `solar/README.rst` |
| Motor driver deep-dive | Purpose, schematic walkthrough (current sense, MOSFET arrangement, thermals), layout choices, fabrication notes, one lesson learned / what you'd redo. | `motordriver/klepcontroller.*`, `1CHmotordriver/esp32_mine.*`, BOM/pos files |
| Shared themes & comparison | Common ESP32 power-design patterns across both boards, what the repo does well, rough edges/gaps. | Cross-board comparison |
| Closing | What you'd change next time, links to source files for both boards. | n/a |

## 4. Content rules

1. **Verify against the repo.** Every claim (part values, net names, layer stack, fab outputs) must be traceable to an actual file (`*.kicad_sch`, `*.kicad_pcb`, Gerbers, CSVs, PDFs). If something is undocumented or ambiguous, flag it as a gap rather than inventing it.
2. **No unrelated refactoring.** The design stays focused on the blog post; no changes to KiCad files are proposed.
3. **One board's lessons don't bleed into the other.** Each deep-dive stands alone; the comparison section explicitly separates what's shared vs. board-specific.

## 5. Architecture

This is a content artifact, not software, so "architecture" = the article's information architecture:

- **Entry point:** Intro orients the reader and links to both deep-dives.
- **Deep-dives:** Self-contained sections. A reader should be able to read just the solar section or just the motor-driver section and come away with a complete picture.
- **Comparison section:** Synthesizes cross-board patterns without duplicating deep-dive content.
- **Closing + source links:** Calls to action (browse the repo, open the KiCad files, fork and modify).

Interfaces between sections: each deep-dive uses the same informal template (purpose → schematic → layout → fab → lesson) so the comparison section can reference them by consistent headers.

## 6. Components (content units)

| Unit | Responsibility | Depends on |
|---|---|---|
| Intro | Repo context, board selection rationale, file locations | `README.md`, repo layout |
| Solar deep-dive | Solar controller design narrative | `solar/` files |
| Motor driver deep-dive | Motor driver design narrative | `motordriver/`, `1CHmotordriver/` files |
| Comparison | Cross-board themes, patterns, gaps | Both deep-dives |
| Closing | Next steps, source links | All sections |

## 7. Data flow

Reader journey: intro → pick a board deep-dive → (optionally) read the other → comparison → closing → click through to source files in the repo. No data transformations; this is a linear narrative.

## 8. Error handling

- **Missing/ambiguous info in repo:** Explicitly flagged as "[not documented in repo]" so the reader knows the limit of what's claimed.
- **Broken links to source files:** Verify each link points to an existing path before publishing.

## 9. Testing

- **Accuracy check:** Re-read each claim against the actual file it cites before committing the post.
- **Link check:** Confirm every referenced path (`solar/`, `motordriver/`, `1CHmotordriver/`, datasheet PDFs) exists in the repo.
- **Readability check:** Read the post aloud once to catch awkward transitions between the two board sections.

## 10. Spec self-review

1. **Placeholder scan:** No TBD/TODO/incomplete sections remain. All sections have defined content and sources.
2. **Internal consistency:** Architecture matches feature descriptions — the comparison section only references what the two deep-dives promise to deliver.
3. **Scope check:** Single post, two boards, one comparison section — focused enough for one implementation plan. No decomposition needed.
4. **Ambiguity check:** "Motor driver" could refer to `motordriver/` or `1CHmotordriver/`; resolved by covering both under one deep-dive section (noted in content table). "Solar controller" unambiguously maps to `solar/`.

---

**Next:** Once you approve this spec, I'll invoke the writing-plans skill to produce the implementation plan for drafting the post.

Please review the spec above and let me know if you want changes before we move to the implementation plan.