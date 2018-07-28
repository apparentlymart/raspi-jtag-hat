EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_02X10 P3
U 1 1 5B5BF489
P 5700 3000
F 0 "P3" H 5700 3550 50  0000 C CNN
F 1 "JTAG" V 5700 3000 50  0000 C CNN
F 2 "" H 5700 1800 50  0000 C CNN
F 3 "" H 5700 1800 50  0000 C CNN
	1    5700 3000
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X20 P2
U 1 1 5B5BF525
P 4250 3050
F 0 "P2" H 4250 4100 50  0000 C CNN
F 1 "RASPI" V 4250 3050 50  0000 C CNN
F 2 "" H 4250 2100 50  0000 C CNN
F 3 "" H 4250 2100 50  0000 C CNN
	1    4250 3050
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P1
U 1 1 5B5BF55E
P 2800 2900
F 0 "P1" H 2800 3250 50  0000 C CNN
F 1 "FTDIUART" V 2900 2900 50  0000 C CNN
F 2 "" H 2800 2900 50  0000 C CNN
F 3 "" H 2800 2900 50  0000 C CNN
	1    2800 2900
	1    0    0    -1  
$EndComp
Text Label 4000 2100 2    60   ~ 0
+3V3
Text Label 4000 2800 2    60   ~ 0
TRST
Text Label 4000 3900 2    60   ~ 0
TDI
Text Label 4000 2700 2    60   ~ 0
TMS
Text Label 4500 3100 0    60   ~ 0
TCK
Text Label 4500 2800 0    60   ~ 0
RTCK
Text Label 4500 2900 0    60   ~ 0
TDO
Text Label 4650 2100 0    60   ~ 0
+5V
Wire Wire Line
	4500 2100 4650 2100
Wire Wire Line
	4500 2200 4600 2200
Wire Wire Line
	4600 2200 4600 2100
Connection ~ 4600 2100
Text Label 4500 2300 0    60   ~ 0
GND
Text Label 4500 2700 0    60   ~ 0
GND
Text Label 4500 3000 0    60   ~ 0
GND
Text Label 4500 3500 0    60   ~ 0
GND
Text Label 4500 3700 0    60   ~ 0
GND
Text Label 4000 4000 2    60   ~ 0
GND
Text Label 4000 3300 2    60   ~ 0
GND
Text Label 4000 2500 2    60   ~ 0
GND
Text Label 4000 3400 2    60   ~ 0
ID_SD
Text Label 4500 3400 0    60   ~ 0
ID_SC
Text Label 4500 2400 0    60   ~ 0
PI_TXD
Text Label 4500 2500 0    60   ~ 0
PI_RXD
Text Label 4000 2200 2    60   ~ 0
SD
Text Label 4000 2300 2    60   ~ 0
SC
Text Label 5450 2550 2    60   ~ 0
+3V3
Text Label 5450 2650 2    60   ~ 0
TRST
Text Label 5450 2750 2    60   ~ 0
TDI
Text Label 5450 2850 2    60   ~ 0
TMS
Text Label 5450 2950 2    60   ~ 0
TCK
Text Label 5450 3050 2    60   ~ 0
RTCK
Text Label 5450 3150 2    60   ~ 0
TDO
Text Label 5450 3250 2    60   ~ 0
~SRST
Text Label 5450 3350 2    60   ~ 0
DBGRQ
Text Label 5450 3450 2    60   ~ 0
DBGACK
Text Label 5950 2650 0    60   ~ 0
GND
Text Label 5950 2750 0    60   ~ 0
GND
Text Label 5950 2850 0    60   ~ 0
GND
Text Label 5950 2950 0    60   ~ 0
GND
Text Label 5950 3050 0    60   ~ 0
GND
Text Label 5950 3150 0    60   ~ 0
GND
Text Label 5950 3250 0    60   ~ 0
GND
Text Label 5950 3350 0    60   ~ 0
GND
Text Label 5950 3450 0    60   ~ 0
GND
$Comp
L CONN_02X04 P4
U 1 1 5B5BF9C2
P 7000 2950
F 0 "P4" H 7000 3200 50  0000 C CNN
F 1 "PWRUTIL" H 7000 2700 50  0000 C CNN
F 2 "" H 7000 1750 50  0000 C CNN
F 3 "" H 7000 1750 50  0000 C CNN
	1    7000 2950
	1    0    0    -1  
$EndComp
Text Label 7250 2800 0    60   ~ 0
+5V
Text Label 6750 2800 2    60   ~ 0
+5V
Text Label 6750 3100 2    60   ~ 0
+3V3
Text Label 7250 3100 0    60   ~ 0
+3V3
Text Label 7250 2900 0    60   ~ 0
GND
Text Label 7250 3000 0    60   ~ 0
GND
Text Label 6750 2900 2    60   ~ 0
GND
Text Label 6750 3000 2    60   ~ 0
GND
Text Label 2600 2650 2    60   ~ 0
GND
Text Label 2600 2750 2    60   ~ 0
CTS
Text Label 2600 2850 2    60   ~ 0
HOST+5V
Text Label 2600 2950 2    60   ~ 0
PI_RXD
Text Label 2600 3050 2    60   ~ 0
PI_TXD
Text Label 2600 3150 2    60   ~ 0
RTS
Text Label 5950 2550 0    60   ~ 0
VSUPPLY
$Comp
L CONN_02X02 P5
U 1 1 5B5BFE33
P 7000 3750
F 0 "P5" H 7000 3900 50  0000 C CNN
F 1 "I2C" H 7000 3600 50  0000 C CNN
F 2 "" H 7000 2550 50  0000 C CNN
F 3 "" H 7000 2550 50  0000 C CNN
	1    7000 3750
	1    0    0    -1  
$EndComp
Text Label 6750 3700 2    60   ~ 0
SD
Text Label 6750 3800 2    60   ~ 0
SC
Text Label 7250 3700 0    60   ~ 0
+3V3
Text Label 7250 3800 0    60   ~ 0
GND
$EndSCHEMATC
