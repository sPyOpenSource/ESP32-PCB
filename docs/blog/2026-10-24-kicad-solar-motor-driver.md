---
title: Two ESP32 Boards from the KiCad Repo — Solar Controller & Motor Driver
date: 2026-10-24
---

# Two ESP32 Boards from the KiCad Repo — Solar Controller & Motor Driver

This repo ([ESP32-PCBs](https://github.com/xuyi/ESP32-PCB)) collects KiCad designs for ESP32-based boards: a mini drone flight controller, an RC car / motor driver, a solar charger, a Tesla coil driver, a bike light, and a walking robot. In this post I look closely at two of them — the **solar controller** and the **motor driver** — walking through what each board does, the schematic and layout choices behind it, and the lessons I'd carry into the next design.

Both deep-dives are verified against the actual KiCad files in the repo: schematics, PCB layouts, Gerbers, BOMs, and position files. Where something isn't documented in the repo, I say so rather than guessing.

## Solar controller: peak-power 12V charger

### Purpose

A peak-power 12V solar charger for 3.7V batteries, inspired by Tim Nolan's Arduino design. In addition to charging, the design exposes battery voltage, solar voltage, solar current, and solar watts as CoAP resources — telemetry you could read over the network.

### Schematic

The schematic is `solar/solar.kicad_sch` (KiCad eeschema 20211123, A3 sheet, title "Peak Power Solar Charger", rev V2.0, dated 2020-04-25, author Ralf Schlatterbeck). Key elements to walk through: the solar input rail, the buck/boost charging path to the 3.7V battery, the current-sense arrangement for the four CoAP-measured quantities, and the microcontroller interface. [Not documented in repo: the specific part values and the MCU part number — the schematic symbol library references are generic (e.g. Device:C, Device:D_Schottky) with empty Footprint fields, so exact BOM part numbers would need to be reverse-engineered from the layout.]

### Layout

The board was never manufactured. I built it on a breadboard instead; the layout work exists as an Inkscape drawing (`layout.svg`, several layers) rather than a finished KiCad `.kicad_pcb`. That means there are no Gerbers, no pick-and-place files, and no first-article lessons from fab for this board — it's a design-on-paper-plus-breadboard project.

### Lesson learned

Design the telemetry (what you want to measure) before you freeze the schematic. Here the four CoAP measurements drove the current-sense topology, but because the board was never spun, I never validated whether the sense resistors and dividers actually gave usable accuracy. Next time I'd build a minimal measurable prototype before committing to the full schematic.


## Motor driver: ESP32-S3 breakout + klepcontroller

[see Task 4]

## Shared themes and what I'd redo

[see Task 5]

## Source files

[see Task 6]
