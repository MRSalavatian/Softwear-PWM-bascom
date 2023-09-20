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
Sh_cp Alias Portd.2
Ds Alias Portd.3
St_cp Alias Portd.4

Config Sh_cp = Output
Config Ds = Output
Config St_cp = Output
'************************
Up Alias Pinc.0
Down Alias Pinc.1
Ok Alias Pinc.2
Printt Alias Pinc.3

Config Up = Input
Config Down = Input
Config Ok = Input
Config Printt = Input

Config Portd = Output
'************************
Dim I As Word
Dim Ii As Word

Dim Pwm(32) As Byte
Dim Outt(4) As Byte

const max_pwm=10
'************************
Stop Timer0
Do
   Gosub Shift_out
Loop

Do

   If Up = 1 Then Incr Outt(1)
   If Down = 1 Then Decr Outt(1)
   If Ok = 1 Then Gosub Shift_out
   If Printt = 1 Then Print Bin(outt(1))

   Waitms 50

Loop
'************************
Shift_out:
Portd.7 = 1
   Shiftout Ds , Sh_cp , Outt(1) , 1
   Shiftout Ds , Sh_cp , Outt(2) , 1
   Shiftout Ds , Sh_cp , Outt(3) , 1
   Shiftout Ds , Sh_cp , Outt(4) , 1
   St_cp = 0
   St_cp = 1
   Portd.7 = 0
Return
'************************
Tick:

   If Pwm(1) = 10 Then
      Outt(1).0 = 1
      Pwm(1) = 0
   Else
      Outt(1).0 = 0
   End If







Return
'************************
