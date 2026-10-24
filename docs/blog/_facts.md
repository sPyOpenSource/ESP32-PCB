# KiCad Blog Post — Verified Source Facts

Scratchpad of facts collected from the repo for the KiCad blog post.
Every fact block is tagged with the source file path it came from. No KiCad
project files were modified.

Source directories confirmed via `ls solar/ motordriver/ 1CHmotordriver/`:
- `solar/`
- `motordriver/`
- `1CHmotordriver/`

---

## Board 1: solar — "Peak Power Solar Charger"

**Purpose**
- Peak power 12V solar charger for 3.7V (single-cell Li-Ion/LiPo) batteries.
- Inspired by Tim Nolan's Arduino-based peak power charger project.
- Makes current measurements (battery voltage, solar voltage, solar current,
  solar watts) available via CoAP resources.
- Firmware in `solar/src/` (ppt.c, ppt.h, project-conf.h, resource_ppt.c).
- Source: `solar/README.rst`

**Date / Rev / Author**
- Title: "Peak Power Solar Charger"
- Date: 2020-04-25, Rev: V2.0, Author: Ralf Schlatterbeck
- Source: `solar/solar.kicad_sch` (title_block) and `solar/solar.kicad_pcb` (title_block)

**KiCad version**
- Schematic: `(kicad_sch (version 20211123) (generator eeschema))` — KiCad 6-era file format
- PCB: `(kicad_pcb (version 20211014) (generator pcbnew))`
- Source: `solar/solar.kicad_sch` line 1; `solar/solar.kicad_pcb` line 1

**Sheet / stack-up**
- Schematic paper: A3. PCB paper: A4. 2-layer board (F.Cu, B.Cu), thickness 1.6 mm.
- Source: `solar/solar.kicad_sch` line 5; `solar/solar.kicad_pcb` lines 4, 7, 14-16

**Key parts (from BOM `solar.csv` and schematic symbols)**
- IC1: MAX4173H (current-shunt monitor, SO8E)
- IC3: IR2104 (gate driver, DIP-8/SO8E)
- U1: HMHA2801 (optocoupler/isolator, SOP-4); schematic symbol `solar-rescue:PC817-Isolator`
- Q2,Q3: IRFIZ44N N-MOSFETs (TO220)
- L2: 33 uH inductor (7447779139)
- C2,C2: 220 uF; C3: 100 uF; C4,C6,C5,C1,C15,C10: 0.1 uF
- R7: 0.005 R (current sense); R2,R12: 10 k; R14,R13: 560 R; R3: 560 R; R9: 4K7; R10: 220 R
- D1: Schottky diode; D2: LL4148 (1N4148); D5: COMMS
- Connectors: J1 SOLAR_INPUT, J4 BATTERY_OUTPUT, J7 SOLAR_OUTPUT, J6 (in), J2/J3 (RX/TX, JST PH)
- Source: `solar/solar.csv`; `solar/solar.kicad_sch` symbol definitions (IRFIZ44N, MAX4173H, PC817-Isolator, Battery_Output, SOLAR_INPUT)

**Nets**
- `I_Sol` (solar current), `U_Sol` (solar voltage), `U_Bat` (battery voltage), `PWM`
- `Solar+`, `Bat+`
- Source: `solar/solar.kicad_sch` global_label lines (I_Sol, PWM, U_Sol, U_Bat, Solar+, Bat+)

**Fab outputs / manufacturing status**
- Board was NEVER manufactured; built on breadboard only. Breadboard design in Inkscape `layout.svg`.
- No gerbers/drill/STEP/BOM output found in `solar/` (only `solar.csv`, `solar.ods`, `.pos` files).
- Source: `solar/README.rst` ("The board was never manufactured so far, I've built a breadboard"); `ls solar/`

**Lessons**
- A complete schematic + PCB + firmware exists but never went to fab — good example of a design that stayed at breadboard/prototype stage.
- Source: `solar/README.rst`

---

## Board 2: motordriver/klepcontroller — "Motorcontroller"

**Purpose**
- Motor controller built around a TMC2209 stepper driver with an ESP32-S3 and USB-C.
- 2-phase stepper motor driver, STEP/DIR and UART interface.
- Source: `motordriver/klepcontroller.kicad_sch` symbol `Driver_Motor:TMC2209-LA` (Description property)

