EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "2020-04-21"
Rev "v1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L minikame-rescue:header-Header J5
U 1 1 5E793C42
P 3800 3800
F 0 "J5" H 3826 3776 50  0000 C CNN
F 1 "header" H 3826 3685 50  0000 C CNN
F 2 "ESP32-footprints-Lib:PIN16" H 3650 3800 50  0001 C CNN
F 3 "" H 3650 3800 50  0001 C CNN
	1    3800 3800
	1    0    0    -1  
$EndComp
$Comp
L minikame-rescue:header-Header J6
U 1 1 5E793CBE
P 3800 4550
F 0 "J6" H 3826 4526 50  0000 C CNN
F 1 "header" H 3826 4435 50  0000 C CNN
F 2 "ESP32-footprints-Lib:PIN16" H 3650 4550 50  0001 C CNN
F 3 "" H 3650 4550 50  0001 C CNN
	1    3800 4550
	1    0    0    -1  
$EndComp
$Comp
L minikame-rescue:header3-Header J1
U 1 1 5E7940C9
P 6000 3800
F 0 "J1" H 6140 3852 50  0000 L CNN
F 1 "header3" H 6140 3761 50  0000 L CNN
F 2 "" H 6000 3700 50  0001 C CNN
F 3 "" H 6000 3700 50  0001 C CNN
	1    6000 3800
	1    0    0    -1  
$EndComp
$Comp
L minikame-rescue:header3-Header J3
U 1 1 5E79418E
P 6850 3800
F 0 "J3" H 6990 3852 50  0000 L CNN
F 1 "header3" H 6990 3761 50  0000 L CNN
F 2 "" H 6850 3700 50  0001 C CNN
F 3 "" H 6850 3700 50  0001 C CNN
	1    6850 3800
	1    0    0    -1  
$EndComp
$Comp
L minikame-rescue:header3-Header J2
U 1 1 5E7941DF
P 6000 4600
F 0 "J2" H 6140 4652 50  0000 L CNN
F 1 "header3" H 6140 4561 50  0000 L CNN
F 2 "" H 6000 4500 50  0001 C CNN
F 3 "" H 6000 4500 50  0001 C CNN
	1    6000 4600
	1    0    0    -1  
$EndComp
$Comp
L minikame-rescue:header3-Header J4
U 1 1 5E7941E5
P 6850 4600
F 0 "J4" H 6990 4652 50  0000 L CNN
F 1 "header3" H 6990 4561 50  0000 L CNN
F 2 "" H 6850 4500 50  0001 C CNN
F 3 "" H 6850 4500 50  0001 C CNN
	1    6850 4600
	1    0    0    -1  
$EndComp
$Comp
L minikame-rescue:header3-Header J7
U 1 1 5E7942F7
P 7700 3800
F 0 "J7" H 7840 3852 50  0000 L CNN
F 1 "header3" H 7840 3761 50  0000 L CNN
F 2 "" H 7700 3700 50  0001 C CNN
F 3 "" H 7700 3700 50  0001 C CNN
	1    7700 3800
	1    0    0    -1  
$EndComp
$Comp
L minikame-rescue:header3-Header J9
U 1 1 5E7942FD
P 8500 3800
F 0 "J9" H 8640 3852 50  0000 L CNN
F 1 "header3" H 8640 3761 50  0000 L CNN
F 2 "" H 8500 3700 50  0001 C CNN
F 3 "" H 8500 3700 50  0001 C CNN
	1    8500 3800
	1    0    0    -1  
$EndComp
$Comp
L minikame-rescue:header3-Header J8
U 1 1 5E794303
P 7700 4600
F 0 "J8" H 7840 4652 50  0000 L CNN
F 1 "header3" H 7840 4561 50  0000 L CNN
F 2 "" H 7700 4500 50  0001 C CNN
F 3 "" H 7700 4500 50  0001 C CNN
	1    7700 4600
	1    0    0    -1  
$EndComp
$Comp
L minikame-rescue:header3-Header J10
U 1 1 5E794309
P 8500 4600
F 0 "J10" H 8640 4652 50  0000 L CNN
F 1 "header3" H 8640 4561 50  0000 L CNN
F 2 "" H 8500 4500 50  0001 C CNN
F 3 "" H 8500 4500 50  0001 C CNN
	1    8500 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3750 5900 3600
