# Initial assessment: intermediate KiCad user wanting to modify existing projects

The user has used KiCad before (intermediate level) and wants to learn how to modify existing KiCad projects in their repo rather than create boards from scratch. Their repo contains several complete ESP32-based PCB projects (1CHmotordriver, motordriver, Drone, Solar, etc.) with schematics, boards, Gerbers, BOMs, and position files.

Prior knowledge established:
- KiCad version 10 is in use (confirmed from .kicad_pro and .kicad_pcb metadata)
- They understand the general concept of schematic → board → fabrication output
- They have .bak and .kicad_pcb-bak files, suggesting informal backup habits rather than version-controlled workflows

Zone of proximal development:
- Needs to understand KiCad project file anatomy (.kicad_pro, .kicad_sch, .kicad_pcb and supporting files)
- Needs to understand the UUID linkage between schematic and board
- Needs a safe modification workflow (backup → edit → annotate → ERC/DRC → fabrication)

Implications:
- Lesson 0001 covers project file anatomy and the safe modification workflow
- Later lessons can cover schematic editing, footprint changes, netlist updates, and Gerber generation
