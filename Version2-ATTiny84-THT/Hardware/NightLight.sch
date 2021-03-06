EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Design for Manufacturing - Night Light"
Date "8/11/2020"
Rev "Rev 1.0"
Comp "Olin College of Engineering"
Comment1 "Designed by S. Reifel"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C C1
U 1 1 5F330FB1
P 3350 3200
F 0 "C1" H 3465 3246 50  0000 L CNN
F 1 "100nf" H 3465 3155 50  0000 L CNN
F 2 "@CustomFootprints:Cap_0.1_spacing" H 3388 3050 50  0001 C CNN
F 3 "~" H 3350 3200 50  0001 C CNN
F 4 "399-1249-1-ND" H 3465 3109 50  0001 L CNN "Vendor"
	1    3350 3200
	0    -1   -1   0   
$EndComp
$Comp
L @CustomSymbols:ISP_Connector J1
U 1 1 5F3349F8
P 3850 1800
F 0 "J1" H 3850 2190 50  0000 C CNN
F 1 "ISP Connector" H 3850 2099 50  0000 C CNN
F 2 "@CustomFootprints:ICSP" H 3750 1800 50  0001 C CNN
F 3 "" H 3750 1800 50  0001 C CNN
F 4 "S2012EC-03-ND" H 3850 1800 50  0001 C CNN "Vendor"
	1    3850 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5F34ED23
P 3050 3300
F 0 "#PWR04" H 3050 3050 50  0001 C CNN
F 1 "GND" H 3055 3127 50  0001 C CNN
F 2 "" H 3050 3300 50  0001 C CNN
F 3 "" H 3050 3300 50  0001 C CNN
	1    3050 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5F36728A
P 4200 2050
F 0 "#PWR011" H 4200 1800 50  0001 C CNN
F 1 "GND" H 4205 1877 50  0001 C CNN
F 2 "" H 4200 2050 50  0001 C CNN
F 3 "" H 4200 2050 50  0001 C CNN
	1    4200 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 1350 4200 1650
Wire Wire Line
	4200 1650 4050 1650
Wire Wire Line
	4200 2050 4200 1950
Wire Wire Line
	4200 1950 4050 1950
$Comp
L Device:Battery_Cell BT1
U 1 1 5F54829F
P 2150 7000
F 0 "BT1" H 2268 7096 50  0000 L CNN
F 1 "CR2032_Holder" V 1950 6750 50  0000 L CNN
F 2 "@CustomFootprints:BS_7_ND_for_CR2032" V 2150 7060 50  0001 C CNN
F 3 "~" V 2150 7060 50  0001 C CNN
F 4 "BS-7-ND" H 2150 7000 50  0001 C CNN "Vendor"
	1    2150 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F548ADE
P 2150 7100
F 0 "#PWR02" H 2150 6850 50  0001 C CNN
F 1 "GND" H 2155 6927 50  0001 C CNN
F 2 "" H 2150 7100 50  0001 C CNN
F 3 "" H 2150 7100 50  0001 C CNN
	1    2150 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NO_Small JP2
U 1 1 5F54B7A2
P 4200 1250
F 0 "JP2" V 4200 1298 50  0000 L CNN
F 1 "Jumper_NO_Small" V 4245 1298 50  0001 L CNN
F 2 "@CustomFootprints:Jumper" H 4200 1250 50  0001 C CNN
F 3 "~" H 4200 1250 50  0001 C CNN
	1    4200 1250
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRLML2060 Q2
U 1 1 5F54DC6C
P 3200 6450
F 0 "Q2" H 3100 6600 50  0000 L CNN
F 1 "IRLML6244" V 3500 6250 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3400 6375 50  0001 L CIN
F 3 "" H 3200 6450 50  0001 L CNN
F 4 "IRLML6244TRPBFCT-ND" H 3200 6450 50  0001 C CNN "Vendor"
	1    3200 6450
	-1   0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRLML6402 Q1
U 1 1 5F54F12B
P 2250 6150
F 0 "Q1" H 2150 6300 50  0000 L CNN
F 1 "IRLML2244" V 2525 5950 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2450 6075 50  0001 L CIN
F 3 "" H 2250 6150 50  0001 L CNN
F 4 "IRLML2244TRPBFCT-ND" H 2250 6150 50  0001 C CNN "Vendor"
	1    2250 6150
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 5F55BD46
P 2500 6350
F 0 "R1" H 2568 6396 50  0000 L CNN
F 1 "1M" H 2568 6305 50  0000 L CNN
F 2 "@CustomFootprints:Resistor_0.125W" V 2540 6340 50  0001 C CNN
F 3 "~" H 2500 6350 50  0001 C CNN
F 4 "CF18JT1M00CT-ND" H 2500 6350 50  0001 C CNN "Vendor"
	1    2500 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6500 2500 6550
