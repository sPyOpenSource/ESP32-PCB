EESchema Schematic File Version 4
LIBS:Crazyflie contol board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "Crazyflie control board"
Date "2019-10-14"
Rev "F"
Comp "Bitcraze AB (CC BY-NC-SA)"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5300 3950 0    60   ~ 0
U5 not mounted on 9-DOF version
Wire Wire Line
	5300 4250 5400 4250
Connection ~ 5300 4850
Wire Wire Line
	5300 4950 5300 4850
Wire Wire Line
	5300 4650 5500 4650
Connection ~ 5050 3550
Wire Wire Line
	5050 3450 5050 3550
Wire Wire Line
	5400 3450 5400 3550
Wire Wire Line
	5400 3550 5050 3550
Wire Wire Line
	6800 1900 7350 1900
Wire Wire Line
	3600 2500 4150 2500
Wire Wire Line
	3600 2400 4250 2400
Wire Wire Line
	5050 3650 5050 3550
Wire Wire Line
	6700 4850 6800 4850
Wire Wire Line
	6800 4850 6800 5350
Wire Wire Line
	5400 4350 5500 4350
Wire Wire Line
	5500 4250 5400 4250
Wire Wire Line
	5500 4850 5300 4850
$Comp
L Crazyflie-contol-board-rescue:VCCA-Crazyflie-contol-board-rescue #PWR031
U 1 1 4F699AB7
P 5050 4850
F 0 "#PWR031" H 5050 4950 30  0001 C CNN
F 1 "VCCA" H 5050 4950 30  0000 C CNN
F 2 "" H 5050 4850 50  0001 C CNN
F 3 "" H 5050 4850 50  0001 C CNN
	1    5050 4850
	0    -1   -1   0   
$EndComp
NoConn ~ 6700 4250
$Comp
L Crazyflie-contol-board-rescue:AGND-Crazyflie-contol-board-rescue #PWR032
U 1 1 4F699A57
P 5300 4250
AR Path="/4F699A57" Ref="#PWR032"  Part="1" 
AR Path="/4DE1273C/4F699A57" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 5300 4250 40  0001 C CNN
F 1 "AGND" H 5300 4180 50  0000 C CNN
F 2 "" H 5300 4250 50  0001 C CNN
F 3 "" H 5300 4250 50  0001 C CNN
	1    5300 4250
	0    1    1    0   
$EndComp
$Comp
L Crazyflie-contol-board-rescue:C-Crazyflie-contol-board-rescue C24
U 1 1 4F699A20
P 5300 5150
F 0 "C24" H 5350 5250 50  0000 L CNN
F 1 "100nF" H 5350 5050 50  0000 L CNN
F 2 "ESP32-footprints-Lib:0603_new_new" H 5300 5150 60  0001 C CNN
F 3 "" H 5300 5150 50  0001 C CNN
	1    5300 5150
	1    0    0    -1  
$EndComp
$Comp
L Crazyflie-contol-board-rescue:AGND-Crazyflie-contol-board-rescue #PWR034
U 1 1 4F699A16
P 6800 5450
AR Path="/4F699A16" Ref="#PWR034"  Part="1" 
AR Path="/4DE1273C/4F699A16" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 6800 5450 40  0001 C CNN
F 1 "AGND" H 6800 5380 50  0000 C CNN
F 2 "" H 6800 5450 50  0001 C CNN
F 3 "" H 6800 5450 50  0001 C CNN
	1    6800 5450
	1    0    0    -1  
$EndComp
$Comp
L Crazyflie-contol-board-rescue:MS5611-01BA01-Crazyflie-contol-board-rescue U5
U 1 1 4F6999F7
P 6100 4550
F 0 "U5" H 6100 5000 60  0000 C CNN
F 1 "MS5611-01BA03" H 6100 4100 60  0000 C CNN
F 2 "MS5611" H 6100 4200 60  0001 C CNN
F 3 "" H 6100 4550 50  0001 C CNN
F 4 "Measurement Specialties" H 6100 4550 60  0001 C CNN "Fält4"
F 5 "MS5611-01BA03" H 6100 4550 60  0001 C CNN "Fält5"
	1    6100 4550
	1    0    0    -1  
$EndComp
Text HLabel 7350 1900 2    60   Output ~ 0
INT_GA
Text HLabel 3600 2500 0    60   BiDi ~ 0
I2C_SDA_VCCA
Text HLabel 3600 2400 0    60   Input ~ 0
I2C_SCL_VCCA
$Comp
L Crazyflie-contol-board-rescue:C-Crazyflie-contol-board-rescue C20
U 1 1 4F679FC3
P 5050 3250
F 0 "C20" H 5100 3350 50  0000 L CNN
F 1 "100nF" H 5100 3150 50  0000 L CNN
F 2 "ESP32-footprints-Lib:0603_new_new" H 5050 3250 60  0001 C CNN
F 3 "" H 5050 3250 50  0001 C CNN
	1    5050 3250
	1    0    0    -1  
