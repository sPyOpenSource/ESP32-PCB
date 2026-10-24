# Mission: KiCad

## Why
You want to confidently modify existing KiCad PCB projects in your repo (ESP32 motor drivers, drone control boards, solar controllers, etc.) — opening a project, understanding its files, making schematic and layout changes, and generating fabrication output without breaking the link between schematic and board or introducing DRC/ERC errors.

## Success looks like
- Open any project in the repo and identify which files are the schematic, board, and project settings
- Make a change to a schematic symbol or footprint and update the board accordingly
- Run ERC and DRC, interpret the results, and fix common errors
- Generate Gerbers and other fabrication files from a modified project

## Constraints
- You are intermediate: you've used KiCad before, so skip "what is a PCB" basics
- Lessons use your existing repo projects as examples, not abstract boards
- Each lesson must be completable in a single sitting

## Out of scope
- Creating brand-new footprint or symbol libraries from scratch (covered later only if needed)
- Advanced simulation (SPICE, ngspice)
- HDL or FPGA design
- KiCad Python scripting