Wire Wire Line
	2450 6150 2500 6150
Wire Wire Line
	2500 6150 2500 6200
$Comp
L power:VCC #PWR01
U 1 1 5F56084F
P 2150 5800
F 0 "#PWR01" H 2150 5650 50  0001 C CNN
F 1 "VCC" H 2165 5973 50  0000 C CNN
F 2 "" H 2150 5800 50  0001 C CNN
F 3 "" H 2150 5800 50  0001 C CNN
	1    2150 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5950 2150 5900
Wire Wire Line
	3100 6150 3100 6250
$Comp
L Device:R_US R2
U 1 1 5F567445
P 3450 6650
F 0 "R2" H 3518 6696 50  0000 L CNN
F 1 "1M" H 3518 6605 50  0000 L CNN
F 2 "@CustomFootprints:Resistor_0.125W" V 3490 6640 50  0001 C CNN
F 3 "~" H 3450 6650 50  0001 C CNN
F 4 "CF18JT1M00CT-ND" H 3450 6650 50  0001 C CNN "Vendor"
	1    3450 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6500 3450 6450
Wire Wire Line
	3450 6450 3400 6450
Wire Wire Line
	2500 6150 3100 6150
Connection ~ 2500 6150
$Comp
L Diode:1N4148W D1
U 1 1 5F574E93
P 4000 6150
F 0 "D1" H 4000 5933 50  0000 C CNN
F 1 "1N4148" H 4000 6024 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4000 5975 50  0001 C CNN
F 3 "" H 4000 6150 50  0001 C CNN
F 4 "1N4148FS-ND " H 4000 6150 50  0001 C CNN "Vendor"
	1    4000 6150
	-1   0    0    1   
$EndComp
Wire Wire Line
	3100 6650 3100 6850
Wire Wire Line
	3450 6850 3450 6800
Wire Wire Line
	3450 6850 3100 6850
$Comp
L power:GND #PWR06
U 1 1 5F5814E0
P 3100 6950
F 0 "#PWR06" H 3100 6700 50  0001 C CNN
F 1 "GND" H 3105 6777 50  0001 C CNN
F 2 "" H 3100 6950 50  0001 C CNN
F 3 "" H 3100 6950 50  0001 C CNN
	1    3100 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 6850 3100 6950
Connection ~ 3100 6850
$Comp
L Switch:SW_Push SW1
U 1 1 5F5846DA
P 4300 6600
F 0 "SW1" V 4150 6650 50  0000 L CNN
F 1 "POWER" H 4200 6500 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 4300 6800 50  0001 C CNN
F 3 "~" H 4300 6800 50  0001 C CNN
F 4 "EG1833-ND" V 4300 6600 50  0001 C CNN "Vendor"
	1    4300 6600
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 6150 4150 6150
Wire Wire Line
	3850 6150 3100 6150
Connection ~ 3100 6150
$Comp
L power:GND #PWR07
U 1 1 5F587DE1
P 4300 6950
F 0 "#PWR07" H 4300 6700 50  0001 C CNN
F 1 "GND" H 4305 6777 50  0001 C CNN
F 2 "" H 4300 6950 50  0001 C CNN
F 3 "" H 4300 6950 50  0001 C CNN
	1    4300 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6800 4300 6950
$Comp
L Diode:1N4148W D2
U 1 1 5F58CA89
P 4600 6150
F 0 "D2" H 4600 6367 50  0000 C CNN
F 1 "1N4148" H 4600 6276 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4600 5975 50  0001 C CNN
F 3 "" H 4600 6150 50  0001 C CNN
F 4 "1N4148FS-ND " H 4600 6150 50  0001 C CNN "Vendor"
	1    4600 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 6150 4300 6150
Connection ~ 4300 6150
Text GLabel 3550 6450 2    40   Input ~ 0
KEEP_POWER_ON
Wire Wire Line
	3550 6450 3450 6450
Connection ~ 3450 6450
Text GLabel 4800 6150 2    40   Input ~ 0
POWER_BUTTON
Wire Wire Line
	4300 6150 4300 6400
Wire Wire Line
	4800 6150 4750 6150
