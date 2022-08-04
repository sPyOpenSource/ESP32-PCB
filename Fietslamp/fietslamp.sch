EESchema Schematic File Version 4
LIBS:fietslamp-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "2020-04-13"
Rev "v1.0"
Comp ""
Comment1 "X. Wang"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L fietslamp-rescue:Conn_01x03_Male-Connector J5
U 1 1 5D9A2153
P 7450 2850
F 0 "J5" H 7556 3128 50  0000 C CNN
F 1 "LED" H 7556 3037 50  0000 C CNN
F 2 "digikey-footprints:SOT-3" H 7450 2850 50  0001 C CNN
F 3 "~" H 7450 2850 50  0001 C CNN
	1    7450 2850
	-1   0    0    1   
$EndComp
Text GLabel 3850 2850 2    50   Input ~ 0
SDA
Text GLabel 3850 2750 2    50   Input ~ 0
SCL
Wire Wire Line
	3850 2750 3600 2750
Wire Wire Line
	3600 2850 3850 2850
Wire Wire Line
	6750 2850 7250 2850
Wire Wire Line
	7250 2950 6900 2950
$Comp
L fietslamp-rescue:Conn_01x03_Male-Connector J2
U 1 1 5DF4EBDD
P 7050 1900
F 0 "J2" H 7150 1650 50  0000 C CNN
F 1 "TH11" H 7156 2087 50  0000 C CNN
F 2 "digikey-footprints:SOT-3" H 7050 1900 50  0001 C CNN
F 3 "~" H 7050 1900 50  0001 C CNN
	1    7050 1900
	-1   0    0    1   
$EndComp
$Comp
L fietslamp-rescue:Conn_01x02_Male-Connector J1
U 1 1 5DF534C8
P 3400 2750
F 0 "J1" H 3506 2928 50  0000 C CNN
F 1 "ADXL" H 3506 2837 50  0000 C CNN
F 2 "" H 3400 2750 50  0001 C CNN
F 3 "" H 3400 2750 50  0001 C CNN
	1    3400 2750
	1    0    0    -1  
$EndComp
$Comp
L fietslamp-rescue:Conn_01x02_Male-Connector J3
U 1 1 5DF5356D
P 4450 2750
F 0 "J3" H 4556 2928 50  0000 C CNN
F 1 "ADXL" H 4556 2837 50  0000 C CNN
F 2 "" H 4450 2750 50  0001 C CNN
F 3 "" H 4450 2750 50  0001 C CNN
	1    4450 2750
	1    0    0    -1  
$EndComp
$Comp
L fietslamp-rescue:GND-power #PWR0101
U 1 1 5DF536BB
P 5150 2750
F 0 "#PWR0101" H 5150 2500 50  0001 C CNN
F 1 "GND-power" H 5155 2577 50  0000 C CNN
F 2 "" H 5150 2750 50  0001 C CNN
F 3 "" H 5150 2750 50  0001 C CNN
	1    5150 2750
	0    -1   -1   0   
$EndComp
$Comp
L fietslamp-rescue:GND-power #PWR0102
U 1 1 5DF5395E
P 6750 2850
F 0 "#PWR0102" H 6750 2600 50  0001 C CNN
F 1 "GND-power" H 6755 2677 50  0000 C CNN
F 2 "" H 6750 2850 50  0001 C CNN
F 3 "" H 6750 2850 50  0001 C CNN
	1    6750 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 2750 5150 2750
Wire Wire Line
	6350 1900 6850 1900
$Comp
L fietslamp-rescue:GND-power #PWR0103
U 1 1 5DF53AE8
P 6350 1900
F 0 "#PWR0103" H 6350 1650 50  0001 C CNN
F 1 "GND-power" V 6450 1850 50  0000 C CNN
F 2 "" H 6350 1900 50  0001 C CNN
F 3 "" H 6350 1900 50  0001 C CNN
	1    6350 1900
	0    1    1    0   
$EndComp
$Comp
L fietslamp-rescue:Conn_01x03_Male-Connector J4
U 1 1 5DF53B5F
P 4600 3750
F 0 "J4" H 4706 4028 50  0000 C CNN
F 1 "ESP" H 4706 3937 50  0000 C CNN
F 2 "digikey-footprints:SOT-3" H 4600 3750 50  0001 C CNN
F 3 "~" H 4600 3750 50  0001 C CNN
	1    4600 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 3750 4400 3750
$Comp
L fietslamp-rescue:GND-power #PWR0104
U 1 1 5DF53B67
P 3900 3750
F 0 "#PWR0104" H 3900 3500 50  0001 C CNN
F 1 "GND-power" H 3905 3577 50  0000 C CNN
F 2 "" H 3900 3750 50  0001 C CNN
F 3 "" H 3900 3750 50  0001 C CNN
	1    3900 3750
	0    1    1    0   
$EndComp
$Comp
L fietslamp-rescue:Conn_01x02_Male-Connector J6
U 1 1 5DF53C13
P 4450 3150
F 0 "J6" H 4556 3328 50  0000 C CNN
F 1 "ESP" H 4556 3237 50  0000 C CNN
F 2 "" H 4450 3150 50  0001 C CNN
F 3 "" H 4450 3150 50  0001 C CNN
	1    4450 3150
	1    0    0    -1  
