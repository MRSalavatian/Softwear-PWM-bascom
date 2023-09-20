$regfile = "m8def.dat"
$crystal = 8000000
'************************
$baud = 9600
Enable Interrupts
'************************
Config Timer0 = Timer , Prescale = 1
On Timer0 Tick
Enable Timer0
Stop Timer0
'************************

Config Portd = Output
'************************
Dim I As Word
Dim Ii As Word
'************************
start timer0
Do
   Waitms 100
   Toggle Portd.7

Loop
'************************
Tick:
   Toggle Portd.6
Return
'************************