$Comp
L power:VCC #PWR010
U 1 1 5F5B2891
P 4200 1150
F 0 "#PWR010" H 4200 1000 50  0001 C CNN
F 1 "VCC" H 4215 1323 50  0000 C CNN
F 2 "" H 4200 1150 50  0001 C CNN
F 3 "" H 4200 1150 50  0001 C CNN
	1    4200 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5F5B9F30
P 7800 3250
F 0 "D3" H 7800 3150 50  0000 C CNN
F 1 "White LED" H 7793 3086 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 7800 3250 50  0001 C CNN
F 3 "~" H 7800 3250 50  0001 C CNN
F 4 "1516-QBL7IW60D-WW-ND" H 7800 3250 50  0001 C CNN "Vendor"
	1    7800 3250
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper_NC_Small JP1
U 1 1 5F5FE6A6
P 2150 6700
F 0 "JP1" H 2150 6625 50  0000 C CNN
F 1 "Jumper_NC_Small" H 2150 6821 50  0001 C CNN
F 2 "@CustomFootprints:Jumper-Closed" H 2150 6700 50  0001 C CNN
F 3 "~" H 2150 6700 50  0001 C CNN
	1    2150 6700
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5F602A8D
P 2450 5850
F 0 "TP1" H 2508 5922 50  0000 L CNN
F 1 "VCCTestPoint" H 2508 5877 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 2650 5850 50  0001 C CNN
F 3 "~" H 2650 5850 50  0001 C CNN
	1    2450 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5900 2450 5900
Wire Wire Line
	2450 5900 2450 5850
Connection ~ 2150 5900
Wire Wire Line
	2150 5900 2150 5800
$Comp
L Connector:TestPoint TP2
U 1 1 5F60EB81
P 4900 6900
F 0 "TP2" H 4958 6972 50  0000 L CNN
F 1 "GndTestPoint" H 4958 6927 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 5100 6900 50  0001 C CNN
F 3 "~" H 5100 6900 50  0001 C CNN
	1    4900 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5F60F027
P 4900 6950
F 0 "#PWR08" H 4900 6700 50  0001 C CNN
F 1 "GND" H 4905 6777 50  0001 C CNN
F 2 "" H 4900 6950 50  0001 C CNN
F 3 "" H 4900 6950 50  0001 C CNN
	1    4900 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6900 4900 6950
Text GLabel 4650 4450 2    40   Input ~ 0
POWER_BUTTON
$Comp
L Connector:TestPoint TP3
U 1 1 5F615269
P 2500 3650
F 0 "TP3" H 2558 3722 50  0000 L CNN
F 1 "D8TestPoint" H 2558 3677 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 2700 3650 50  0001 C CNN
F 3 "~" H 2700 3650 50  0001 C CNN
	1    2500 3650
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5F61A0E7
P 2500 4750
F 0 "SW2" H 2425 4925 50  0000 L CNN
F 1 "MODE" H 2400 4650 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 2500 4950 50  0001 C CNN
F 3 "~" H 2500 4950 50  0001 C CNN
F 4 "EG1833-ND" V 2500 4750 50  0001 C CNN "Vendor"
	1    2500 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5F61DA74
P 2200 4850
F 0 "#PWR09" H 2200 4600 50  0001 C CNN
F 1 "GND" H 2205 4677 50  0001 C CNN
F 2 "" H 2200 4850 50  0001 C CNN
F 3 "" H 2200 4850 50  0001 C CNN
	1    2200 4850
	1    0    0    -1  
$EndComp
Text GLabel 4650 3850 2    40   Input ~ 0
KEEP_POWER_ON
Wire Wire Line
	2500 6550 2150 6550
Wire Wire Line
	2150 6550 2150 6600
Wire Wire Line
	2150 6350 2150 6550
Connection ~ 2150 6550
Wire Wire Line
	7950 3250 8150 3250
Wire Wire Line
	8150 3550 7950 3550
Wire Wire Line
	7950 3850 8150 3850
Wire Wire Line
	8150 4150 7950 4150
Wire Wire Line
	7950 4450 8150 4450
Wire Wire Line
	8150 4750 7950 4750