**Date / Rev / Author**
- Title: "Motorcontroller"
- Date: 2023-04-13, Rev: 1.12, Author: X. Wang
- Source: `motordriver/klepcontroller.kicad_sch` title_block; `motordriver/klepcontroller.kicad_pcb` title_block

**KiCad version**
- Schematic: `(version 20260306) (generator_version "10.0")`
- PCB: `(version 20260206) (generator_version "10.0")` — KiCad 10 file format
- Source: `motordriver/klepcontroller.kicad_sch` lines 1-4; `motordriver/klepcontroller.kicad_pcb` lines 1-4

**Sheet / stack-up**
- Schematic paper: A4. PCB paper: A4. 4-layer board (F.Cu, In1.Cu, In2.Cu, B.Cu), thickness 1.6 mm.
- Source: `motordriver/klepcontroller.kicad_sch` line 6; `motordriver/klepcontroller.kicad_pcb` lines 9, 16-20

**Key parts (from schematic instances and `klepcontroller.csv`)**
- U1: TMC2209-LA stepper driver (VQFN-28, 5x5 mm, thermal vias), datasheet: ADI/ Trinamic TMC2209 (2.8 A peak / 2.0 A RMS, VS = 4.75..29 V, 256 µSteps, STEP/DIR + UART)
- U2: ESP32-S3-WROOM-2 (2.4 GHz Wi-Fi/Bluetooth/BLE, ESP32-S3R8V)
- P1: USB_C_Plug_USB2.0 (USB 2.0-only Type-C plug)
- U3 (per `klepcontroller.csv`): TMC2660 (PQFP-44) — note: CSV lists TMC2660 while the KiCad 10 schematic places TMC2209-LA as U1; BOM/schematic part mismatch worth flagging
- TPS62177DQC switching regulator; `Header:header4` / `header6` connectors; `Conn_02x04_Odd_Even`, `Conn_02x03_Odd_Even`
- Passives: 10 uF / 470 nF / 10 nF / 100 nF caps; 100 m / 10 R resistors; inductor + diode
- Source: `motordriver/klepcontroller.kicad_sch` instances (U1 TMC2209-LA ~line 9941; U2 ESP32-S3-WROOM-2 ~line 10878; P1 USB_C_Plug ~line 11076; TPS62177DQC ~line 10344); `motordriver/klepcontroller.csv`

**Nets**
- `STEP`, `DIRECTION`, `ENABLE`, `CS` (TMC2209 control)
- `Tx`, `Rx` (UART to ESP32)
- `GPIO0`, `SCK` (SPI/programming straps)
- `+5V`, `5V`, `+3V3` (rails)
- `A1`, `A2`, `B1`, `B2` (stepper coil phases)
- Source: `motordriver/klepcontroller.kicad_sch` global_label lines (~6713-7399)

**Fab outputs / manufacturing status**
- Full fab package present: `gerbers/`, `klepcontroller.drl` (drill), `klepcontroller.step` (STEP), `klepcontroller.html`, `klepcontroller.csv` (BOM), `klepcontroller-top-pos.csv` / `klepcontroller-bottom-pos.csv` (placement), plus `.ods` / `.xls` / `.xlsx` BOM variants.
- Source: `ls motordriver/`

**Lessons**
- Only board of the three with a complete manufactured fab package (gerbers + drill + STEP + placement CSVs + BOM).
- BOM (`klepcontroller.csv`, U1 = TMC2660) disagrees with the KiCad 10 schematic (U1 = TMC2209-LA) — reconcile BOM vs schematic before any re-order.
- Source: `motordriver/klepcontroller.csv` vs `motordriver/klepcontroller.kicad_sch`

---

## Board 3: 1CHmotordriver/esp32_mine — "Ducky Board" (ESP32-S3 breakout)

**Purpose**
- Custom breakout board for the ESP32-S3 chip.
- Native USB-C programming (USB-C used for both power input and firmware flashing).
- Integrated single-cell Li-Ion/LiPo battery charger with status indicators.
- Compact breakout form factor; all key GPIOs broken out.
- Part selection optimized for manufacturing and re-usability for DIY projects.
- Source: `1CHmotordriver/README.md`

