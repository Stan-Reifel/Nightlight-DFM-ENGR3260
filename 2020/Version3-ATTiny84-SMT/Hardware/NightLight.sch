EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Design for Manufacturing - Night Light"
Date "8/11/2020"
Rev "Rev 1.2"
Comp "Olin College of Engineering"
Comment1 "Designed by S. Reifel"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C C1
U 1 1 5F330FB1
P 3550 2200
F 0 "C1" H 3665 2246 50  0000 L CNN
F 1 "100nf" H 3665 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3588 2050 50  0001 C CNN
F 3 "~" H 3550 2200 50  0001 C CNN
F 4 "C49678" H 3665 2109 50  0001 L CNN "Vendor"
	1    3550 2200
	1    0    0    -1  
$EndComp
$Comp
L @CustomSymbols:ISP_Connector J1
U 1 1 5F3349F8
P 8100 2350
F 0 "J1" H 8100 2740 50  0000 C CNN
F 1 "ISP Connector" H 8100 2649 50  0000 C CNN
F 2 "@CustomFootprints:ICSP" H 8000 2350 50  0001 C CNN
F 3 "" H 8000 2350 50  0001 C CNN
F 4 "DK: S2012EC-03-ND" H 8100 2350 50  0001 C CNN "Vendor"
	1    8100 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5F34ED23
P 3550 2350
F 0 "#PWR04" H 3550 2100 50  0001 C CNN
F 1 "GND" H 3555 2177 50  0001 C CNN
F 2 "" H 3550 2350 50  0001 C CNN
F 3 "" H 3550 2350 50  0001 C CNN
	1    3550 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5F36728A
P 8450 2600
F 0 "#PWR011" H 8450 2350 50  0001 C CNN
F 1 "GND" H 8455 2427 50  0001 C CNN
F 2 "" H 8450 2600 50  0001 C CNN
F 3 "" H 8450 2600 50  0001 C CNN
	1    8450 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1900 8450 2200
Wire Wire Line
	8450 2200 8300 2200
Wire Wire Line
	8450 2600 8450 2500
Wire Wire Line
	8450 2500 8300 2500
$Comp
L Device:Battery_Cell BT1
U 1 1 5F54829F
P 2450 6700
F 0 "BT1" H 2568 6796 50  0000 L CNN
F 1 "CR2032_Holder" V 2250 6450 50  0000 L CNN
F 2 "@CustomFootprints:BS_7_ND_for_CR2032" V 2450 6760 50  0001 C CNN
F 3 "~" V 2450 6760 50  0001 C CNN
F 4 "DK: BS-7-ND" H 2450 6700 50  0001 C CNN "Vendor"
	1    2450 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F548ADE
P 2450 6800
F 0 "#PWR02" H 2450 6550 50  0001 C CNN
F 1 "GND" H 2455 6627 50  0001 C CNN
F 2 "" H 2450 6800 50  0001 C CNN
F 3 "" H 2450 6800 50  0001 C CNN
	1    2450 6800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRLML2060 Q2
U 1 1 5F54DC6C
P 3500 6150
F 0 "Q2" H 3400 6300 50  0000 L CNN
F 1 "IRLML6244" V 3800 5950 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3700 6075 50  0001 L CIN
F 3 "" H 3500 6150 50  0001 L CNN
F 4 "C143946" H 3500 6150 50  0001 C CNN "Vendor"
	1    3500 6150
	-1   0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRLML6402 Q1
U 1 1 5F54F12B
P 2550 5850
F 0 "Q1" H 2450 6000 50  0000 L CNN
F 1 "IRLML2244" V 2825 5650 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2750 5775 50  0001 L CIN
F 3 "" H 2550 5850 50  0001 L CNN
F 4 "C169763" H 2550 5850 50  0001 C CNN "Vendor"
	1    2550 5850
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 5F55BD46
P 2800 6050
F 0 "R1" H 2868 6096 50  0000 L CNN
F 1 "1M" H 2868 6005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2840 6040 50  0001 C CNN
F 3 "~" H 2800 6050 50  0001 C CNN
F 4 "C17514" H 2800 6050 50  0001 C CNN "Vendor"
	1    2800 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 6200 2800 6250
Wire Wire Line
	2750 5850 2800 5850
Wire Wire Line
	2800 5850 2800 5900
$Comp
L power:VCC #PWR01
U 1 1 5F56084F
P 2450 5500
F 0 "#PWR01" H 2450 5350 50  0001 C CNN
F 1 "VCC" H 2465 5673 50  0000 C CNN
F 2 "" H 2450 5500 50  0001 C CNN
F 3 "" H 2450 5500 50  0001 C CNN
	1    2450 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5650 2450 5600
Wire Wire Line
	3400 5850 3400 5950