Text GLabel 7650 3250 0    40   Input ~ 0
LED_1
Text GLabel 7650 3550 0    40   Input ~ 0
LED_2
Text GLabel 7650 3850 0    40   Input ~ 0
LED_3
Text GLabel 7650 4150 0    40   Input ~ 0
LED_4
Text GLabel 7650 4450 0    40   Input ~ 0
LED_5
Text GLabel 7650 4750 0    40   Input ~ 0
LED_6
Text GLabel 4650 3750 2    40   Input ~ 0
LED_1
Text GLabel 4650 4050 2    40   Input ~ 0
LED_2
Text GLabel 4650 4150 2    40   Input ~ 0
LED_3
Text GLabel 4650 4550 2    40   Input ~ 0
LED_4
Text GLabel 4650 3950 2    40   Input ~ 0
LED_5
Text GLabel 4650 4350 2    40   Input ~ 0
LED_6
$Comp
L @CustomSymbols:ATtiny84A-PU U1
U 1 1 5F5CE8E9
P 3850 4150
F 0 "U1" H 4450 4800 50  0000 C CNN
F 1 "ATtiny84A-PU" V 3850 4150 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4500 3450 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc8006.pdf" H 3850 4150 50  0001 C CNN
F 4 "ATTINY84A-PU-ND" H 3850 4150 50  0001 C CNN "Vendor"
	1    3850 4150
	1    0    0    -1  
$EndComp
Text GLabel 3450 1650 0    40   Input ~ 0
MISO
Text GLabel 3450 1800 0    40   Input ~ 0
SCK
Text GLabel 3450 1950 0    40   Input ~ 0
~RST
Text GLabel 4200 1800 2    40   Input ~ 0
MOSI
Text GLabel 2250 4050 0    40   Input ~ 0
MISO
Text GLabel 2250 3900 0    40   Input ~ 0
SCK
Text GLabel 2250 4350 0    40   Input ~ 0
~RST
Text GLabel 2250 4200 0    40   Input ~ 0
MOSI
Wire Wire Line
	3650 1650 3450 1650
Wire Wire Line
	3450 1800 3650 1800
Wire Wire Line
	3650 1950 3450 1950
Wire Wire Line
	4050 1800 4200 1800
$Comp
L power:GND #PWR0101
U 1 1 5F5DF86D
P 3850 4850
F 0 "#PWR0101" H 3850 4600 50  0001 C CNN
F 1 "GND" H 3855 4677 50  0001 C CNN
F 2 "" H 3850 4850 50  0001 C CNN
F 3 "" H 3850 4850 50  0001 C CNN
	1    3850 4850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 5F5E0087
P 3850 3050
F 0 "#PWR0102" H 3850 2900 50  0001 C CNN
F 1 "VCC" H 3865 3223 50  0000 C CNN
F 2 "" H 3850 3050 50  0001 C CNN
F 3 "" H 3850 3050 50  0001 C CNN
	1    3850 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3050 3850 3200
Wire Wire Line
	3850 3200 3500 3200
Connection ~ 3850 3200
Wire Wire Line
	3850 3200 3850 3450
Wire Wire Line
	3200 3200 3050 3200
Wire Wire Line
	3050 3200 3050 3300
Wire Wire Line
	8500 4450 8500 4750
Connection ~ 8500 4450
Wire Wire Line
	8500 4150 8500 4450
Connection ~ 8500 4150
Wire Wire Line
	8500 3850 8500 4150
Connection ~ 8500 3850
Wire Wire Line
	8500 3550 8500 3850
Connection ~ 8500 3550
Wire Wire Line
	8500 3250 8500 3550
Wire Wire Line
	8350 4750 8500 4750
Wire Wire Line
	8350 4450 8500 4450
Wire Wire Line
	8350 4150 8500 4150
Wire Wire Line
	8350 3850 8500 3850
Wire Wire Line
	8350 3550 8500 3550
Wire Wire Line
	8350 3250 8500 3250
$Comp
L Device:Jumper_NC_Small JP8
U 1 1 5F5CA473
P 8250 4750
F 0 "JP8" H 8250 4850 50  0000 C CNN
F 1 "Jumper_NC_Small" H 8250 4871 50  0001 C CNN
F 2 "@CustomFootprints:Jumper-Closed" H 8250 4750 50  0001 C CNN
F 3 "~" H 8250 4750 50  0001 C CNN
	1    8250 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP7
U 1 1 5F5C80FC
P 8250 4450
F 0 "JP7" H 8250 4550 50  0000 C CNN
F 1 "Jumper_NC_Small" H 8250 4571 50  0001 C CNN
F 2 "@CustomFootprints:Jumper-Closed" H 8250 4450 50  0001 C CNN
F 3 "~" H 8250 4450 50  0001 C CNN
	1    8250 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP6
U 1 1 5F5C621A
P 8250 4150
F 0 "JP6" H 8250 4250 50  0000 C CNN
F 1 "Jumper_NC_Small" H 8250 4271 50  0001 C CNN
F 2 "@CustomFootprints:Jumper-Closed" H 8250 4150 50  0001 C CNN
F 3 "~" H 8250 4150 50  0001 C CNN
	1    8250 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP5