$EndComp
$Comp
L Crazyflie-contol-board-rescue:VCCA-Crazyflie-contol-board-rescue #PWR039
U 1 1 4F679CF2
P 4900 2900
F 0 "#PWR039" H 4900 3000 30  0001 C CNN
F 1 "VCCA" H 4900 3000 30  0000 C CNN
F 2 "" H 4900 2900 50  0001 C CNN
F 3 "" H 4900 2900 50  0001 C CNN
	1    4900 2900
	0    -1   -1   0   
$EndComp
$Comp
L Crazyflie-contol-board-rescue:AGND-Crazyflie-contol-board-rescue #PWR040
U 1 1 4F679AFC
P 5050 3650
AR Path="/4F679AFC" Ref="#PWR040"  Part="1" 
AR Path="/4DE1273C/4F679AFC" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 5050 3650 40  0001 C CNN
F 1 "AGND" H 5050 3580 50  0000 C CNN
F 2 "" H 5050 3650 50  0001 C CNN
F 3 "" H 5050 3650 50  0001 C CNN
	1    5050 3650
	1    0    0    -1  
$EndComp
$Comp
L Crazyflie-contol-board-rescue:C-Crazyflie-contol-board-rescue C18
U 1 1 4F679A90
P 5400 3250
F 0 "C18" H 5450 3350 50  0000 L CNN
F 1 "100nF" H 5450 3150 50  0000 L CNN
F 2 "ESP32-footprints-Lib:0603_new_new" H 5400 3250 60  0001 C CNN
F 3 "" H 5400 3250 50  0001 C CNN
	1    5400 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4250 5400 4350
Wire Wire Line
	5300 4850 5300 4650
Wire Wire Line
	4150 2500 4150 2200
$Comp
L Crazyflie-contol-board-rescue:BMX160-SensorMotion U1
U 1 1 5D68D4EE
P 6100 2350
F 0 "U1" H 6400 3100 60  0000 C CNN
F 1 "BMX160" H 6100 3100 60  0000 C CNN
F 2 "digikey-footprints:LGA-14L_2.5x3mm__LSM6DS3" H 6100 2350 50  0001 C CNN
F 3 "" H 6100 2350 50  0001 C CNN
	1    6100 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2500 5400 2600
Wire Wire Line
	5400 2600 5400 2900
Connection ~ 5400 2600
Wire Wire Line
	6800 2200 6800 2900
$Comp
L Crazyflie-contol-board-rescue:AGND-Crazyflie-contol-board-rescue #PWR0115
U 1 1 5D693209
P 4750 1900
AR Path="/5D693209" Ref="#PWR0115"  Part="1" 
AR Path="/4DE1273C/5D693209" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 4750 1900 40  0001 C CNN
F 1 "AGND" H 4750 1830 50  0000 C CNN
F 2 "" H 4750 1900 50  0001 C CNN
F 3 "" H 4750 1900 50  0001 C CNN
	1    4750 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 1900 5300 1900
Wire Wire Line
	5400 2300 5300 2300
Wire Wire Line
	5300 2300 5300 1900
Connection ~ 5300 1900
Wire Wire Line
	5300 1900 4750 1900
Wire Wire Line
	5400 1800 5300 1800
Wire Wire Line
	5300 1800 5300 1900
Wire Wire Line
	5400 2100 4250 2100
Wire Wire Line
	4250 2100 4250 2400
Wire Wire Line
	5400 2200 4150 2200
Wire Wire Line
	5050 3050 5400 3050
Wire Wire Line
	5400 2900 4900 2900
Wire Wire Line
	4250 4450 4250 2400
Connection ~ 4250 2400
Wire Wire Line
	4150 4550 4150 2500
Connection ~ 4150 2500
Connection ~ 5400 4250
Wire Wire Line
	5050 4850 5300 4850
Connection ~ 5400 2900
Wire Wire Line
	5400 3050 5400 2900
Connection ~ 5400 3050
Wire Wire Line
	4150 4550 5500 4550
Wire Wire Line
	4250 4450 5500 4450
Wire Wire Line
	5300 5350 6800 5350
Connection ~ 6800 5350
Wire Wire Line
	6800 5350 6800 5450
Wire Wire Line
	6800 2900 6800 3550
Wire Wire Line
	6800 3550 5400 3550
Connection ~ 6800 2900
Connection ~ 5400 3550
$EndSCHEMATC