$Comp
L Device:R_US R2
U 1 1 5F567445
P 3750 6350
F 0 "R2" H 3818 6396 50  0000 L CNN
F 1 "1M" H 3818 6305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3790 6340 50  0001 C CNN
F 3 "~" H 3750 6350 50  0001 C CNN
F 4 "C17514" H 3750 6350 50  0001 C CNN "Vendor"
	1    3750 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6200 3750 6150
Wire Wire Line
	3750 6150 3700 6150
Wire Wire Line
	2800 5850 3400 5850
Connection ~ 2800 5850
$Comp
L Diode:1N4148W D1
U 1 1 5F574E93
P 4300 5850
F 0 "D1" H 4300 5633 50  0000 C CNN
F 1 "1N4148" H 4300 5724 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 4300 5675 50  0001 C CNN
F 3 "" H 4300 5850 50  0001 C CNN
F 4 "C81598" H 4300 5850 50  0001 C CNN "Vendor"
	1    4300 5850
	-1   0    0    1   
$EndComp
Wire Wire Line
	3400 6350 3400 6550
Wire Wire Line
	3750 6550 3750 6500
Wire Wire Line
	3750 6550 3400 6550
$Comp
L power:GND #PWR06
U 1 1 5F5814E0
P 3400 6650
F 0 "#PWR06" H 3400 6400 50  0001 C CNN
F 1 "GND" H 3405 6477 50  0001 C CNN
F 2 "" H 3400 6650 50  0001 C CNN
F 3 "" H 3400 6650 50  0001 C CNN
	1    3400 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 6550 3400 6650
Connection ~ 3400 6550
$Comp
L Switch:SW_Push SW1
U 1 1 5F5846DA
P 4600 6300
F 0 "SW1" V 4450 6350 50  0000 L CNN
F 1 "POWER" H 4500 6200 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 4600 6500 50  0001 C CNN
F 3 "~" H 4600 6500 50  0001 C CNN
F 4 "DK: EG1833-ND" V 4600 6300 50  0001 C CNN "Vendor"
	1    4600 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 5850 4450 5850
Wire Wire Line
	4150 5850 3400 5850
Connection ~ 3400 5850
$Comp
L power:GND #PWR07
U 1 1 5F587DE1
P 4600 6650
F 0 "#PWR07" H 4600 6400 50  0001 C CNN
F 1 "GND" H 4605 6477 50  0001 C CNN
F 2 "" H 4600 6650 50  0001 C CNN
F 3 "" H 4600 6650 50  0001 C CNN
	1    4600 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 6500 4600 6650
$Comp
L Diode:1N4148W D2
U 1 1 5F58CA89
P 4900 5850
F 0 "D2" H 4900 6067 50  0000 C CNN
F 1 "1N4148" H 4900 5976 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 5675 50  0001 C CNN
F 3 "" H 4900 5850 50  0001 C CNN
F 4 "C81598" H 4900 5850 50  0001 C CNN "Vendor"
	1    4900 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5850 4600 5850
Connection ~ 4600 5850
Text GLabel 3850 6150 2    40   Input ~ 0
KEEP_POWER_ON
Wire Wire Line
	3850 6150 3750 6150
Connection ~ 3750 6150
Text GLabel 5100 5850 2    40   Input ~ 0
POWER_BUTTON
Wire Wire Line
	4600 5850 4600 6100
Wire Wire Line
	5100 5850 5050 5850
$Comp
L power:VCC #PWR010
U 1 1 5F5B2891
P 8450 1900
F 0 "#PWR010" H 8450 1750 50  0001 C CNN
F 1 "VCC" H 8465 2073 50  0000 C CNN
F 2 "" H 8450 1900 50  0001 C CNN
F 3 "" H 8450 1900 50  0001 C CNN
	1    8450 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5F5B9F30
P 8100 4150
F 0 "D3" H 8100 4050 50  0000 C CNN
F 1 "White LED" H 8093 3986 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 8100 4150 50  0001 C CNN
F 3 "~" H 8100 4150 50  0001 C CNN
F 4 "DK: 1516-QBL7IW60D-WW-ND" H 8100 4150 50  0001 C CNN "Vendor"
	1    8100 4150
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper_NC_Small JP1
U 1 1 5F5FE6A6
P 2450 6400
F 0 "JP1" H 2450 6325 50  0000 C CNN
F 1 "Jumper_NC_Small" H 2450 6521 50  0001 C CNN
F 2 "@CustomFootprints:Jumper-Closed" H 2450 6400 50  0001 C CNN
F 3 "~" H 2450 6400 50  0001 C CNN
	1    2450 6400
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5F602A8D
P 2750 5550
F 0 "TP1" H 2808 5622 50  0000 L CNN
F 1 "VCCTestPoint" H 2808 5577 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 2950 5550 50  0001 C CNN
F 3 "~" H 2950 5550 50  0001 C CNN
	1    2750 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5600 2750 5600