$EndComp
$Comp
L fietslamp-rescue:Conn_01x02_Male-Connector J7
U 1 1 5DF5491B
P 5950 3150
F 0 "J7" H 6056 3328 50  0000 C CNN
F 1 "TH11" H 6056 3237 50  0000 C CNN
F 2 "" H 5950 3150 50  0001 C CNN
F 3 "" H 5950 3150 50  0001 C CNN
	1    5950 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5750 3150 5650 3150
Wire Wire Line
	4650 3150 4650 2850
Wire Wire Line
	5650 3150 5650 3400
Wire Wire Line
	5650 3400 6900 3400
Wire Wire Line
	6900 3400 6900 2950
Connection ~ 5650 3150
Wire Wire Line
	5650 3150 4650 3150
Text GLabel 4050 3650 0    50   Input ~ 0
Tx
Text GLabel 4050 3850 0    50   Input ~ 0
Rx
Wire Wire Line
	4400 3650 4050 3650
Wire Wire Line
	4400 3850 4050 3850
Wire Wire Line
	7150 3900 6650 3900
$Comp
L fietslamp-rescue:GND-power #PWR0105
U 1 1 5DF55ADA
P 7150 3900
F 0 "#PWR0105" H 7150 3650 50  0001 C CNN
F 1 "GND-power" H 7155 3727 50  0000 C CNN
F 2 "" H 7150 3900 50  0001 C CNN
F 3 "" H 7150 3900 50  0001 C CNN
	1    7150 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 3800 6900 3800
Wire Wire Line
	6900 3800 6900 3400
Connection ~ 6900 3400
Text GLabel 6250 5150 0    50   Input ~ 0
SDA
Text GLabel 6250 5050 0    50   Input ~ 0
SCL
Wire Wire Line
	6250 5050 6500 5050
Wire Wire Line
	6500 5150 6250 5150
$Comp
L fietslamp-rescue:Conn_01x02_Male-Connector J9
U 1 1 5DF5649A
P 6700 5150
F 0 "J9" H 6806 5328 50  0000 C CNN
F 1 "Nano" H 6806 5237 50  0000 C CNN
F 2 "" H 6700 5150 50  0001 C CNN
F 3 "" H 6700 5150 50  0001 C CNN
	1    6700 5150
	-1   0    0    1   
$EndComp
$Comp
L fietslamp-rescue:Conn_01x03_Male-Connector J11
U 1 1 5DF5779F
P 6700 4500
F 0 "J11" H 6806 4778 50  0000 C CNN
F 1 "Nano" H 6806 4687 50  0000 C CNN
F 2 "digikey-footprints:SOT-3" H 6700 4500 50  0001 C CNN
F 3 "~" H 6700 4500 50  0001 C CNN
	1    6700 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	6000 4400 6500 4400
$Comp
L fietslamp-rescue:GND-power #PWR0106
U 1 1 5DF577A6
P 6000 4400
F 0 "#PWR0106" H 6000 4150 50  0001 C CNN
F 1 "GND-power" H 6005 4227 50  0000 C CNN
F 2 "" H 6000 4400 50  0001 C CNN
F 3 "" H 6000 4400 50  0001 C CNN
	1    6000 4400
	0    1    1    0   
$EndComp
Text GLabel 6150 4600 0    50   Input ~ 0
Tx
Text GLabel 6150 4500 0    50   Input ~ 0
Rx
Wire Wire Line
	6500 4600 6150 4600
Wire Wire Line
	6500 4500 6150 4500
$Comp
L fietslamp-rescue:Conn_01x02_Male-Connector J10
U 1 1 5DF57B18
P 5250 2050
F 0 "J10" H 5356 2228 50  0000 C CNN
F 1 "Nano" H 5356 2137 50  0000 C CNN
F 2 "" H 5250 2050 50  0001 C CNN
F 3 "" H 5250 2050 50  0001 C CNN
	1    5250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1800 5450 1800
Wire Wire Line
	5450 1800 5450 2050
Wire Wire Line
	5450 2150 7250 2150
Wire Wire Line
	7250 2150 7250 2750
Text GLabel 7200 3400 2    50   Input ~ 0
3.3V
Wire Wire Line
	7200 3400 6900 3400
Connection ~ 4650 3150
$Comp
L fietslamp-rescue:Conn_01x03_Male-Connector J8
U 1 1 5DF69D56
P 6450 3900
F 0 "J8" H 6556 4178 50  0000 C CNN
F 1 "Nano" H 6556 4087 50  0000 C CNN
F 2 "digikey-footprints:SOT-3" H 6450 3900 50  0001 C CNN
F 3 "~" H 6450 3900 50  0001 C CNN
	1    6450 3900
	1    0    0    -1  
$EndComp
Text GLabel 4950 3250 2    50   Input ~ 0
RST
Wire Wire Line
	4950 3250 4650 3250
$EndSCHEMATC