U 1 1 5F5C3F39
P 8250 3850
F 0 "JP5" H 8250 3950 50  0000 C CNN
F 1 "Jumper_NC_Small" H 8250 3971 50  0001 C CNN
F 2 "@CustomFootprints:Jumper-Closed" H 8250 3850 50  0001 C CNN
F 3 "~" H 8250 3850 50  0001 C CNN
	1    8250 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP4
U 1 1 5F5C250A
P 8250 3550
F 0 "JP4" H 8250 3650 50  0000 C CNN
F 1 "Jumper_NC_Small" H 8250 3671 50  0001 C CNN
F 2 "@CustomFootprints:Jumper-Closed" H 8250 3550 50  0001 C CNN
F 3 "~" H 8250 3550 50  0001 C CNN
	1    8250 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP3
U 1 1 5F5BB05A
P 8250 3250
F 0 "JP3" H 8250 3350 50  0000 C CNN
F 1 "Jumper_NC_Small" H 8250 3371 50  0001 C CNN
F 2 "@CustomFootprints:Jumper-Closed" H 8250 3250 50  0001 C CNN
F 3 "~" H 8250 3250 50  0001 C CNN
	1    8250 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5F5FB09C
P 8500 4900
F 0 "#PWR0103" H 8500 4650 50  0001 C CNN
F 1 "GND" H 8505 4727 50  0001 C CNN
F 2 "" H 8500 4900 50  0001 C CNN
F 3 "" H 8500 4900 50  0001 C CNN
	1    8500 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4900 8500 4750
Connection ~ 8500 4750
$Comp
L Device:LED D4
U 1 1 5F5AB80F
P 7800 3550
F 0 "D4" H 7800 3450 50  0000 C CNN
F 1 "White LED" H 7793 3386 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 7800 3550 50  0001 C CNN
F 3 "~" H 7800 3550 50  0001 C CNN
F 4 "1516-QBL7IW60D-WW-ND" H 7800 3550 50  0001 C CNN "Vendor"
	1    7800 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D5
U 1 1 5F5ABB82
P 7800 3850
F 0 "D5" H 7800 3750 50  0000 C CNN
F 1 "White LED" H 7793 3686 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 7800 3850 50  0001 C CNN
F 3 "~" H 7800 3850 50  0001 C CNN
F 4 "1516-QBL7IW60D-WW-ND" H 7800 3850 50  0001 C CNN "Vendor"
	1    7800 3850
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 5F5ABEEF
P 7800 4150
F 0 "D6" H 7800 4050 50  0000 C CNN
F 1 "White LED" H 7793 3986 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 7800 4150 50  0001 C CNN
F 3 "~" H 7800 4150 50  0001 C CNN
F 4 "1516-QBL7IW60D-WW-ND" H 7800 4150 50  0001 C CNN "Vendor"
	1    7800 4150
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D7
U 1 1 5F5AC3AC
P 7800 4450
F 0 "D7" H 7800 4350 50  0000 C CNN
F 1 "White LED" H 7793 4286 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 7800 4450 50  0001 C CNN
F 3 "~" H 7800 4450 50  0001 C CNN
F 4 "1516-QBL7IW60D-WW-ND" H 7800 4450 50  0001 C CNN "Vendor"
	1    7800 4450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D8
U 1 1 5F5AC72B
P 7800 4750
F 0 "D8" H 7800 4650 50  0000 C CNN
F 1 "White LED" H 7793 4586 50  0001 C CNN
F 2 "@CustomFootprints:LED_D3.0mm" H 7800 4750 50  0001 C CNN
F 3 "~" H 7800 4750 50  0001 C CNN
F 4 "1516-QBL7IW60D-WW-ND" H 7800 4750 50  0001 C CNN "Vendor"
	1    7800 4750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2700 4750 2750 4750
Wire Wire Line
	2750 4750 2750 4050
Wire Wire Line
	2750 4050 3050 4050
Wire Wire Line
	2750 4050 2250 4050
Connection ~ 2750 4050
Wire Wire Line
	2300 4750 2200 4750
Wire Wire Line
	2200 4750 2200 4850
Wire Wire Line
	2250 3900 2500 3900
Wire Wire Line
	2500 3650 2500 3900
Connection ~ 2500 3900
Wire Wire Line
	2500 3900 3050 3900
Wire Wire Line
	2250 4200 3050 4200
Wire Wire Line
	2250 4350 3050 4350
$EndSCHEMATC