Wire Wire Line
	5900 3600 6750 3600
Wire Wire Line
	6750 3600 6750 3750
Wire Wire Line
	6750 3600 7600 3600
Wire Wire Line
	7600 3600 7600 3750
Connection ~ 6750 3600
Wire Wire Line
	7600 3600 8400 3600
Wire Wire Line
	8400 3600 8400 3750
Connection ~ 7600 3600
Wire Wire Line
	5900 4550 5900 4450
Wire Wire Line
	5900 4450 6750 4450
Wire Wire Line
	6750 4450 6750 4550
Wire Wire Line
	6750 4450 7600 4450
Wire Wire Line
	7600 4450 7600 4550
Connection ~ 6750 4450
Wire Wire Line
	7600 4450 8400 4450
Wire Wire Line
	8400 4450 8400 4550
Connection ~ 7600 4450
Wire Wire Line
	6000 3750 6000 3550
Wire Wire Line
	6000 3550 6850 3550
Wire Wire Line
	6850 3550 6850 3750
Wire Wire Line
	6850 3550 7700 3550
Wire Wire Line
	7700 3550 7700 3750
Connection ~ 6850 3550
Wire Wire Line
	7700 3550 8500 3550
Wire Wire Line
	8500 3550 8500 3750
Connection ~ 7700 3550
Wire Wire Line
	6000 4550 6000 4400
Wire Wire Line
	6000 4400 6850 4400
Wire Wire Line
	6850 4400 6850 4550
Wire Wire Line
	6850 4400 7700 4400
Wire Wire Line
	7700 4400 7700 4550
Connection ~ 6850 4400
Wire Wire Line
	7700 4400 8500 4400
Wire Wire Line
	8500 4400 8500 4550
Connection ~ 7700 4400
Text GLabel 6850 3550 1    50   Input ~ 0
5V
Text GLabel 5900 3600 1    50   Input ~ 0
GND
Text GLabel 6850 4400 1    50   Input ~ 0
5V
Text GLabel 5900 4450 1    50   Input ~ 0
GND
Text GLabel 3100 3400 1    50   Input ~ 0
5V
Text GLabel 3200 3400 1    50   Input ~ 0
GND
Text GLabel 2400 4200 0    50   Input ~ 0
GND
Wire Wire Line
	3100 3650 3100 3400
Wire Wire Line
	3200 3400 3200 3650
Wire Wire Line
	3200 4200 3200 4400
Wire Wire Line
	3300 3650 3300 2900
Wire Wire Line
	3300 2900 8600 2900
Wire Wire Line
	8600 2900 8600 3750
Wire Wire Line
	3400 3650 3400 3050
Wire Wire Line
	3400 3050 7800 3050
Wire Wire Line
	7800 3050 7800 3750
Wire Wire Line
	6950 3750 6950 3200
Wire Wire Line
	6950 3200 3500 3200
Wire Wire Line
	3500 3200 3500 3650
Wire Wire Line
	3600 3650 3600 3300
Wire Wire Line
	3600 3300 6100 3300
Wire Wire Line
	6100 3300 6100 3750
Wire Wire Line
	4600 4400 4600 4200
Wire Wire Line
	4600 4200 6100 4200
Wire Wire Line
	6100 4200 6100 4550
Wire Wire Line
	4100 4400 4100 4150
Wire Wire Line
	4100 4150 6950 4150
Wire Wire Line
	6950 4150 6950 4550
Wire Wire Line
	7800 4550 7800 4100
Wire Wire Line
	7800 4100 4000 4100
Wire Wire Line
	4000 4100 4000 4400
Wire Wire Line
	3900 4400 3900 4050
Wire Wire Line
	3900 4050 8600 4050
Wire Wire Line
	8600 4050 8600 4550
$Comp
L minikame-rescue:Battery_Cell-Device BT1
U 1 1 5E78F400
P 2400 3850
F 0 "BT1" H 2518 3946 50  0000 L CNN
F 1 "Battery_Cell" H 2518 3855 50  0000 L CNN
F 2 "digikey-footprints:1210" V 2400 3910 50  0001 C CNN
F 3 "~" V 2400 3910 50  0001 C CNN
	1    2400 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3650 2400 3650
Connection ~ 3100 3650
Wire Wire Line
	2400 3950 2400 4200
Wire Wire Line
	2400 4200 3200 4200
$EndSCHEMATC