Wire Wire Line
	2750 5600 2750 5550
Connection ~ 2450 5600
Wire Wire Line
	2450 5600 2450 5500
$Comp
L Connector:TestPoint TP2
U 1 1 5F60EB81
P 5200 6600
F 0 "TP2" H 5258 6672 50  0000 L CNN
F 1 "GndTestPoint" H 5258 6627 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 5400 6600 50  0001 C CNN
F 3 "~" H 5400 6600 50  0001 C CNN
	1    5200 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5F60F027
P 5200 6650
F 0 "#PWR08" H 5200 6400 50  0001 C CNN
F 1 "GND" H 5205 6477 50  0001 C CNN
F 2 "" H 5200 6650 50  0001 C CNN
F 3 "" H 5200 6650 50  0001 C CNN
	1    5200 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 6600 5200 6650
Text GLabel 4800 3550 2    40   Input ~ 0
POWER_BUTTON
$Comp
L Connector:TestPoint TP3
U 1 1 5F615269
P 2650 2750
F 0 "TP3" H 2708 2822 50  0000 L CNN
F 1 "D8TestPoint" H 2708 2777 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 2850 2750 50  0001 C CNN
F 3 "~" H 2850 2750 50  0001 C CNN
	1    2650 2750
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5F61A0E7
P 2650 3850
F 0 "SW2" H 2575 4025 50  0000 L CNN
F 1 "MODE" H 2550 3750 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 2650 4050 50  0001 C CNN
F 3 "~" H 2650 4050 50  0001 C CNN
F 4 "DK: EG1833-ND" V 2650 3850 50  0001 C CNN "Vendor"
	1    2650 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5F61DA74
P 2350 3950
F 0 "#PWR09" H 2350 3700 50  0001 C CNN
F 1 "GND" H 2355 3777 50  0001 C CNN
F 2 "" H 2350 3950 50  0001 C CNN
F 3 "" H 2350 3950 50  0001 C CNN
	1    2350 3950
	1    0    0    -1  
$EndComp
Text GLabel 4800 2950 2    40   Input ~ 0
KEEP_POWER_ON
Wire Wire Line
	2800 6250 2450 6250
Wire Wire Line
	2450 6250 2450 6300
Wire Wire Line
	2450 6050 2450 6250
Connection ~ 2450 6250
Text GLabel 7950 4150 0    40   Input ~ 0
LED_1
Text GLabel 7950 4450 0    40   Input ~ 0
LED_2
Text GLabel 7950 4750 0    40   Input ~ 0
LED_3
Text GLabel 7950 5050 0    40   Input ~ 0
LED_4
Text GLabel 7950 5350 0    40   Input ~ 0
LED_5
Text GLabel 7950 5650 0    40   Input ~ 0
LED_6
Text GLabel 4800 2850 2    40   Input ~ 0
LED_1
Text GLabel 4800 3150 2    40   Input ~ 0
LED_2
Text GLabel 4800 3250 2    40   Input ~ 0
LED_3
Text GLabel 4800 3650 2    40   Input ~ 0
LED_4
Text GLabel 4800 3050 2    40   Input ~ 0
LED_5
Text GLabel 4800 3450 2    40   Input ~ 0
LED_6
$Comp
L @CustomSymbols:ATtiny84A-PU U1
U 1 1 5F5CE8E9
P 4000 3250
F 0 "U1" H 4600 3900 50  0000 C CNN
F 1 "ATtiny44A-SSU" V 4000 3250 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4650 2550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc8006.pdf" H 4000 3250 50  0001 C CNN
F 4 "C412819" H 4000 3250 50  0001 C CNN "Vendor"
	1    4000 3250
	1    0    0    -1  
$EndComp
Text GLabel 7700 2200 0    40   Input ~ 0
MISO
Text GLabel 7700 2350 0    40   Input ~ 0
SCK
Text GLabel 7700 2500 0    40   Input ~ 0
~RST
Text GLabel 8450 2350 2    40   Input ~ 0
MOSI
Text GLabel 2400 3150 0    40   Input ~ 0
MISO
Text GLabel 2400 3000 0    40   Input ~ 0
SCK
Text GLabel 2400 3450 0    40   Input ~ 0
~RST
Text GLabel 2400 3300 0    40   Input ~ 0
MOSI
Wire Wire Line
	7900 2200 7700 2200
Wire Wire Line
	7700 2350 7900 2350
Wire Wire Line
	7900 2500 7700 2500
Wire Wire Line
	8300 2350 8450 2350
$Comp
L power:GND #PWR0101
U 1 1 5F5DF86D
P 4000 3950
F 0 "#PWR0101" H 4000 3700 50  0001 C CNN
F 1 "GND" H 4005 3777 50  0001 C CNN
F 2 "" H 4000 3950 50  0001 C CNN
F 3 "" H 4000 3950 50  0001 C CNN
	1    4000 3950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 5F5E0087