**Date / Rev**
- Date: 2026-05-13, Rev: 1.0
- Source: `1CHmotordriver/esp32_mine.kicad_sch` title_block; `1CHmotordriver/esp32_mine.kicad_pcb` title_block

**KiCad version (observed discrepancy)**
- `README.md` states: "Designed entirely in KiCad 9" / "created using KiCad 9".
- File headers state `generator_version "10.0"` (schematic format version 20260306; PCB format version 20260206).
- Source: `1CHmotordriver/README.md` lines 3, 30; `1CHmotordriver/esp32_mine.kicad_sch` lines 2-4; `1CHmotordriver/esp32_mine.kicad_pcb` lines 2-4

**Sheet / stack-up**
- Schematic paper: A5. PCB paper: A3. 4-layer board (F.Cu, In1.Cu power, In2.Cu signal, B.Cu power), thickness 3.985 mm (unusually thick — worth verifying).
- Source: `1CHmotordriver/esp32_mine.kicad_sch` line 6; `1CHmotordriver/esp32_mine.kicad_pcb` lines 6, 9, 15-18

**Key parts (from BOM `esp32_mine.csv` and schematic instances)**
- U1: ESP32-S3 (QFN-56-1EP 7x7 mm, EP 4x4 mm)
- U3: MCP73831-2-OT (Li-Ion charger, SOT-23-5)
- U4: AMS1117-3.3 (LDO, SOT-223-3)
- U2: W25Q128JVS flash (SOIC-8)
- J1: USB_C_Receptacle_USB2.0_14P (USB-C)
- Q1: AO3401A (P-MOSFET, SOT-23); D4: SS14 (SMA diode)
- Y1: 32.768 kHz crystal; Y2: 40 MHz (10 ppm) crystal; AE1: 2.4 GHz antenna; L6: 4.7 nH; L3: 2 nH (RF matching)
- D1,D2,D3: LEDs; BTN1/Flash1/Reset1: buttons; +3V3/GND test points
- Top schematic sheet instances: Q3 (N-MOSFET), R21/R32 (resistors), D8 (diode), C12 (1 uF cap); global labels `VBAT`, `IO11`
- Source: `1CHmotordriver/esp32_mine.csv`; `1CHmotordriver/esp32_mine.kicad_sch` instances (lines 985-1414) and global_label lines 937, 961

**Nets**
- `VBAT`, `IO11` (global labels on top schematic sheet; design is hierarchical with `sheet_instances`)
- Source: `1CHmotordriver/esp32_mine.kicad_sch` lines 937, 961

**Fab outputs / manufacturing status**
- Fab package present: `production/gerbers/`, `esp32_mine-all-pos.csv` / `esp32_mine-all.pos` (placement), `esp32_mine.csv` (BOM), `T-1K4W1084007A-2units-bom(2026-05-06).xls` (BOM for 2 units), `3d.step`, `PCB layout.pdf`, `schematics.pdf`, `esp32_mine.png`, `preview.png`, `fabrication-toolkit-options.json`
- BOM filename indicates a 2-unit production run ordered 2026-05-06.
- Source: `ls 1CHmotordriver/`; `ls 1CHmotordriver/production`

**Lessons**
- Only ESP32-S3 board; combines Wi-Fi/BLE MCU, Li-Ion charger (MCP73831), USB-C PD-style power input, and flash — a self-contained IoT node reference.
- Hierarchical top sheet is light (few instances); real content lives in sub-sheets referenced by `sheet_instances`.
- Source: `1CHmotordriver/README.md`; `1CHmotordriver/esp32_mine.kicad_sch`

---

## Cross-board notes

- Three distinct KiCad generations coexist in the repo: KiCad 6-era (`solar`, file version 20211123/20211014), KiCad 10 (`motordriver/klepcontroller` and `1CHmotordriver/esp32_mine` file headers say generator 10.0), while the `1CHmotordriver` README claims KiCad 9.
- Only `klepcontroller` and `esp32_mine` have complete manufactured fab packages; `solar` stayed at breadboard/prototype stage.
- Source: file headers; `ls` of each directory; `solar/README.rst`

---
*End of scratchpad. Tagged to source files; ready to be drawn on for the blog post.*