P 4000 1950
F 0 "#PWR0102" H 4000 1800 50  0001 C CNN
F 1 "VCC" H 4015 2123 50  0000 C CNN
F 2 "" H 4000 1950 50  0001 C CNN
F 3 "" H 4000 1950 50  0001 C CNN
	1    4000 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 5F5AB80F
P 8100 4450
F 0 "D4" H 8100 4350 50  0000 C CNN
F 1 "White LED" H 8093 4286 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 8100 4450 50  0001 C CNN
F 3 "~" H 8100 4450 50  0001 C CNN
F 4 "DK: 1516-QBL7IW60D-WW-ND" H 8100 4450 50  0001 C CNN "Vendor"
	1    8100 4450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D5
U 1 1 5F5ABB82
P 8100 4750
F 0 "D5" H 8100 4650 50  0000 C CNN
F 1 "White LED" H 8093 4586 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 8100 4750 50  0001 C CNN
F 3 "~" H 8100 4750 50  0001 C CNN
F 4 "DK: 1516-QBL7IW60D-WW-ND" H 8100 4750 50  0001 C CNN "Vendor"
	1    8100 4750
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 5F5ABEEF
P 8100 5050
F 0 "D6" H 8100 4950 50  0000 C CNN
F 1 "White LED" H 8093 4886 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 8100 5050 50  0001 C CNN
F 3 "~" H 8100 5050 50  0001 C CNN
F 4 "DK: 1516-QBL7IW60D-WW-ND" H 8100 5050 50  0001 C CNN "Vendor"
	1    8100 5050
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D7
U 1 1 5F5AC3AC
P 8100 5350
F 0 "D7" H 8100 5250 50  0000 C CNN
F 1 "White LED" H 8093 5186 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 8100 5350 50  0001 C CNN
F 3 "~" H 8100 5350 50  0001 C CNN
F 4 "DK: 1516-QBL7IW60D-WW-ND" H 8100 5350 50  0001 C CNN "Vendor"
	1    8100 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D8
U 1 1 5F5AC72B
P 8100 5650
F 0 "D8" H 8100 5550 50  0000 C CNN
F 1 "White LED" H 8093 5486 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 8100 5650 50  0001 C CNN
F 3 "~" H 8100 5650 50  0001 C CNN
F 4 "DK: 1516-QBL7IW60D-WW-ND" H 8100 5650 50  0001 C CNN "Vendor"
	1    8100 5650
	-1   0    0    1   
$EndComp
Wire Wire Line
	2850 3850 2900 3850
Wire Wire Line
	2900 3850 2900 3150
Wire Wire Line
	2900 3150 3200 3150
Wire Wire Line
	2900 3150 2400 3150
Connection ~ 2900 3150
Wire Wire Line
	2450 3850 2350 3850
Wire Wire Line
	2350 3850 2350 3950
Wire Wire Line
	2400 3000 2650 3000
Wire Wire Line
	2650 2750 2650 3000
Connection ~ 2650 3000
Wire Wire Line
	2650 3000 3200 3000
Wire Wire Line
	2400 3300 3200 3300
Wire Wire Line
	2400 3450 3200 3450
Wire Wire Line
	8400 5350 8400 5650
Connection ~ 8400 5350
Wire Wire Line
	8400 5050 8400 5350
Connection ~ 8400 5050
Wire Wire Line
	8400 4750 8400 5050
Connection ~ 8400 4750
Wire Wire Line
	8400 4450 8400 4750
Connection ~ 8400 4450
Wire Wire Line
	8400 4150 8400 4450
Wire Wire Line
	8250 5650 8400 5650
Wire Wire Line
	8250 5350 8400 5350
Wire Wire Line
	8250 5050 8400 5050
Wire Wire Line
	8250 4750 8400 4750
Wire Wire Line
	8250 4450 8400 4450
Wire Wire Line
	8250 4150 8400 4150
$Comp
L power:GND #PWR0103
U 1 1 5F5FB09C
P 8400 5800
F 0 "#PWR0103" H 8400 5550 50  0001 C CNN
F 1 "GND" H 8405 5627 50  0001 C CNN
F 2 "" H 8400 5800 50  0001 C CNN
F 3 "" H 8400 5800 50  0001 C CNN
	1    8400 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 5800 8400 5650
Connection ~ 8400 5650
Wire Wire Line
	4000 1950 4000 2050
Wire Wire Line
	3550 2050 4000 2050
Connection ~ 4000 2050
Wire Wire Line
	4000 2050 4000 2550
Text Notes 1100 7700 0    80   ~ 0
This board has beend designed to be fabricated at JLCPCB.COM
$EndSCHEMATC
